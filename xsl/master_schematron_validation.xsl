<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math"
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" 
  exclude-result-prefixes="#all"
  xmlns:xh="http://www.w3.org/1999/xhtml" 
  xpath-default-namespace="http://www.w3.org/1999/xhtml"
  xmlns:svrl="http://purl.oclc.org/dsdl/svrl" 
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> Dec 29, 2025</xd:p>
      <xd:p><xd:b>Author:</xd:b> mholmes, based on an original example by jtakeda.</xd:p>
      <xd:p>The purpose of this library is to do comprehensive Schematron validation of a collection
        of documents based on the parameter of a source folder, along with the optional parameter of
        a subset of document ids, in a single process whereby the compiled Schematron is applied to
        each document and the result saved in a variable, then another Schematron process is applied
        to the result to harvest out errors, and if an error is found, the process terminates with a
        message. This is designed to be a faster way to process many files through Schematron
        validation, rather than a multi-stage process where results are saved out to disk and then
        post-processed.</xd:p>

      <xd:p>This file runs on itself, and all required resources are loaded dynamically based on
        input parameters.</xd:p>
    </xd:desc>
  </xd:doc>

  <xd:doc>
    <xd:desc>We only output messages, so just text.</xd:desc>
  </xd:doc>
  <xsl:output method="text" encoding="UTF-8"/>

  <!-- First we figure out where we are and where we want to load and save things from.
       The input document is the always an XSL file in the xsl/ folder. -->
  <xd:doc scope="component">
    <xd:desc><xd:ref name="docUri">docUri</xd:ref> is where the source document is.</xd:desc>
  </xd:doc>
  <xsl:variable name="docUri" select="base-uri(/)"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="docDir">docDir</xd:ref> is the folder where the input document
      is.</xd:desc>
  </xd:doc>
  <xsl:variable name="docDir" select="replace($docUri, '[^/]+$', '')"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="baseDir">baseDir</xd:ref> is the root folder of the entire
      project.</xd:desc>
  </xd:doc>
  <xsl:param name="baseDir" select="resolve-uri('../', $docDir)"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="compiledSchFile">compiledSchFile</xd:ref> is the compiled XSLT from the
      Schematron file.</xd:desc>
  </xd:doc>
  <xsl:param name="compiledSchFile" select="resolve-uri('data/schema/schema.xsl', $baseDir)"/>

  <xd:doc>
    <xd:desc>This is the root template that does all the work.</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <xsl:message>Beginning Schematron validation...</xsl:message>
    <!-- First we'll check that we have some XML files. -->
    <xsl:variable name="filesToValidate" as="document-node()+" select="(collection($baseDir || '/data/?select=*.xml;recurse=no'), doc($baseDir || '/boilerplate/page_template.xml'), collection($baseDir || '/templates/?select=*.xm_;recurse=no'))"/>
    

    <xsl:if test="count($filesToValidate) lt 1">
      <xsl:message terminate="yes">ERROR: F.</xsl:message>
    </xsl:if>

    <xsl:if test="not(doc-available($compiledSchFile))">
      <xsl:message terminate="yes">ERROR: Unable to find the compiled Schematron at <xsl:value-of
          select="$compiledSchFile"/>.</xsl:message>
    </xsl:if>

    <xsl:variable name="sch" select="doc($compiledSchFile)"/>

    <xsl:message>Files to validate: <xsl:value-of select="count($filesToValidate)"/></xsl:message>
    <xsl:message>Validating with <xsl:value-of select="$compiledSchFile"/>...</xsl:message>

    <xsl:variable name="errorMap" as="map(xs:string, element()+)">
      <xsl:map>
        <xsl:for-each select="$filesToValidate">
          <xsl:variable name="currDoc" select="."/>
          <xsl:variable name="id" select="tokenize(base-uri($currDoc), '[\\/]+')[last()]"/>
          <xsl:message>Validating <xsl:value-of select="$id"/></xsl:message>
          <xsl:variable name="result" select="
              transform(map {
                'stylesheet-node': $sch,
                'source-node': $currDoc
              })?output"/>
          <xsl:variable name="failed-asserts" select="$result//svrl:failed-assert"
            as="element(svrl:failed-assert)*"/>
          <xsl:variable name="successful-reports" select="$result//svrl:successful-report"
            as="element(svrl:successful-report)*"/>
          <xsl:variable name="errors" select="($failed-asserts, $successful-reports)"
            as="element()*"/>
          <xsl:if test="not(empty($errors))">
            <xsl:map-entry key="$id" select="$errors"/>
          </xsl:if>
        </xsl:for-each>
      </xsl:map>
    </xsl:variable>

    <xsl:variable name="size" select="map:size($errorMap)"/>

    <xsl:choose>
      <xsl:when test="$size gt 0">
        <xsl:for-each select="map:keys($errorMap)">
          <xsl:message>
            <xsl:text>&#xA;</xsl:text>
          </xsl:message>
          <xsl:variable name="key" select="."/>
          <xsl:variable name="entry" select="$errorMap($key)"/>
          <xsl:message><xsl:value-of select="$key"/>:</xsl:message>
          <xsl:for-each select="$entry">
            <xsl:message>
              <xsl:text>&#x9;</xsl:text>
              <xsl:text>* </xsl:text>
              <xsl:value-of select="normalize-space(svrl:text)"/>
            </xsl:message>
          </xsl:for-each>
          <xsl:message>
            <xsl:text>&#xA;</xsl:text>
          </xsl:message>
        </xsl:for-each>
        <xsl:message _terminate="yes">Validation failed. Messages are provided above.</xsl:message>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message>
          <xsl:text>&#xA;</xsl:text>
        </xsl:message>
        <xsl:message>Files successfully validated: <xsl:value-of select="count($filesToValidate)"
          />.</xsl:message>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


</xsl:stylesheet>

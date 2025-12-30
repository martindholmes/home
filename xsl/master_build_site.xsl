<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="#all" xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns:hcmc="http://hcmc.uvic.ca/ns"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> 2025-12-29.</xd:p>
      <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
      <xd:p>This is the main site build driver file.</xd:p>
    </xd:desc>
  </xd:doc>

  <xd:doc>
    <xd:desc>Include the modules we need.</xd:desc>
  </xd:doc>
  <xsl:include href="module_globals.xsl"/>
  <!--<xsl:include href="module_functions.xsl"/>
  <xsl:include href="module_templates.xsl"/>-->

  <xd:doc>
    <xd:desc>Our mode is basically identity transform, since we're going from HTML to
      HTML.</xd:desc>
  </xd:doc>
  <xsl:mode name="html" on-no-match="shallow-copy"/>

  <xd:doc>
    <xd:desc>We're producing XHTML5 pages from XHTML5 sources.</xd:desc>
  </xd:doc>
  <xsl:output method="xhtml" html-version="5" encoding="UTF-8" omit-xml-declaration="yes"
    normalization-form="NFC" indent="no" exclude-result-prefixes="#all" include-content-type="no"/>

  <xd:doc>
    <xd:desc>The root template handles loading and processing files.</xd:desc>
  </xd:doc>
  <xsl:template match="/">
    <xsl:message>Building the website...</xsl:message>

    <!-- First we process each of the main site pages. -->
    <xsl:for-each select="$dataDocs">
      <xsl:variable name="currPageId" as="xs:string" select="xs:string(main/@id)"/>
      <xsl:result-document href="{$baseDir}products/{$currPageId}.html">
        <xsl:apply-templates mode="html" select="$sitePageTemplate">
          <xsl:with-param name="main" as="element(main)" tunnel="yes" select="main"/>
          <xsl:with-param name="currPageId" as="xs:string" tunnel="yes" select="$currPageId"/>
        </xsl:apply-templates>
      </xsl:result-document>
    </xsl:for-each>
  </xsl:template>
  
</xsl:stylesheet>

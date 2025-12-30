<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" 
  xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="#all" xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml" 
  xmlns:hcmc="http://hcmc.uvic.ca/ns"
  xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> 2025-12-29.</xd:p>
      <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
      <xd:p>This is a global module which contains all 
        sorts of fragments of XHTML5 as well as
        functions used to create the website.</xd:p>
    </xd:desc>
  </xd:doc>

  <!-- First we figure out where we are and where we want to load and save things from. -->
  <xd:doc scope="component">
    <xd:desc><xd:ref name="docUri">docUri</xd:ref> is where the input document is.</xd:desc>
  </xd:doc>
  <xsl:variable name="docUri" select="base-uri(/)"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="docFolder">docFolder</xd:ref> is the folder where the input document
      is.</xd:desc>
  </xd:doc>
  <xsl:variable name="docFolder" select="replace($docUri, '[^/]+$', '')"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="baseDir">baseDir</xd:ref> is the root folder of the entire project, which
      has to be calculated carefully because a transformation may be called from different contexts
      such as ant or Oxygen. We try to calculate it based on the input doc, but we allow it to be
      overridden as a parameter. Mostly the input doc will either be an XSLT file (in the xsl
      directory), an HTML file (in the project root) or a data file (in the data
      directory).</xd:desc>
  </xd:doc>
  <xsl:param name="baseDir" select="concat($docFolder, '../')"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="docRoot">docRoot</xd:ref> is needed in various contexts where the input
      document is out of scope.</xd:desc>
  </xd:doc>
  <xsl:variable name="docRoot" select="/"/>
  
  <xd:doc>
    <xd:desc><xd:ref name="siteUrl"/> is the eventual URL of the website, for use in cite-this-page
    footer components.</xd:desc>
  </xd:doc>
  <xsl:variable name="siteUrl" as="xs:string" select="'https://www.mholmes.com/'"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="nowDate" type="variable">nowDate</xd:ref> is the current date, which is
      used for page footers.</xd:desc>
  </xd:doc>
  <xsl:variable name="nowDate" as="xs:string"
    select="format-date(current-date(), '[D1o] [MNn] [Y0001]')"/>
  
  <xd:doc>
    <xd:desc>The git hash for the last commit.</xd:desc>
  </xd:doc>
  <xsl:variable name="gitHash" as="xs:string" select="unparsed-text($baseDir || '/gitHash.txt')"/>

  <xd:doc>
    <xd:desc><xd:ref name="footerBuildInfo">footerBuildInfo</xd:ref> concatenates info from above to
      create a string to be output in the footer.</xd:desc>
  </xd:doc>
  <xsl:variable name="footerBuildInfo" as="xs:string"
    select="$siteTitle || ': ' || $nowDate || ', git rev. ' || substring($gitHash, 1, 8)
    || '.' "/>
  
  <!--<xd:doc>
    <xd:desc>The imageDimensions.txt fils is created early in the build process using ImageMagick to 
    parse all images in the data/images folder.</xd:desc>
  </xd:doc>
  <xsl:variable name="imgDimensionsFile" as="xs:string" select="$baseDir || 'utilities/imageDimensions.txt'"/>-->
  
  <!--<xd:doc>
    <xd:desc>We need to show an error if we don't find the file.</xd:desc>
  </xd:doc>
  <xsl:variable name="errorNotFound" as="xs:string" select="'ERROR: No imageDimensions.txt file found.'"/>
  
  <xsl:variable name="txtDimensions" as="xs:string" select="if (unparsed-text-available($imgDimensionsFile)) then unparsed-text($imgDimensionsFile) else $errorNotFound"/>-->
  
  <xd:doc scope="component">
    <xd:desc><xd:ref name="thisYear" type="variable">thisYear</xd:ref> is the current year, which is
      used for copyright etc.</xd:desc>
  </xd:doc>
  <xsl:variable name="thisYear" as="xs:string" select="format-date(current-date(), '[Y0001]')"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="outputDir">outputDir</xd:ref> is the folder where the output is
      created.</xd:desc>
  </xd:doc>
  <xsl:param name="outputDir" select="concat($baseDir, 'site/')"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="dataDir">dataDir</xd:ref> is the folder where the textual data
      is edited.</xd:desc>
  </xd:doc>
  <xsl:param name="dataDir" as="xs:string" select="concat($baseDir, 'data/')"/>

  <xd:doc>
    <xd:desc>The site page template, a framework HTML file.</xd:desc>
  </xd:doc>
  <xsl:variable name="sitePageTemplate" as="element(html)"
    select="doc($baseDir || 'boilerplate/page_template.xml')/html"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="dataDocs">dataDocs</xd:ref> is the complete collection of data
      documents in the data folder.</xd:desc>
  </xd:doc>
  <xsl:variable name="dataDocs"
    select="collection(concat($dataDir, '?select=*.xml;recurse=no'))"/>

  <xd:doc scope="component">
    <xd:desc><xd:ref name="dataIds">dataIds</xd:ref> is a list of all the document names in
      the data folder, minus their extension.</xd:desc>
  </xd:doc>
  <xsl:param name="dataIds" as="xs:string*" select="
      for $c in $dataDocs
      return
        substring-before(tokenize(base-uri($c), '/')[last()], '.xml')"/>

  <xd:doc>
    <xd:desc><xd:ref name="siteMainTitle" type="variable">siteMainTitle</xd:ref> is the overall
      project title.</xd:desc>
  </xd:doc>
  <xsl:variable name="siteMainTitle" as="xs:string">Martin Holmes</xsl:variable>

  <xd:doc>
    <xd:desc><xd:ref name="siteSubTitle" type="variable">siteSubTitle</xd:ref> is the overall
      project subtitle.</xd:desc>
  </xd:doc>
  <xsl:variable name="siteSubTitle" as="xs:string">Personal website</xsl:variable>

  <xd:doc>
    <xd:desc><xd:ref name="siteTitle" type="variable">siteTitle</xd:ref> is the overall combined
      project title, which is used for page titles if no other title is provided.</xd:desc>
  </xd:doc>
  <xsl:variable name="siteTitle" as="xs:string">
    <xsl:value-of select="concat($siteMainTitle, ': ', $siteSubTitle)"/>
  </xsl:variable>
  
  <!--<xd:doc>
    <xd:desc>This is a map whose keys are the relative paths of images as they 
    will appear in the data, and they map to values which are pre-constructed
    img tags incorporating the image dimensions, which are read from a text file 
    created using ImageMagick earlier in the build process.</xd:desc>
  </xd:doc>
  <xsl:variable name="mapImgPathsToElements" as="map(xs:string, element(img))">
    <xsl:map>
      <xsl:for-each select="distinct-values(tokenize($txtDimensions, '&#x0A;'))">
        <xsl:variable name="bits" as="xs:string*" select="tokenize(., '\s+')"/>
        <xsl:variable name="wh" as="xs:string*" select="if (count($bits) gt 1) then tokenize($bits[2], 'x') else ()"/>
        <xsl:message select="concat($bits[1], ': ', if (count($wh) gt 1) then $wh[1] || ' x ' || $wh[2] else 'NO DIMENSIONS')"/>
        <xsl:if test="count($bits) = 2 and count($wh) = 2">
          <xsl:map-entry key="$bits[1]">
            <xsl:variable name="imgForm" as="xs:string" select="if (xs:integer($wh[2]) gt xs:integer($wh[1])) then 'portrait' else if (xs:integer($wh[1]) gt xs:integer($wh[2])) then 'landscape' else 'square'"/>
            <img src="{$bits[1]}" class="{$imgForm}" width="{$wh[1]}" height="{$wh[2]}"/>
          </xsl:map-entry>
        </xsl:if>
      </xsl:for-each>
    </xsl:map>
  </xsl:variable>-->
  
</xsl:stylesheet>

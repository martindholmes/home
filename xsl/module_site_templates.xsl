<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
  exclude-result-prefixes="#all" xmlns="http://www.w3.org/1999/xhtml"
  xpath-default-namespace="http://www.w3.org/1999/xhtml" xmlns:hcmc="http://hcmc.uvic.ca/ns"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:map="http://www.w3.org/2005/xpath-functions/map"
  version="3.0">
  <xd:doc scope="stylesheet">
    <xd:desc>
      <xd:p><xd:b>Created on:</xd:b> 2025-12-30.</xd:p>
      <xd:p><xd:b>Author:</xd:b> mholmes</xd:p>
      <xd:p>Templates for the site build process.</xd:p>
    </xd:desc>
  </xd:doc>

  <xd:doc>
    <xd:desc>Migrate the id from the main element in the current content doc.</xd:desc>
    <xd:param name="currPageId" as="xs:string" tunnel="yes">The id of the current page.</xd:param>
  </xd:doc>
  <xsl:template match="html[@id eq 'page_template']" mode="html">
    <xsl:param name="currPageId" as="xs:string" tunnel="yes"/>
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <xsl:attribute name="id" select="$currPageId"/>
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Replace the main element in the boilerplate with the content
      from the current document.</xd:desc>
    <xd:param name="currMain" as="element(main)" tunnel="yes">The main element from the content document.</xd:param>
  </xd:doc>
  <xsl:template match="main[not(@id)]" mode="html">
    <xsl:param name="currMain" as="element(main)" tunnel="yes"/>
    <xsl:apply-templates select="$currMain" mode="#current"/>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Suppress that id when it appears in the main element.</xd:desc>
  </xd:doc>
  <xsl:template match="main/@id" mode="html"/>
  
</xsl:stylesheet>

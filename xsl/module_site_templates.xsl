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
    <xd:desc>Catch the current page's menu item and unlink it.</xd:desc>
    
    <xd:param name="currPageId" as="xs:string" tunnel="yes">The id of the current page.</xd:param>
  </xd:doc>
  <xsl:template match="nav/ul/li" mode="html">
    <xsl:param name="currPageId" as="xs:string" tunnel="yes"/>
    <xsl:choose>
      <xsl:when test="a/@href eq $currPageId || '.html'">
        <xsl:copy>
          <xsl:attribute name="class" select="'current'"/>
          <span>
            <xsl:apply-templates select="a/node()" mode="#current"/>
          </span>
        </xsl:copy>
      </xsl:when>
      <xsl:otherwise>
        <xsl:next-match/>
      </xsl:otherwise>
    </xsl:choose>
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
  
  <xd:doc>
    <xd:desc>Build info goes into the footer.</xd:desc>
  </xd:doc>
  <xsl:template match="p[@id='buildInfo']" mode="html">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <img src="images/favicon.svg" class="footerIcon" alt="MH: Martin Holmes"/>
      <xsl:sequence select="$footerBuildInfo"/>
    </xsl:copy>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>Credits info goes into the footer.</xd:desc>
  </xd:doc>
  <xsl:template match="p[@id='credits']" mode="html">
    <xsl:copy>
      <xsl:apply-templates select="@*" mode="#current"/>
      <span><xsl:sequence select="$footerCredits"/></span>
    </xsl:copy>
  </xsl:template>
  
  <xd:doc>
    <xd:desc>We want to add title attributes to any table cells in case
    they need to be displayed as a list on a small-format device.</xd:desc>
  </xd:doc>
  <xsl:template match="table[thead]/tbody/tr/td" mode="html">
    <xsl:variable name="offset" as="xs:integer" select="count(preceding-sibling::td)"/>
    <xsl:variable name="caption" as="xs:string" select="xs:string(ancestor::table[1]/thead/tr[1]/td[count(preceding-sibling::td) eq $offset])"/>
    <xsl:copy>
      <xsl:apply-templates select="@*[not(local-name() eq 'title')]" mode="#current"/>
      <xsl:attribute name="title" select="$caption"/>
      <xsl:apply-templates select="node()" mode="#current"/>
    </xsl:copy>
  </xsl:template>
  
  <!--<xd:doc>
    <xd:desc>We need to make sure that long URLs can break when they're displayed
    on a small-format device.</xd:desc>
  </xd:doc>
  <xsl:template match="h[@href and starts-with(., 'http')]/text()" mode="html">
    <xsl:sequence select="replace(., '([=&amp;])', '$1')"
  </xsl:template>-->
  
</xsl:stylesheet>

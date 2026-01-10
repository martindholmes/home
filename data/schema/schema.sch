<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
   <title>ISO Schematron rules</title>
   <!-- This file generated 2026-01-10T04:53:42Z by 'extract-isosch.xsl'. -->
   <!-- ********************* -->
   <!-- namespaces, declared: -->
   <!-- ********************* -->
   <ns prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
   <ns prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
   <ns prefix="rng" uri="http://relaxng.org/ns/structure/1.0"/>
   <ns prefix="rna" uri="http://relaxng.org/ns/compatibility/annotations/1.0"/>
   <ns prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>
   <ns prefix="sch1x" uri="http://www.ascc.net/xml/schematron"/>
   <ns uri="http://www.w3.org/1999/xhtml" prefix="xh"/>
   <!-- ******************************************************* -->
   <!-- constraints in en, und, mul, zxx, of which there are 16 -->
   <!-- ******************************************************* -->
   <pattern id="schematron-constraint-fixMetaContentValue-1">
      <rule context="xh:meta[@content]">
         <assert test="@content eq 'width=device-width, initial-scale=1.0'"> ERROR: The @content value must be: width=device-width, initial-scale=1.0</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-linkAttCombos1-2">
      <rule context="xh:link[@type]">
         <assert test="@sizes and xs:string(@sizes) eq 'any'"> If the @type attribute is used, then the @sizes attribute must be set to "any".</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-linkAttCombos2-3">
      <rule context="xh:link[@rel eq 'stylesheet']">
         <assert test="not(@sizes) and not(@type)"> When linking to a stylesheet, you should not use the @sizes or @type attributes.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-spansMustHaveNametypeStyleOrClass-4">
      <rule context="xh:span">
         <assert test="@class or @style or @data-nametype"> A span element must have a class attribute, a data-nametype attribute, or a style attribute.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-imgWithoutCaptionNeedsAlt-5">
      <rule context="xh:img">
         <assert test="@alt or following-sibling::xh:figcaption"> If your img element is not inside a figure element with a figcaption, then it requires the @alt attribute to provide help for visually-impaired users.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-radioInputsMustHaveName-6">
      <rule context="xh:input[@type='radio']">
         <assert test="@name"> A radio button must have a name attribute.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-schVariables-1">
      <let name="smartDouble" value="'[“”]'"/>
      <let name="smartSingle" value="'[‘’]'"/>
      <let name="straightDouble" value="'&#34;'"/>
      <let name="straightApos" value="''''"/>
      <let name="straightQuotes"
           value="concat('[', $straightDouble, $straightApos, ']')"/>
   </pattern>
   <pattern id="schematron-constraint-mh-noQuotesInText-7">
      <rule context="xh:*[text()][not(ancestor-or-self::xh:script or ancestor-or-self::xh:style or ancestor-or-self::xh:code or ancestor-or-self::xh:pre)]">
         <assert test="not(text()[matches(., $straightQuotes)])"> Do not use straight quotes in text. Use the q or span elements wherever possible; for apostrophes, use the smart version (’).</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-noBadImageFilenames-8">
      <rule context="xh:img">
         <assert test="matches(@src, '^[a-zA-Z0-9/\._\-]+$')"> Image file paths must be well-formed (no spaces or punctuation).</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-spacesAfterPeriods-9">
      <rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
         <assert test="not(text()[not(starts-with(., 'http')) and matches(., '[^\.A-Z]\.[A-Z]')])"> Don't forget to put a space after every period.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-noSpacedPeriodEllipses-10">
      <rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
         <assert test="not(text()[matches(., '\.\s*\.\s*\.')])"> Don't use literal periods to create an ellipsis. Use the ellipsis character (…, Control + Shift + period) instead.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-noSpacesInHrefs-11">
      <rule context="xh:a">
         <assert test="not(matches(@href, '\s+'))"> There should be no spaces in href attributes (links).</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-noLinksInLinks-12">
      <rule context="xh:a">
         <assert test="not(descendant::xh:a[@href])"> Don't place links inside other links.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-periodsAndCommasOutsideLinks-13">
      <rule context="xh:a[@href]">
         <assert test="not(matches(., '[\.,:;]\s*$')) or matches(., '((Esq\.)|(A\.\s*W\.)|(\.\s*\.\s*\.))$')"> Don't include trailing periods and commas inside link text.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-useProperEllipsis-14">
      <rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
         <assert test="not(text()[matches(., '\.\.\.')])"> Use an ellipsis (…) rather than three periods.</assert>
      </rule>
   </pattern>
   <pattern id="schematron-constraint-mh-idShouldMatchFilename-15">
      <rule context="xh:article | xh:main | xh:html">
         <let name="reFName" value="concat(@id, '.xm[l_]$')"/>
         <assert test="matches(document-uri(/), $reFName)"> ERROR: The @id of your document (<value-of select="@id"/>) does not match the document file name (<value-of select="base-uri(/)"/>).</assert>
      </rule>
   </pattern>
</schema>

<?xml version="1.0" encoding="UTF-8"?>
<stylesheet xmlns="http://www.w3.org/1999/XSL/Transform"
            xmlns:rna="http://relaxng.org/ns/compatibility/annotations/1.0"
            xmlns:rng="http://relaxng.org/ns/structure/1.0"
            xmlns:sch="http://purl.oclc.org/dsdl/schematron"
            xmlns:sch1x="http://www.ascc.net/xml/schematron"
            xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
            xmlns:tei="http://www.tei-c.org/ns/1.0"
            xmlns:xh="http://www.w3.org/1999/xhtml"
            xmlns:xs="http://www.w3.org/2001/XMLSchema"
            version="3.0"
            expand-text="false">
   <variable name="Q{http://dmaus.name/ns/2023/schxslt}phase"
             as="Q{http://www.w3.org/2001/XMLSchema}string"
             select="'#ALL'"/>
   <mode use-accumulators=""/>
   <mode name="Q{http://dmaus.name/ns/2023/schxslt}validate"
         use-accumulators=""
         on-no-match="shallow-skip"/>
   <mode name="group.d4e35"
         on-no-match="shallow-skip"
         streamable="false"
         use-accumulators=""/>
   <template match="*" mode="group.d4e35" priority="-10">
      <apply-templates select="@*" mode="#current"/>
      <apply-templates select="node()" mode="#current"/>
   </template>
   <variable name="smartDouble" select="'[“”]'"/>
   <variable name="smartSingle" select="'[‘’]'"/>
   <variable name="straightDouble" select="'&#34;'"/>
   <variable name="straightApos" select="''''"/>
   <variable name="straightQuotes"
             select="concat('[', $straightDouble, $straightApos, ']')"/>
   <template match="xh:meta[@content]" mode="group.d4e35" priority="13">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e35' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:meta[@content]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:meta[@content]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e39'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e39') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(@content eq 'width=device-width, initial-scale=1.0')">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="@content eq 'width=device-width, initial-scale=1.0'"
                                               patternId="schematron-constraint-fixMetaContentValue-1">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> ERROR: The @content value must be: width=device-width, initial-scale=1.0</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="@content eq 'width=device-width, initial-scale=1.0'"
                                          patternId="schematron-constraint-fixMetaContentValue-1">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e35', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:link[@type]" mode="group.d4e35" priority="12">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e44' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:link[@type]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:link[@type]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e48'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e48') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(@sizes and xs:string(@sizes) eq 'any')">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="@sizes and xs:string(@sizes) eq 'any'"
                                               patternId="schematron-constraint-linkAttCombos1-2">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> If the @type attribute is used, then the @sizes attribute must be set to "any".</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="@sizes and xs:string(@sizes) eq 'any'"
                                          patternId="schematron-constraint-linkAttCombos1-2">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e44', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:link[@rel eq 'stylesheet']"
             mode="group.d4e35"
             priority="11">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e54' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:link[@rel eq 'stylesheet']">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:link[@rel eq 'stylesheet']">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e58'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e58') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(@sizes) and not(@type))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(@sizes) and not(@type)"
                                               patternId="schematron-constraint-linkAttCombos2-3">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> When linking to a stylesheet, you should not use the @sizes or @type attributes.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(@sizes) and not(@type)"
                                          patternId="schematron-constraint-linkAttCombos2-3">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e54', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:span" mode="group.d4e35" priority="10">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e63' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:span">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:span">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e67'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e67') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(@class or @style or @data-nametype)">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="@class or @style or @data-nametype"
                                               patternId="schematron-constraint-spansMustHaveNametypeStyleOrClass-4">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> A span element must have a class attribute, a data-nametype attribute, or a style attribute.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="@class or @style or @data-nametype"
                                          patternId="schematron-constraint-spansMustHaveNametypeStyleOrClass-4">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e63', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:img" mode="group.d4e35" priority="9">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e72' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:img">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:img">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e76'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e76') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(@alt or following-sibling::xh:figcaption)">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="@alt or following-sibling::xh:figcaption"
                                               patternId="schematron-constraint-imgWithoutCaptionNeedsAlt-5">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> If your img element is not inside a figure element with a figcaption, then it requires the @alt attribute to provide help for visually-impaired users.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="@alt or following-sibling::xh:figcaption"
                                          patternId="schematron-constraint-imgWithoutCaptionNeedsAlt-5">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e72', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:*[text()][not(ancestor-or-self::xh:script or ancestor-or-self::xh:style or ancestor-or-self::xh:code or ancestor-or-self::xh:pre)]"
             mode="group.d4e35"
             priority="8">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e94' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:*[text()][not(ancestor-or-self::xh:script or ancestor-or-self::xh:style or ancestor-or-self::xh:code or ancestor-or-self::xh:pre)]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:*[text()][not(ancestor-or-self::xh:script or ancestor-or-self::xh:style or ancestor-or-self::xh:code or ancestor-or-self::xh:pre)]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e98'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e98') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(text()[matches(., $straightQuotes)]))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(text()[matches(., $straightQuotes)])"
                                               patternId="schematron-constraint-mh-noQuotesInText-6">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Do not use straight quotes in text. Use the q or span elements wherever possible; for apostrophes, use the smart version (’).</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(text()[matches(., $straightQuotes)])"
                                          patternId="schematron-constraint-mh-noQuotesInText-6">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e94', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:img" mode="group.d4e35" priority="7">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e103' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:img">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:img">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e107'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e107') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(matches(@src, '^[a-zA-Z0-9/\._\-]+$'))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="matches(@src, '^[a-zA-Z0-9/\._\-]+$')"
                                               patternId="schematron-constraint-mh-noBadImageFilenames-7">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Image file paths must be well-formed (no spaces or punctuation).</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="matches(@src, '^[a-zA-Z0-9/\._\-]+$')"
                                          patternId="schematron-constraint-mh-noBadImageFilenames-7">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e103', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:*[not(self::xh:code or self::xh:pre)][text()]"
             mode="group.d4e35"
             priority="6">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e113' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e117'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e117') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(text()[not(starts-with(., 'http')) and matches(., '[^\.A-Z]\.[A-Z]')]))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(text()[not(starts-with(., 'http')) and matches(., '[^\.A-Z]\.[A-Z]')])"
                                               patternId="schematron-constraint-mh-spacesAfterPeriods-8">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Don't forget to put a space after every period.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(text()[not(starts-with(., 'http')) and matches(., '[^\.A-Z]\.[A-Z]')])"
                                          patternId="schematron-constraint-mh-spacesAfterPeriods-8">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e113', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:*[not(self::xh:code or self::xh:pre)][text()]"
             mode="group.d4e35"
             priority="5">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e122' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e126'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e126') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(text()[matches(., '\.\s*\.\s*\.')]))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(text()[matches(., '\.\s*\.\s*\.')])"
                                               patternId="schematron-constraint-mh-noSpacedPeriodEllipses-9">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Don't use literal periods to create an ellipsis. Use the ellipsis character (…, Control + Shift + period) instead.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(text()[matches(., '\.\s*\.\s*\.')])"
                                          patternId="schematron-constraint-mh-noSpacedPeriodEllipses-9">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e122', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:a" mode="group.d4e35" priority="4">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e131' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:a">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:a">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e135'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e135') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(matches(@href, '\s+')))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(matches(@href, '\s+'))"
                                               patternId="schematron-constraint-mh-noSpacesInHrefs-10">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> There should be no spaces in href attributes (links).</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(matches(@href, '\s+'))"
                                          patternId="schematron-constraint-mh-noSpacesInHrefs-10">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e131', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:a" mode="group.d4e35" priority="3">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e140' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:a">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:a">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e144'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e144') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(descendant::xh:a[@href]))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(descendant::xh:a[@href])"
                                               patternId="schematron-constraint-mh-noLinksInLinks-11">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Don't place links inside other links.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(descendant::xh:a[@href])"
                                          patternId="schematron-constraint-mh-noLinksInLinks-11">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e140', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:a[@href]" mode="group.d4e35" priority="2">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e149' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:a[@href]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:a[@href]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e153'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e153') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(matches(., '[\.,:;]\s*$')) or matches(., '((Esq\.)|(A\.\s*W\.)|(\.\s*\.\s*\.))$'))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(matches(., '[\.,:;]\s*$')) or matches(., '((Esq\.)|(A\.\s*W\.)|(\.\s*\.\s*\.))$')"
                                               patternId="schematron-constraint-mh-periodsAndCommasOutsideLinks-12">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Don't include trailing periods and commas inside link text.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(matches(., '[\.,:;]\s*$')) or matches(., '((Esq\.)|(A\.\s*W\.)|(\.\s*\.\s*\.))$')"
                                          patternId="schematron-constraint-mh-periodsAndCommasOutsideLinks-12">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e149', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:*[not(self::xh:code or self::xh:pre)][text()]"
             mode="group.d4e35"
             priority="1">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e158' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:*[not(self::xh:code or self::xh:pre)][text()]">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e162'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e162') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(not(text()[matches(., '\.\.\.')]))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="not(text()[matches(., '\.\.\.')])"
                                               patternId="schematron-constraint-mh-useProperEllipsis-13">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> Use an ellipsis (…) rather than three periods.</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="not(text()[matches(., '\.\.\.')])"
                                          patternId="schematron-constraint-mh-useProperEllipsis-13">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e158', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="xh:article | xh:main | xh:html"
             mode="group.d4e35"
             priority="0">
      <param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
             as="Q{http://www.w3.org/2001/XMLSchema}string*"
             select="()"/>
      <variable name="Q{http://dmaus.name/ns/2023/schxslt}rule-context"
                as="node()"
                select="."/>
      <choose>
         <when test="'d4e168' = $Q{http://dmaus.name/ns/2023/schxslt}pattern">
            <svrl:suppressed-rule context="xh:article | xh:main | xh:html">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:suppressed-rule>
            <next-match/>
         </when>
         <otherwise>
            <svrl:fired-rule context="xh:article | xh:main | xh:html">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
            </svrl:fired-rule>
            <variable name="Q{http://dmaus.name/ns/2023/schxslt}severity"
                      as="map(Q{http://www.w3.org/2001/XMLSchema}string, Q{http://www.w3.org/2001/XMLSchema}integer)">
               <map>
                  <map-entry key="'d4e174'">
                     <variable name="severity"
                               as="Q{http://www.w3.org/2001/XMLSchema}string"
                               select="'fatal'"/>
                     <sequence select="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity($severity)"/>
                  </map-entry>
               </map>
            </variable>
            <for-each select=".">
               <variable name="reFName" select="concat(@id, '.xm[l_]$')"/>
               <choose>
                  <when test="Q{http://www.w3.org/2005/xpath-functions/map}get($Q{http://dmaus.name/ns/2023/schxslt}severity, 'd4e174') ge Q{http://dmaus.name/ns/2023/schxslt}numeric-severity('info')">
                     <if test="not(matches(document-uri(/), $reFName))">
                        <variable name="failed-assert" as="element(svrl:failed-assert)">
                           <svrl:failed-assert test="matches(document-uri(/), $reFName)"
                                               patternId="schematron-constraint-mh-idShouldMatchFilename-14">
                              <attribute name="location"
                                         select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                              <svrl:text> ERROR: The @id of your document (<value-of select="@id"/>) does not match the document file name (<value-of select="base-uri(/)"/>).</svrl:text>
                           </svrl:failed-assert>
                        </variable>
                        <sequence select="$failed-assert"/>
                     </if>
                  </when>
                  <otherwise>
                     <svrl:skipped-assert severityThreshold="info"
                                          test="matches(document-uri(/), $reFName)"
                                          patternId="schematron-constraint-mh-idShouldMatchFilename-14">
                        <attribute name="location"
                                   select="path($Q{http://dmaus.name/ns/2023/schxslt}rule-context)"/>
                     </svrl:skipped-assert>
                  </otherwise>
               </choose>
            </for-each>
            <next-match>
               <with-param name="Q{http://dmaus.name/ns/2023/schxslt}pattern"
                           as="Q{http://www.w3.org/2001/XMLSchema}string*"
                           select="('d4e168', $Q{http://dmaus.name/ns/2023/schxslt}pattern)"/>
            </next-match>
         </otherwise>
      </choose>
   </template>
   <template match="root()" as="element(svrl:schematron-output)">
      <svrl:schematron-output phase="#ALL">
         <svrl:ns-prefix-in-attribute-values prefix="tei" uri="http://www.tei-c.org/ns/1.0"/>
         <svrl:ns-prefix-in-attribute-values prefix="xs" uri="http://www.w3.org/2001/XMLSchema"/>
         <svrl:ns-prefix-in-attribute-values prefix="rng" uri="http://relaxng.org/ns/structure/1.0"/>
         <svrl:ns-prefix-in-attribute-values prefix="rna" uri="http://relaxng.org/ns/compatibility/annotations/1.0"/>
         <svrl:ns-prefix-in-attribute-values prefix="sch" uri="http://purl.oclc.org/dsdl/schematron"/>
         <svrl:ns-prefix-in-attribute-values prefix="sch1x" uri="http://www.ascc.net/xml/schematron"/>
         <svrl:ns-prefix-in-attribute-values prefix="xh" uri="http://www.w3.org/1999/xhtml"/>
         <!--SchXslt2 development-->
         <apply-templates select="." mode="Q{http://dmaus.name/ns/2023/schxslt}validate"/>
      </svrl:schematron-output>
   </template>
   <template match="root()"
             as="element()*"
             mode="Q{http://dmaus.name/ns/2023/schxslt}validate">
      <try>
         <svrl:active-pattern id="schematron-constraint-fixMetaContentValue-1"/>
         <svrl:active-pattern id="schematron-constraint-linkAttCombos1-2"/>
         <svrl:active-pattern id="schematron-constraint-linkAttCombos2-3"/>
         <svrl:active-pattern id="schematron-constraint-spansMustHaveNametypeStyleOrClass-4"/>
         <svrl:active-pattern id="schematron-constraint-imgWithoutCaptionNeedsAlt-5"/>
         <svrl:active-pattern id="schematron-constraint-schVariables-1"/>
         <svrl:active-pattern id="schematron-constraint-mh-noQuotesInText-6"/>
         <svrl:active-pattern id="schematron-constraint-mh-noBadImageFilenames-7"/>
         <svrl:active-pattern id="schematron-constraint-mh-spacesAfterPeriods-8"/>
         <svrl:active-pattern id="schematron-constraint-mh-noSpacedPeriodEllipses-9"/>
         <svrl:active-pattern id="schematron-constraint-mh-noSpacesInHrefs-10"/>
         <svrl:active-pattern id="schematron-constraint-mh-noLinksInLinks-11"/>
         <svrl:active-pattern id="schematron-constraint-mh-periodsAndCommasOutsideLinks-12"/>
         <svrl:active-pattern id="schematron-constraint-mh-useProperEllipsis-13"/>
         <svrl:active-pattern id="schematron-constraint-mh-idShouldMatchFilename-14"/>
         <apply-templates select="." mode="group.d4e35"/>
         <catch>
            <svrl:error code="{$Q{http://www.w3.org/2005/xqt-errors}code}">
               <if test="(document-uri(.), base-uri(root()))[1]">
                  <attribute name="document" select="(document-uri(.), base-uri(root()))[1]"/>
               </if>
               <if test="$Q{http://www.w3.org/2005/xqt-errors}description">
                  <value-of select="$Q{http://www.w3.org/2005/xqt-errors}description"/>
               </if>
            </svrl:error>
            <variable name="message"
                      as="Q{http://www.w3.org/2001/XMLSchema}string+"
                      expand-text="yes">
                Running the ISO Schematron validation failed with a dynamic error.
                Error code: {$Q{http://www.w3.org/2005/xqt-errors}code} Reason: {$Q{http://www.w3.org/2005/xqt-errors}description}
              </variable>
            <message terminate="yes"
                     error-code="Q{{http://dmaus.name/ns/2023/schxslt}}ValidationError">
               <text/>
               <value-of select="normalize-space(string-join($message))"/>
            </message>
         </catch>
      </try>
   </template>
   <function name="Q{http://dmaus.name/ns/2023/schxslt}numeric-severity"
             as="Q{http://www.w3.org/2001/XMLSchema}integer">
      <param name="severity" as="Q{http://www.w3.org/2001/XMLSchema}string"/>
      <sequence select="(index-of(('info', 'warning', 'error', 'fatal'), $severity), 4)[1]"/>
   </function>
</stylesheet>

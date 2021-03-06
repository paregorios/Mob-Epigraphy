<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teidivedition.xsl 1510 2008-08-14 15:27:51Z zau $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="t" version="1.0">

   <!-- Other div matches can be found in htm-teidiv.xsl -->

   <!-- Text edition div -->
   <xsl:template match="t:div[@type = 'edition']" priority="1">
      <div id="edition">
         <!-- Found in htm-tpl-lang.xsl -->
         <xsl:call-template name="attr-lang"/>
          <xsl:if test="$meta-style = 'mob' and not(t:head)">
              <xsl:apply-templates select="//t:encodingDesc/t:p[@xml:id='constitution']"/>
          </xsl:if>
         <xsl:apply-templates/>

         <!-- Apparatus creation: look in tpl-apparatus.xsl for documentation and templates -->
         <xsl:if test="$apparatus-style = 'ddbdp'">
            <!-- Framework found in htm-tpl-apparatus.xsl -->
            <xsl:call-template name="tpl-apparatus"/>
         </xsl:if>

      </div>
   </xsl:template>


   <!-- Textpart div -->
   <xsl:template match="t:div[@type='textpart']" priority="1">
      <xsl:variable name="div-loc">
         <xsl:for-each select="ancestor::t:div[@type='textpart']">
            <xsl:value-of select="@n"/>
            <xsl:text>-</xsl:text>
         </xsl:for-each>
      </xsl:variable>
      <span class="textpartnumber" id="ab{$div-loc}{@n}">
         <!-- add ancestor textparts -->
         <xsl:if test="$leiden-style='ddbdp' and @subtype">
            <xsl:value-of select="@subtype"/>
            <xsl:text> </xsl:text>
         </xsl:if>
         <xsl:if test="@n">
            <xsl:value-of select="@n"/>
         </xsl:if>
      </span>
      <!--<xsl:element name="br"/>-->
      <xsl:apply-templates/>
   </xsl:template>
</xsl:stylesheet>

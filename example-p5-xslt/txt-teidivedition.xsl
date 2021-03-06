<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: txt-teidivedition.xsl 1510 2008-08-14 15:27:51Z zau $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0"
                version="1.0">

  <!-- General div match found in txt-teidiv.xsl -->

  <xsl:template match="t:div[@type = 'edition']" priority="1">
    <!-- Two line breaks to give space -->
    <xsl:choose>
         <xsl:when test="starts-with($leiden-style, 'edh')"/>
         <xsl:otherwise>
            <xsl:text>
&#xD;
&#xD;</xsl:text>
         </xsl:otherwise>
      </xsl:choose>
    
      <xsl:apply-templates/>
    
      <!-- Apparatus creation: look in tpl-apparatus.xsl for documentation -->
    <xsl:if test="$apparatus-style = 'ddbdp'">
      <!-- Framework found in txt-tpl-apparatus.xsl -->
      <xsl:call-template name="tpl-apparatus"/>
      </xsl:if>
  </xsl:template>


  <xsl:template match="t:div[@type = 'textpart']" priority="1">
      <xsl:choose>
         <xsl:when test="starts-with($leiden-style, 'edh')">
            <xsl:variable name="cur_parent" select="generate-id(parent::node())"/>
            <xsl:if test="preceding::t:div[@type='textpart'][1][generate-id(parent::node())=$cur_parent]">
               <xsl:text>// </xsl:text>
            </xsl:if>
            <xsl:text>(</xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>) </xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:text>
&#xD;</xsl:text>
            <xsl:value-of select="@n"/>
         </xsl:otherwise>
      </xsl:choose>
    
      <xsl:apply-templates/>
  </xsl:template>

</xsl:stylesheet>
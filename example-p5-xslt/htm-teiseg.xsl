<?xml version="1.0" encoding="UTF-8"?>
<!-- $Id: htm-teiseg.xsl 1447 2008-08-07 12:57:55Z zau $ -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="t" 
                version="1.0">
  <!-- General template in teiseg.xsl -->
  <xsl:import href="teiseg.xsl"/>
  
  <xsl:template match="t:seg">
      <xsl:choose>
         <xsl:when test="@type='autopsy'">
            <span class="autopsy">
               <xsl:apply-imports/>
            </span>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-imports/>
         </xsl:otherwise>
      </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>
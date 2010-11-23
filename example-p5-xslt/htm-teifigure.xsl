<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:t="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="t" 
                version="1.0">

  <xsl:template match="t:figure">
      <xsl:choose>
         <xsl:when test="@href">
            <a href="{@href}">
               <xsl:apply-templates/>
            </a>
         </xsl:when>
          <xsl:when test="t:graphic">
              <xsl:choose>
                  <xsl:when test="contains(t:graphic/@url, '.jpg') or contains(t:graphic/@url, '.png')"><img src="{t:graphic/@url}" style="width:250px" alt="{t:head}"/></xsl:when>
                  <xsl:otherwise>
                      <p><a href="{t:graphic/@url}">click for image</a></p>
                  </xsl:otherwise>
              </xsl:choose>
              <p><xsl:value-of select="t:head"/></p>
          </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

</xsl:stylesheet>
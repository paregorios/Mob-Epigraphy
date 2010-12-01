<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:h="http://www.w3.org/1999/xhtml"
    xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="xs h" version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml"  doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"  doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>
    
    <xd:doc xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Created on:</xd:b> Nov 30, 2010</xd:p>
            <xd:p><xd:b>Author:</xd:b> Tom Elliott</xd:p>
            <xd:p>Used to convert output from hacked version of EpiDoc example P5 stylesheets for standalone web display in the context of the Mob Epigraphy project.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates />
    </xsl:template>
    <xsl:template match="h:link[@href='../css/global.css']">
        <xsl:copy>
            <xsl:copy-of select="@*[local-name() != 'href']"/>
            <xsl:attribute name="href">global.css</xsl:attribute>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="*">
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="text()">
        <xsl:variable name="raw" select="."/>
        <xsl:variable name="cooked" select="normalize-space(.)"/>
        <xsl:variable name="prefix">
            <xsl:if test="substring($raw, 1, 1) = ' '"><xsl:text> </xsl:text></xsl:if>
        </xsl:variable>
        <xsl:variable name="postfix">
            <xsl:if test="substring($raw, string-length($raw), 1) = ' '"><xsl:text> </xsl:text></xsl:if>
        </xsl:variable>
        <xsl:text></xsl:text><xsl:value-of select="$prefix"/><xsl:value-of select="$cooked"/><xsl:value-of select="$postfix"/><xsl:text></xsl:text>
        <xsl:message>raw: "<xsl:value-of select="$raw"/>"</xsl:message>
        <xsl:message>cooked: "<xsl:value-of select="$cooked"/>"</xsl:message>
        <xsl:message>prefix: "<xsl:value-of select="$prefix"/>"</xsl:message>
        <xsl:message>postfix: "<xsl:value-of select="$postfix"/>"</xsl:message>
    </xsl:template>
</xsl:stylesheet>

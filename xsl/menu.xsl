<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    
    <xsl:template name="menu">
        <xsl:for-each select="document('../xml/menu.xml')">
            <xsl:apply-templates />
        </xsl:for-each>
    </xsl:template>
    
    
    <xsl:template match="/module/menu/item">
        <div onclick="javascript:window.location = '{current()/@dest}'"><xsl:apply-templates/></div>
    </xsl:template>
</xsl:stylesheet>

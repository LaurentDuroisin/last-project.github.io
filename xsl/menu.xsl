<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template name="menu">
        <xsl:for-each select="document('../menu.xml')">
            <xsl:apply-templates />
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="/menu/item">
        <p>
            Test
        </p>
    </xsl:template>
</xsl:stylesheet>

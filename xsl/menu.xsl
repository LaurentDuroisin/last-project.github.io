<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    <xsl:template match="/">
        <xsl:for-each select="document('../menu.xml')/menu/item">
            <xsl:apply-templates />
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="document('../menu.xml')/menu/item">
        <p>
            Test
        </p>
    </xsl:template>
</xsl:stylesheet>

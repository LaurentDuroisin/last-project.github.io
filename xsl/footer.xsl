<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:variable name="lang" >
        <xsl:choose>
            <xsl:when test="/page/lang">
                <xsl:value-of select="'/page/lang'"/>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:value-of select="'en'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>


    <xsl:template name="footer">
        <style type='text/css'>
          <xsl:text><!--@IMPORT URL(/css/footer.css);--></xsl:text>
        </style>
        <DIV><xsl:value-of select="document('/xml/footer.xml')/module/footer/$lang" /></DIV>
    </xsl:template>

</xsl:stylesheet>

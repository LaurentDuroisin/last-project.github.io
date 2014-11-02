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
        <xsl:variable name="footer-file" >
            <xsl:choose>
                <xsl:when test="/page/footer">
                    <xsl:value-of select="/page/footer"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="'/xml/footer.xml'" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <style type='text/css'>
          <xsl:text>@IMPORT URL(/css/footer.css);</xsl:text>
        </style>
        <DIV><xsl:value-of select="document($footer-file)/module/footer/*[name()=$lang]" /></DIV>
    </xsl:template>

</xsl:stylesheet>

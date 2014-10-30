<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template name="footer">
        <style type='text/css'>
          <xsl:text><!--@IMPORT URL(/css/footer.css);--></xsl:text>
        </style>
        <DIV><xsl:value-of select="document('/xml/footer.xml')/module/footer" /></DIV>
    </xsl:template>

</xsl:stylesheet>

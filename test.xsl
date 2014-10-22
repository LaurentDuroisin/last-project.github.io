<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:import href="xsl/menu.xsl"/>
    
    <xsl:output method="html" />
    
    <xsl:template match="/">
        <HTML>
            <HEAD>
                <LINK rel="stylesheet" type="text/css" href="css/structure.css"/>
                <TITLE>Last Project</TITLE>
                <LINK rel="icon" type="image/png" href="img/banniere_LE_crush.png" />
            </HEAD>
            <BODY>
                <DIV id="menu"><xsl:for-each select="document('menu.xml')/menu">
                        <xsl:apply-templates/>
                    </xsl:for-each></DIV>
                <DIV id="content-zone">
                    <DIV id="content"><xsl:apply-templates/></DIV>
                </DIV>
                <FOOTER>
                    <DIV><xsl:text>Attention, ce site est auto-hébérgé, il peut donc se retrouver indisponible lors d'orages par exemple.</xsl:text></DIV>
                </FOOTER>
            </BODY>
        </HTML>
    </xsl:template>

</xsl:stylesheet>

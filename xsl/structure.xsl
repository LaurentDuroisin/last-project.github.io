<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fn="http://www.w3.org/2005/xpath-functions">

    <xsl:import href="menu.xsl"/>

    <xsl:output method="html" />

    <xsl:variable name="base">
        <xsl:choose>
            <xsl:when test="/page/@base">
                <xsl:value-of select="/page/@base"/>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:value-of select="'.'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:variable name="file"><xsl:value-of select="$base"/>/<xsl:value-of select="/page/src"/></xsl:variable>

    <xsl:variable name="lang" >
        <xsl:choose>
            <xsl:when test="/page/lang">
                <xsl:value-of select="/page/lang"/>
            </xsl:when>
            <xsl:otherwise>
                 <xsl:value-of select="'en'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:template match="/page">
        <xsl:for-each select="document($file)">
            <xsl:apply-templates />
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="/root">
        <HTML>
            <HEAD>
                <LINK rel="stylesheet" type="text/css" href="css/structure.css"/>
                <TITLE>Last Project</TITLE>
                <LINK rel="icon" type="image/png" href="img/banniere_LE_crush.png" />
            </HEAD>
            <BODY>

                <DIV id="hide-header"></DIV>
                <DIV id="menu-div"><xsl:call-template name="menu"/></DIV>
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

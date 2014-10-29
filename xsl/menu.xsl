<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />
    
    <xsl:template name="menu">
        <ul class="menu">
            <xsl:for-each select="document('../xml/menu.xml')">
                <xsl:apply-templates />
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    
    <xsl:template match="/module/menu/item">
        <li class="item" onclick="javascript:window.location = '{current()/@dest}'"><xsl:value-of select="./fr"/>
            <ul class="submenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item">
        <li class="subitem" onclick="javascript:window.location = '{current()/@dest}'"><span><xsl:value-of select="./fr"/></span>
            <ul class="subsubmenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item/item">
        <li class="subsubitem" onclick="javascript:window.location = '{current()/@dest}'"><xsl:value-of select="./fr"/></li>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:variable name="menu"><xsl:value-of select="/page/@base"/>/<xsl:value-of select="/page/menu"/></xsl:variable>

    <xsl:template name="menu">
        <ul class="menu">
            <xsl:for-each select="document($menu)">
                <xsl:apply-templates />
            </xsl:for-each>
            <xsl:for-each select="document('../xml/menu-websites.xml')">
                <xsl:apply-templates />
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="/module/menu/item">

        <xsl:variable name='url-base'>
            <xsl:choose>
                <xsl:when test="./@absolute = 'true'">
                    <xsl:value-of select="''"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="$base" />/
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <li class="item" onclick="javascript:window.location = '{$url-base}{current()/@dest}'"><xsl:value-of select="*[name()=$lang]"/>
            <ul class="submenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item">
        <xsl:variable name='url-base'>
            <xsl:choose>
                <xsl:when test="./@absolute = 'true'">
                    <xsl:value-of select="''"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="concat($base, '/')" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <li class="item" onclick="javascript:window.location = '{$url-base}{current()/@dest}'"><span><xsl:value-of select="*[name()=$lang]"/></span>
            <ul class="subsubmenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item/item">
        <xsl:variable name='url-base'>
            <xsl:choose>
                <xsl:when test="./@absolute = 'true'">
                    <xsl:value-of select="''"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="$base" />/
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <li class="item" onclick="javascript:window.location = '{$url-base}{current()/@dest}'"><xsl:value-of select="*[name()=$lang]"/></li>
    </xsl:template>
</xsl:stylesheet>

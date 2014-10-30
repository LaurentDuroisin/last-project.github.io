<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:variable name="menu"><xsl:value-of select="/page/menu"/></xsl:variable>

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

    <xsl:template name="menu">
        <ul class="menu">
            <xsl:if test="$menu">
                <xsl:for-each select="document($menu)">
                    <xsl:apply-templates />
                </xsl:for-each>
            </xsl:if>
            <xsl:for-each select="document('/xml/menu-websites.xml')">
                <xsl:apply-templates />
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="/module/menu/item">
        <li class="item"><a href="{*[name()=$lang]/@dest}"><xsl:value-of select="*[name()=$lang]"/></a>
            <ul class="submenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item">
        <xsl:variable name="suffix">
            <xsl:if test="*[name()=$lang]/@prefix = 'true'">
                <xsl:value-of select="/page/src"/>
            </xsl:if>
            ???
        </xsl:variable>
        <li class="item"><a href="{*[name()=$lang]/@dest}{$suffix}"><xsl:value-of select="*[name()=$lang]"/></a>
            <ul class="subsubmenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item/item">
        <xsl:variable name="suffix">
            <xsl:if test="*[name()=$lang]/@prefix = 'true'">
                <xsl:value-of select="/page/src"/>
            </xsl:if>
        </xsl:variable>
        <li class="item"><a href="{*[name()=$lang]/@dest}{$suffix}"><xsl:value-of select="*[name()=$lang]"/></a></li>
    </xsl:template>
</xsl:stylesheet>

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:variable name="page"><xsl:value-of select="/page/src"/></xsl:variable>

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
        <style type='text/css'><xsl:text>@IMPORT URL(/css/menu.css);</xsl:text></style>
        <xsl:variable name="menu"><xsl:value-of select="/page/menu"/></xsl:variable>
        <ul class="menu">
            <xsl:if test="$menu">
                <xsl:for-each select="document($menu)/module/menu">
                    <xsl:apply-templates />
                </xsl:for-each>
            </xsl:if>
            <xsl:for-each select="document('/xml/menu-websites.xml')/module/menu">
                <xsl:apply-templates />
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="/module/menu/item">
        <xsl:variable name="dest">
            <xsl:choose>
                <xsl:when test="*[name()=$lang]/@prefix  ='true'">
                    <xsl:value-of select="concat(*[name()=$lang]/@dest, $page)"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="concat('/', $lang, *[name()=$lang]/@dest)" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <li class="item"><a href="{$dest}"><xsl:value-of select="*[name()=$lang]"/></a>
            <ul class="submenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item">
        <xsl:variable name="dest">
            <xsl:choose>
                <xsl:when test="*[name()=$lang]/@prefix  ='true'">
                    <xsl:value-of select="concat(*[name()=$lang]/@dest, $page)"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="concat('/', $lang, *[name()=$lang]/@dest)" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <li class="item"><a href="{$dest}"><xsl:value-of select="*[name()=$lang]"/></a>
            <ul class="subsubmenu"><xsl:apply-templates select="./item" /></ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/menu/item/item/item">
        <xsl:variable name="dest">
            <xsl:choose>
                <xsl:when test="*[name()=$lang]/@prefix  ='true'">
                    <xsl:value-of select="concat(*[name()=$lang]/@dest, $page)"/>
                </xsl:when>
                <xsl:otherwise>
                     <xsl:value-of select="concat('/', $lang, *[name()=$lang]/@dest)" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <li class="item"><a href="{$dest}"><xsl:value-of select="*[name()=$lang]"/></a></li>
    </xsl:template>
</xsl:stylesheet>

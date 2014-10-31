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

    <xsl:template name="module" mode="state">
        <ul>
            <xsl:for-each select="document('/xml/projects-state.xml')/module/state">
                <xsl:apply-templates />
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template match="/module/state/project">
        <li>
            <xsl:value-of select="./@name"/> (<xsl:value-of select="./@state"/>)
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step">
        <li>
            <xsl:value-of select="./@name"/>(<xsl:value-of select="count(current()/task/item[@done = 'true']) div count(current()/task/item) * 100"/>%)
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step/task">
        <li title="{*[name()=$lang]}">
            <xsl:value-of select="./@name"/> (<xsl:value-of select="count(current()/item[@done = 'true']) div count(current()/item) * 100"/>%)
            <ul>
                <xsl:apply-templates select="./item"/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step/task/item">
        <li>
            <xsl:apply-templates/> (<xsl:value-of select="./@done"/>)
        </li>
    </xsl:template>

</xsl:stylesheet>

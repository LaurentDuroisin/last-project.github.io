<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template name="module" mode="state">
        <xsl:for-each select="document('/xml/projects-state.xml')/module/state">
            <xsl:apply-templates />
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="module/state">
        <ul>
            <xsl:apply-templates select="./project" />
        </ul>
    </xsl:template>
<!--

    <xsl:template match="/module/state/project">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step/task">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>

    <xsl:template match="/module/state/project/step/task/item">
        <li>
            <xsl:value-of select="current()"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    </xsl:template>
-->
</xsl:stylesheet>

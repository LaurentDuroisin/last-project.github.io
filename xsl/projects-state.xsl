<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" />

    <xsl:template name="state">
    </xsl:template>
<!--
    <xsl:template name="state">
        Test
    </xsl:template>

    <xsl:template match="module/state">
        <ul>??
            <xsl:apply-templates select="./project" />
        </ul>
    <xsl:template>


    <xsl:template match="/module/state/project">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    <xsl:template>

    <xsl:template match="/module/state/project/step">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    <xsl:template>

    <xsl:template match="/module/state/project/step/task">
        <li>
            <xsl:value-of select="./@name"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    <xsl:template>

    <xsl:template match="/module/state/project/step/task/item">
        <li>
            <xsl:value-of select="current()"/>
            <ul>
                <xsl:apply-templates/>
            </ul>
        </li>
    <xsl:template>
-->
</xsl:stylesheet>
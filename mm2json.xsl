<?xml version="1.0" encoding="UTF-8"?>

<!--
  (c) Amal Afroz Alam 2016
  This code is licensed under something.
-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
  <xsl:param name="indent-increment" select="'    '" />

  <xsl:template match="map">
    <xsl:apply-templates select="node">
    </xsl:apply-templates>
  </xsl:template>

  <xsl:template match="node">
    <xsl:param name="indent" select="'&#x0A;'"/>
    <xsl:variable name="indent0" select="$indent" />
    <xsl:variable name="indent1" select="concat($indent, $indent-increment)" />
    <xsl:if test="position() &gt; 1">, </xsl:if>

    <xsl:text>{</xsl:text>
    <xsl:value-of select="$indent1"/>
    <xsl:text>"id":"</xsl:text>
    <xsl:value-of select="@ID"/>
    <xsl:text>"</xsl:text>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="$indent1"/>
    <xsl:text>"text":"</xsl:text>
    <xsl:value-of select="@TEXT"/>
    <xsl:text>"</xsl:text>

    <xsl:apply-templates select="attribute">
    </xsl:apply-templates>

    <xsl:if test="node">
      <xsl:text>,</xsl:text>
      <xsl:value-of select="$indent1"/>
      <xsl:text>"options": [</xsl:text>
      <xsl:apply-templates select="node">
        <xsl:with-param name="indent" select="$indent1"/>
      </xsl:apply-templates>
      <xsl:text>]</xsl:text>
    </xsl:if>


    <xsl:value-of select="$indent0"/>
    <xsl:text>}</xsl:text>

  </xsl:template>

  <xsl:template match="attribute">
    <xsl:param name="indent" select="'&#x0A;'"/>
    <xsl:variable name="indent0" select="$indent" />
    <xsl:variable name="indent1" select="concat($indent, $indent-increment)" />
    <xsl:text>,</xsl:text>
    <xsl:value-of select="$indent1"/>
    <xsl:text>"</xsl:text>
    <xsl:value-of select="@NAME"/>
    <xsl:text>":"</xsl:text>
    <xsl:value-of select="@VALUE"/>
    <xsl:text>"</xsl:text>
  </xsl:template>

</xsl:stylesheet>
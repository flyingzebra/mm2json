<?xml version="1.0" encoding="UTF-8"?>

<!--
  mm2json.xsl - Freddy Vandriessche
  forked from Amal Afroz Alam (2016)
-->

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" indent="no"/>
  <xsl:param name="indent-increment" select="'    '" />

  <xsl:template match="map">
    <xsl:apply-templates select="node">
    </xsl:apply-templates>
  </xsl:template>

    <xsl:template name="remove-formatting">
        <xsl:param name="param"/>
        <xsl:value-of select="translate(normalize-space(translate($param,'&#x9;','')),'&#x9;','')"/>
        <xsl:value-of select="translate(normalize-space(translate($param,'&#xa;','|')),'&#xa;','|')"/>
        <xsl:value-of select="translate(normalize-space(translate($param,'&#xd;','')),'&#xd;','')"/>
    </xsl:template>

  <xsl:template match="node">
    <xsl:param name="indent" select="'&#x0A;'"/>
    <xsl:variable name="indent0" select="$indent" />
    <xsl:variable name="indent1" select="concat($indent, $indent-increment)" />
    <xsl:if test="position() &gt; 1">, </xsl:if>

    <xsl:text>{</xsl:text>

    <xsl:if test="@HGAP">
        <xsl:value-of select="$indent1"/>
        <xsl:text>"hgap":"</xsl:text>
        <xsl:value-of select="@HGAP"/>
        <xsl:text>"</xsl:text>
        
        <xsl:text>,</xsl:text>
    </xsl:if>

    <xsl:value-of select="$indent1"/>
    <xsl:text>"id":"</xsl:text>
    <xsl:value-of select="@ID"/>
    <xsl:text>"</xsl:text>

    <xsl:if test="@TEXT">
        <xsl:text>,</xsl:text>

        <xsl:value-of select="$indent1"/>
        <xsl:text>"text":"</xsl:text>
        <xsl:value-of select="@TEXT"/>
        <xsl:text>"</xsl:text>
    </xsl:if>

	<xsl:if test="richcontent[@TYPE='NODE']">
		<xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>"node":"</xsl:text>
        <xsl:call-template name="remove-formatting">
            <xsl:with-param name="param" select="richcontent[@TYPE='NODE']/html/body" />
        </xsl:call-template>
        <xsl:text>"</xsl:text>
	</xsl:if>

	<xsl:if test="richcontent[@TYPE='NOTE']">
		<xsl:text>,</xsl:text>
        <xsl:value-of select="$indent1"/>
        <xsl:text>"note":"</xsl:text>
        <xsl:call-template name="remove-formatting">
            <xsl:with-param name="param" select="richcontent[@TYPE='NOTE']/html/body" />
        </xsl:call-template>
        <xsl:text>"</xsl:text>
	</xsl:if>

    <xsl:if test="@VSHIFT">
        <xsl:text>,</xsl:text>

        <xsl:value-of select="$indent1"/>
        <xsl:text>"vshift":"</xsl:text>
        <xsl:value-of select="@VSHIFT"/>
        <xsl:text>"</xsl:text>
    </xsl:if>

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

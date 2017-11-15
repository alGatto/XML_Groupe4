<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.1">
	
	<!-- Liste intervenants -->
	<xsl:template match="lecturers" name="lecturers">
		<h1>List of Lecturers</h1>
		<xsl:for-each select="//lecturer">
			<li><a href="#{attribute::id}"><xsl:value-of select="child::last_name"/><xsl:text> </xsl:text><xsl:value-of select="child::name"/></a></li>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Liste unités -->
	<xsl:template match="unites">
		<h1>List of unites</h1>
		<xsl:for-each select="//unite">
			<li><a href="#{attribute::id}"><xsl:value-of select="child::name"/></a></li>
		</xsl:for-each>
	</xsl:template>
	
	<!-- Liste parcours et spécialités -->
	<xsl:template match="program">
		<h1>List of parcours</h1>
		<xsl:for-each select="//parcour">
			<li><a href="#{attribute::id}"><xsl:value-of select="child::name"/></a></li>
		</xsl:for-each>
	</xsl:template>

</xsl:stylesheet>

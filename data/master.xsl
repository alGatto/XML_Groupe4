<?xml version="1.0" encoding="utf-8" ?>

<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.1">
	
	<!-- <xsl:include href="fiches.xsl"/>-->
	<xsl:include href="listes.xsl"/> 
	
	<xsl:output
		method="xml"
		encoding="utf-8"
		indent="yes"
		doctype-public=""
		doctype-system="master.dtd"/>	
	
	<xsl:template match="/">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="../ressources/css/style.css"></link>
			</head>
			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>		
	
</xsl:stylesheet>

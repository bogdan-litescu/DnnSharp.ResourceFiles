<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tokens="sb:tokens">
                
<xsl:output method="html" />
<xsl:template match="/search">

    <div class = "avtsbDefault">
        <b><xsl:value-of select="summary/term" disable-output-escaping="yes" /></b> için aramanız herhangi bir sonuç üretememiştir. Başka bir arama yapınız...
    </div>
	
	<xsl:if test="count(summary/suggestions/s) &gt; 0">
		<div style="margin: 10px 0;">
			<div style="color: #CC1111; float: left;">Did you mean:</div>
			<xsl:for-each select = "summary/suggestions/s">
				<a style="display: block; float: left; margin: 0 0 0 6px;">
					<xsl:attribute name="href"><xsl:value-of select="url" /></xsl:attribute>
					<xsl:value-of select="title" />
				</a>
			</xsl:for-each>
			<div style="clear: both;"></div>
		</div>
	</xsl:if>
	
</xsl:template>
</xsl:stylesheet>
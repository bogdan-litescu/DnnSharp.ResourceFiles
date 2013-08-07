<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt" >
<xsl:output method="html" indent="no" omit-xml-declaration="yes" />

<xsl:template name="social-sharing" >
	<xsl:param name="title" />
	<xsl:param name="desc" />
	<xsl:param name="url" />

	<!-- AddThis Button BEGIN -->
	<xsl:text disable-output-escaping="yes"><![CDATA[
		<div class="addthis_toolbox addthis_default_style" style="margin: 4px 2px 2px 2px"
			 addthis:url="]]></xsl:text><xsl:value-of select="$url" /><xsl:text disable-output-escaping="yes"><![CDATA["
			 addthis:title="]]></xsl:text><xsl:value-of select="msxsl:node-set($title)/text()" disable-output-escaping="yes" /><xsl:text disable-output-escaping="yes"><![CDATA["
			 addthis:description="]]></xsl:text><xsl:value-of select="msxsl:node-set($title)/text()" disable-output-escaping="yes" /><xsl:text disable-output-escaping="yes"><![CDATA[">]]></xsl:text>

	<xsl:if test="/search/summary/social/facebook">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_facebook"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/twitter">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_twitter"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/plusone">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_google_plusone" g:plusone:count="false"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/plusone-count">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_google_plusone" g:plusone:count="true"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/email">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_email"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/more">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_button_compact"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:if test="/search/summary/social/totalcount">
		<xsl:text disable-output-escaping="yes"><![CDATA[ <a class="addthis_counter addthis_bubble_style"></a> ]]></xsl:text>
	</xsl:if>

	<xsl:text disable-output-escaping="yes"><![CDATA[
		</div>
		<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js"></script>
	]]>
	</xsl:text>
	<!-- AddThis Button END -->

</xsl:template>

</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tokens="sb:tokens">
                
<xsl:output method="html" />
<xsl:template match="/input">

    <div class="sbInp sbInp_BarExapdanble">
		<div class = "sbInputInner">
			<div class="topSearch">
				<xsl:if test="portal-filters">
					<div class="pfInp">
						<select class="portalFilter">
							<option value="-1">All Portals</option>
							<xsl:for-each select = "portal-filters/portal">
								<option>
									<xsl:attribute name="value">
										<xsl:value-of select="id" />
									</xsl:attribute>
									<xsl:if test="selected='true'">
										<xsl:attribute name="selected">selected</xsl:attribute>
									</xsl:if>
									<xsl:value-of select="title" />
								</option>
							</xsl:for-each>
						</select>
					</div>
				</xsl:if>
			</div>
			<div class="topSearch">
				<xsl:if test="isModule != 'true' and isAdmin='true'">
					<div style="float: left; margin: 15px 0 0 6px;">
						| <a class="searchManageBtn">
							<xsl:attribute name="href">
								<xsl:value-of select="sbManageUrl" />
							</xsl:attribute>
							Search Settings
						</a>
					</div>
				</xsl:if>
				<a href="javascript: ;" class="searchBtn" title="Search" id="Search">
					<xsl:attribute name="onclick">
						var p = avt.sb.$(this).parents(".sbInp:first"); if (p.find(".searchBox").hasClass("searchBoxEmpty")) return false; <xsl:value-of select="fn-search" />(p.find(".searchBox").val(), p.find(".portalFilter").val());
					</xsl:attribute>
				</a>
				<input type="text" class="searchBox" onfocus="sbInp_BarFlatBlack_removePlaceholder(this);" onblur="sbInp_BarFlatBlack_checkInput(this)">
					<xsl:attribute name="class">searchBox <xsl:if test="init = empty">searchBoxEmpty</xsl:if></xsl:attribute>
					<xsl:attribute name="value"><xsl:value-of select="init" /></xsl:attribute>
				</input>
			</div>
		</div>
	</div>
    <div style="clear: both;"></div>
    
    <script type="text/javascript">
		var vbox = avt.sb.$(".sbInp_BarExapdanble .searchBox").width();

		function sbInp_BarFlatBlack_removePlaceholder (sbox) {
			sbox = avt.sb.$(sbox);
			if (sbox.hasClass("searchBoxEmpty")) {
				sbox.removeClass("searchBoxEmpty").val("");
				sbox.animate({width: vbox + 100}, 300 ).val("");
			}
		}
		
		function sbInp_BarFlatBlack_checkInput(sbox) {
			sbox = avt.sb.$(sbox);
			if (avt.sb.$.trim(sbox.val()).length == 0 || avt.sb.$.trim(sbox.val()) == "<xsl:value-of select="empty" />") {
                sbox.addClass("searchBoxEmpty").val("<xsl:value-of select="empty" />");
                sbox.animate({width: vbox}, 300 ).val("<xsl:value-of select="empty" />");
            }
            if (!sbox.hasClass("searchBoxEmpty")) {
                sbox.css("width", "300");
            }
        }
        avt.sb.$(document).ready(function() {
			var pf = jQuery(this).find(".searchBox").offset().top;
			
            avt.sb.$(".sbInp_BarExapdanble .searchBox").each(function() {
                sbInp_BarFlatBlack_checkInput(this);
            });
        });
    </script>
    
</xsl:template>
</xsl:stylesheet>
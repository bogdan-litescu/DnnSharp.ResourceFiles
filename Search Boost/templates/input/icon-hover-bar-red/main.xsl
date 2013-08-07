<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tokens="sb:tokens">
                
<xsl:output method="html" />
<xsl:template match="/input">

    <div class="sbInp sbInp_IconHoverBarRed">
		
        <div class="sbIconHover" onmouseover="sbInp_IconHoverBarRed_showPopup(avt.sb.$(this).next());"></div>
        <div class="sbBarStart" style="display: none;" onmouseout="sbInp_IconHoverBarRed_hidePopup(this);" onmouseover="sbInp_IconHoverBarRed_showPopup(this);">
            <div class="sbBarEnd">
                <div class="sbBarInner">
                    
                    <xsl:if test="portal-filters">
                        <div style = "float: left; margin: 8px 0;">
                            <select class="portalFilter">
                                <option value="-1">All Portals</option>
                                <xsl:for-each select = "portal-filters/portal">
                                    <option>
                                        <xsl:attribute name="value"><xsl:value-of select="id" /></xsl:attribute>
                                        <xsl:if test="selected='true'">
                                            <xsl:attribute name="selected">selected</xsl:attribute>
                                        </xsl:if>
                                        <xsl:value-of select="title" />
                                    </option>
                                </xsl:for-each>
                            </select>
                        </div>
                    </xsl:if>
                    
                    <div class = "sbInputStart">
                        <div class = "sbInputEnd">
                            <div class = "sbInputInner">
                                <input type="text" class="searchBox" onfocus="sbInp_IconHoverBarRed_removePlaceholder(this);" onblur="sbInp_IconHoverBarRed_checkInput(this)">
                                    <xsl:attribute name="class">searchBox <xsl:if test="init = empty">searchBoxEmpty</xsl:if></xsl:attribute>
                                    <xsl:attribute name="value"><xsl:value-of select="init" /></xsl:attribute>
                                </input>
                            </div>
                        </div>
                    </div>
                    
                    <a href="javascript: ;" class="searchBtn" title="Search">
                        <xsl:attribute name="onclick">var p = avt.sb.$(this).parents(".sbInp:first"); if (p.find(".searchBox").hasClass("searchBoxEmpty")) return false; <xsl:value-of select="fn-search" />(p.find(".searchBox").val(), p.find(".portalFilter").val());</xsl:attribute>
                    </a>
                    
                    <xsl:if test="isModule != 'true' and isAdmin='true'">
                        <div style="float: left; margin: 15px 0 0 6px;">
                            | <a class="searchManageBtn">
                                <xsl:attribute name="href"><xsl:value-of select="sbManageUrl" /></xsl:attribute>
                                Search Settings
                            </a>
                        </div>
                    </xsl:if>
                    <div style="clear: both;"></div>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;"></div>
    
    <script type="text/javascript">
        function sbInp_IconHoverBarRed_removePlaceholder (sbox) {
            sbox = avt.sb.$(sbox);
            if (sbox.hasClass("searchBoxEmpty")) {
                sbox.removeClass("searchBoxEmpty").val("");
            }
        }
        function sbInp_IconHoverBarRed_checkInput(sbox) {
            sbox = avt.sb.$(sbox);
            if (avt.sb.$.trim(sbox.val()).length == 0 || avt.sb.$.trim(sbox.val()) == "<xsl:value-of select="empty" />") {
                sbox.addClass("searchBoxEmpty").val("<xsl:value-of select="empty" />");
            }
        }
        
        var timerPopupShow<xsl:value-of select="instanceId" />;
        var timerPopup<xsl:value-of select="instanceId" />;
        
        function sbInp_IconHoverBarRed_hidePopup(sbox) {
            sbox = avt.sb.$(sbox);
            clearTimeout(timerPopupShow<xsl:value-of select="instanceId" />);
            timerPopup<xsl:value-of select="instanceId" /> = setTimeout(function() {
                sbox.slideUp("fast");
            }, 400);
        }
        function sbInp_IconHoverBarRed_showPopup(sbox) {
            sbox = avt.sb.$(sbox);
            clearTimeout(timerPopup<xsl:value-of select="instanceId" />);
            timerPopupShow<xsl:value-of select="instanceId" /> = setTimeout(function() {
                sbox.slideDown("fast");
            }, 400);
        }
        avt.sb.$(document).ready(function() {
            avt.sb.$(".sbInp_IconHoverBarRed .searchBox").each(function() {
                sbInp_IconHoverBarRed_checkInput(this);
            });
        });
    </script>
    
</xsl:template>
</xsl:stylesheet>
<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tokens="sb:tokens">
                
<xsl:output method="html" />
<xsl:template match="/input">

    <div class="sbInp sbInp_BoxSimpleOrange">
		
        <div class="sbSimpleBox">
            <div class="sbSimpleBoxTitle">
                SEARCH
            </div>
            <div class="sbSimpleBoxContent">
                <xsl:if test="portal-filters">
                    <div style = "margin: 0 0 12px 0;">
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

                <input type="text" class="searchBox" onfocus="sbInp_BoxSimpleOrange_removePlaceholder(this);" onblur="sbInp_BoxSimpleOrange_checkInput(this)">
                    <xsl:attribute name="class">searchBox <xsl:if test="init = empty">searchBoxEmpty</xsl:if></xsl:attribute>
                    <xsl:attribute name="value"><xsl:value-of select="init" /></xsl:attribute>
                </input>
                <br/>
                
                <div class="sbBarStart">
                    <div class="sbBarEnd">
                        <div class="sbBarInner">
                        
                            <a href="javascript: ;" class="searchBtn" title="Search">
                                <xsl:attribute name="onclick">var p = avt.sb.$(this).parents(".sbInp:first"); if (p.find(".searchBox").hasClass("searchBoxEmpty")) return false; <xsl:value-of select="fn-search" />(p.find(".searchBox").val(), p.find(".portalFilter").val());</xsl:attribute>
                                Search
                            </a>
                            
                        </div>
                    </div>
                </div>
                
                <div style="clear: both;"></div>
                
                <xsl:if test="isModule != 'true' and isAdmin='true'">
                    <div style="margin: 15px 0 0 0;">
                        <a class="searchManageBtn">
                            <xsl:attribute name="href"><xsl:value-of select="sbManageUrl" /></xsl:attribute>
                            Search Settings
                        </a>
                    </div>
                </xsl:if>
                            
            </div>
        </div>
    </div>
    
    <div style="clear: both;"></div>
    
    <script type="text/javascript">
        function sbInp_BoxSimpleOrange_removePlaceholder (sbox) {
            sbox = avt.sb.$(sbox);
            if (sbox.hasClass("searchBoxEmpty")) {
                sbox.removeClass("searchBoxEmpty").val("");
            }
        }
        function sbInp_BoxSimpleOrange_checkInput(sbox) {
            sbox = avt.sb.$(sbox);
            if (avt.sb.$.trim(sbox.val()).length == 0 || avt.sb.$.trim(sbox.val()) == "<xsl:value-of select="empty" />") {
                sbox.addClass("searchBoxEmpty").val("<xsl:value-of select="empty" />");
            }
        }
        avt.sb.$(document).ready(function() {
            avt.sb.$(".sbInp_BoxSimpleOrange .searchBox").each(function() {
                sbInp_BoxSimpleOrange_checkInput(this);
            });
        });
    </script>
    
</xsl:template>
</xsl:stylesheet>
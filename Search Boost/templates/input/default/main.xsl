<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:tokens="sb:tokens">
                
    <xsl:output method="html" />
    <xsl:template match="/input">

        <div class="sbInp sbInp_Default">

            <input type="text" class="searchBox" onfocus="sbInp_Default_removePlaceholder(this);" onblur="sbInp_Default_checkInput(this)">
                <xsl:attribute name="class">
                    searchBox <xsl:if test="init = empty">searchBoxEmpty</xsl:if>
                </xsl:attribute>
                <xsl:attribute name="value">
                    <xsl:value-of select="init" />
                </xsl:attribute>
            </input>

            <a href="javascript: ;" class="searchBtn">
                <xsl:attribute name="onclick">
                    var p = avt.sb.$(this).parents(".sbInp:first"); if (p.find(".searchBox").hasClass("searchBoxEmpty")) return false;
                    var filters=[]; p.find(".sbcontent-filter").each(function() { filters.push(avt.sb.$(this).val()); });
                    <xsl:value-of select="fn-search" />(p.find(".searchBox").val(), p.find(".portalFilter").val(), filters);
                </xsl:attribute>
                Search
            </a>

            <xsl:if test="isModule != 'true' and isAdmin='true'">
                | <a class="searchManageBtn">
                    <xsl:attribute name="href">
                        <xsl:value-of select="sbManageUrl" />
                    </xsl:attribute>
                    Search Settings
                </a>
            </xsl:if>

            <xsl:if test="portal-filters">
                <div>
                    <b>in </b>
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

            <xsl:for-each select="content-filters/filter">
                <div>
                    <select class="sbcontent-filter">
                        <xsl:for-each select = "items/item">
                            <option>
                                <xsl:attribute name="value">
                                    <xsl:value-of select="key" />
                                </xsl:attribute>
                                <xsl:if test="selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="title" />
                            </option>
                        </xsl:for-each>
                    </select>
                </div>
            </xsl:for-each>

        </div>

        <script type="text/javascript">
            <![CDATA[
        function sbInp_Default_removePlaceholder (sbox) {
            sbox = avt.sb.$(sbox);
            if (sbox.hasClass("searchBoxEmpty")) {
                sbox.removeClass("searchBoxEmpty").val("");
            }
        }
        function sbInp_Default_checkInput(sbox) {
            sbox = avt.sb.$(sbox);
            if (avt.sb.$.trim(sbox.val()).length == 0 || avt.sb.$.trim(sbox.val()) == "]]><xsl:value-of select="empty" /><![CDATA[") {
                sbox.addClass("searchBoxEmpty").val("]]><xsl:value-of select="empty" /><![CDATA[");
            }
        }
        avt.sb.$(document).ready(function() {
            avt.sb.$(".sbInp_Default .searchBox").each(function() {
                sbInp_Default_checkInput(this);
            });
        });
        ]]>
        </script>

    </xsl:template>
</xsl:stylesheet>
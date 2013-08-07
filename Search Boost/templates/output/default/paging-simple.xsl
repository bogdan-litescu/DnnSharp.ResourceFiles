<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tokens="sb:tokens">

    <xsl:import href="../../.common/social-sharing.xsl"/>
    <xsl:output method="html" />
    
    <xsl:template name="paging">

        <xsl:if test = "summary/pagecount &gt; 1">
            <div class = "avtsb_pager">
                <xsl:if test="summary/pages/p[1]/@ipage != 1">
                    ...
                </xsl:if>
                <xsl:for-each select = "summary/pages/p">
                    <xsl:choose>
                        <xsl:when test = "/search/summary/activepage = @ipage">
                            <span class = "avtsbSelPage">
                                <xsl:value-of select = "@ipage"/>
                            </span>
                        </xsl:when>
                        <xsl:otherwise>
                            <a class = "avtsbPageLink">
                                <xsl:attribute name="href">
                                    <xsl:value-of select="." />
                                </xsl:attribute>
                                <xsl:value-of select = "@ipage"/>
                            </a>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
                <xsl:if test="summary/pages/p[last()]/@ipage != summary/pagecount">
                    ...
                </xsl:if>
            </div>
        </xsl:if>
    
    </xsl:template>

</xsl:stylesheet>

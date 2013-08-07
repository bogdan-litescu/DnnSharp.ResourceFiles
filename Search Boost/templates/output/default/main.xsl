<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:msxsl="urn:schemas-microsoft-com:xslt"
                xmlns:tokens="sb:tokens"
                xmlns:html="sb:html">

    <xsl:import href="../../.common/social-sharing.xsl"/>
    <!--<xsl:import href="paging-simple.xsl"/>-->
    <xsl:import href="paging-full.xsl"/>
    <xsl:output method="html" />
    <xsl:template match="/search">

        <!-- Example of using tokens in the template -->
        <!-- <xsl:value-of select="tokens:Replace('[QueryString:MyTest]')" /> -->

        <div class = "avtsbDefault" >
            <div class = "avtsb_title_big">

                <xsl:if test="summary/pagesize-option">
                    <div style="float: right;">
                        <xsl:for-each select="summary/pagesize-option">
                            <xsl:choose>
                                <xsl:when test="/search/summary/pagesize = .">
                                    <span style="font-weight: bold;">
                                        <xsl:value-of select="." />
                                    </span>
                                </xsl:when>
                                <xsl:otherwise>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:value-of select="/search/summary/pagesize-baseurl" />sb-pagesize=<xsl:value-of select="." />
                                        </xsl:attribute>
                                        <xsl:value-of select="." />
                                    </a>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="position() &gt; 0 and position() &lt; last()"> | </xsl:if>
                        </xsl:for-each>
                        results per page
                    </div>
                </xsl:if>
                
                Displaying results <b>
                    <xsl:value-of select="summary/first_result" /> - <xsl:value-of select="summary/last_result" />
                </b>

                
                
                <xsl:if test="summary/allow_sort = 'true'">
                    sorted by
                    <select>
                        <xsl:attribute name="onchange">
                            window.location='<xsl:value-of select="summary/sortlessurl" />sb-sort=' + avt.sb.$(this).val();
                        </xsl:attribute>
                        <option value="">&lt;Default&gt;</option>
                        <option value="relevance">
                            <xsl:if test="summary/current_usersort = 'relevance'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            Relevance
                        </option>
                        <option value="title">
                            <xsl:if test="summary/current_usersort = 'title'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            Title
                        </option>
                        <option value="datepublished">
                            <xsl:if test="summary/current_usersort = 'datepublished'">
                                <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            Recency
                        </option>
                    </select>
                </xsl:if>
            </div>

            <xsl:if test="summary/current-facets/cat">
                <div class="sb-pnlcurrentfacets">
                    Filtering by
                    <xsl:for-each select = "summary/current-facets/cat">
                        <a class="sb-facet">
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <xsl:value-of select="name" />
                        </a>&#160;
                    </xsl:for-each>
                    (<a class="sb-facet">
                        <xsl:attribute name="href">
                            <xsl:value-of select="summary/current-facets/clearurl" />
                        </xsl:attribute>Clear Filters
                    </a>)
                </div>
            </xsl:if>

            <xsl:if test="summary/facets/cat != ''">
                <div class="sb-pnlfacets">
                    <xsl:for-each select = "summary/facets/cat">
                        <a class="sb-facet">
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <xsl:value-of select="name" /> (<xsl:value-of select="count" />)
                        </a>&#160;
                    </xsl:for-each>
                </div>
            </xsl:if>

            <div class="sb-results">
                <xsl:for-each select = "results/result">
                    <div class = "avtsb_result">

                        <!-- <xsl:value-of select="data/field[@name='data1']" /> -->
                        <!-- <img>
                            <xsl:attribute name="src"><xsl:value-of select="data/field[@name='yourDataName']" /></xsl:attribute>
                        </img> -->

                        <a class = "avtsb_title">
                            <xsl:if test="target">
                                <xsl:attribute name="target">
                                    <xsl:value-of select="target" />
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:attribute name="href">
                                <xsl:value-of select="url" />
                            </xsl:attribute>
                            <!-- <xsl:value-of select="substring(title,19)" disable-output-escaping="yes" /> -->
                            <xsl:if test="urlfwd">
                                <xsl:attribute name="onmousedown">
                                    $(this).attr('href', '<xsl:value-of select="urlfwd" />');
                                </xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="title" disable-output-escaping="yes" />
                        </a>

                        <div class = "avtsb_url">
                            <xsl:value-of select="plainurl" />
                        </div>
                        <div class = "avtsb_desc">
                            <xsl:value-of select="description" disable-output-escaping="yes" />
                        </div>
                        <div style="clear: both;"></div>

                        <xsl:if test="count(/search/summary/social/*) > 0">
                            <div style="float: left; margin: 0 6px 0 0;">
                              <xsl:call-template name="social-sharing">
                                    <xsl:with-param name="title">
                                        <xsl:value-of select="html:stripHtml(title)" />
                                    </xsl:with-param>
                                    <xsl:with-param name="desc">
                                        <xsl:value-of select="description" disable-output-escaping="yes" />
                                    </xsl:with-param>
                                    <xsl:with-param name="url">
                                        <xsl:value-of select="url" />
                                    </xsl:with-param>
                                </xsl:call-template>
                            </div>
                        </xsl:if>

                        <xsl:if test="/search/summary/morelikethis">
                            <div style="float: left; margin: 4px 0 0 0;">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="/search/summary/morelikethis/baseurl" />&amp;sb-mlt=<xsl:value-of select="docid" />
                                    </xsl:attribute>
                                    More like this
                                </a>
                            </div>
                        </xsl:if>

                        <div style="clear: both;"></div>

                    </div>
                </xsl:for-each>
            </div>

            <xsl:call-template name="paging"></xsl:call-template>

            <div class =" avtsb_comment">
                Your search for <b>
                    <xsl:value-of select="summary/term" disable-output-escaping="yes" />
                </b> generated <b>
                    <xsl:value-of select="summary/resultcount" />
                </b> results in <xsl:value-of select="summary/execution_time" /> seconds.
            </div>
        </div>
    </xsl:template>

</xsl:stylesheet>




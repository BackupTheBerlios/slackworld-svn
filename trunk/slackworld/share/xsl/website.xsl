<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet []>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:html="http://www.w3.org/1999/xhtml"
  version="1.0">

<xsl:import href="/usr/share/xml/docbook/website/xsl/website.xsl"/>

<xsl:output method="html" indent="yes" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

<xsl:param name="footer.hr">0</xsl:param>

<!-- Prefix all titles with "The Slack World" -->

<xsl:template match="title" mode="head.mode">
  <title>The Slack World: <xsl:value-of select="."/></title>
</xsl:template>

<!-- Include the SlackWorld banner on all pages -->

<xsl:template name="allpages.banner">
  <img src="/images/slackworld.png" class="banner"/>
</xsl:template>

<!-- Create a smaller subtitle if it exists -->

<xsl:template match="subtitle" mode="title.mode">
  <h2 class="{name(.)}">
    <xsl:apply-templates/>
  </h2>
</xsl:template>

<!-- Formatting of author information -->

<xsl:template match="author">
  <p>
    <b>Author:</b> <xsl:apply-templates/>
  </p>
</xsl:template>

<!-- Support editor tags, this is not available in plain DocBook/Website -->

<xsl:template match="head/editorgroup" mode="head.mode">
</xsl:template>

<xsl:template match="head/editorgroup">
  <p>
    <b>Editor:</b> <xsl:apply-templates/>
  </p>
</xsl:template>

<xsl:template match="caption">
  <p>
    <b><xsl:apply-templates/></b>
  </p>
</xsl:template>

<xsl:template match="webpage">
  <xsl:variable name="id">
    <xsl:call-template name="object.id"/>
  </xsl:variable>

  <xsl:variable name="filename">
    <xsl:apply-templates select="." mode="filename"/>
  </xsl:variable>

  <xsl:variable name="tocentry" select="$autolayout/autolayout//*[$id=@id]"/>
  <xsl:variable name="toc" select="$tocentry/ancestor-or-self::toc"/>

  <html>
    <xsl:apply-templates select="head" mode="head.mode"/>
    <xsl:apply-templates select="config" mode="head.mode"/>
    <body class="website">
      <xsl:call-template name="body.attributes"/>

      <div class="{name(.)}">
        <a name="top"/>
        <a name="{$id}"/>

        <div id="banner">
          <xsl:call-template name="allpages.banner"/>
        </div>

        <br/>

        <div id="container">
          <div id="menu">
            <a class="menu">
              <xsl:attribute name="href">
                <xsl:call-template name="homeuri"/>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:text>Home of The Slack World</xsl:text>
              </xsl:attribute>
              <xsl:text>Home</xsl:text>
            </a>
	    <a class="menu">
	      <xsl:attribute name="href">
	        <xsl:text>index.html</xsl:text>
	      </xsl:attribute>
	      <xsl:attribute name="title">
	        <xsl:text>Table of contents</xsl:text>
	      </xsl:attribute>
	      <xsl:text>Toc</xsl:text>
	    </a>
            <a class="menu">
              <xsl:attribute name="href">
                <xsl:call-template name="root-rel-path"/>
                <xsl:text>contact.html</xsl:text>
              </xsl:attribute>
              <xsl:attribute name="title">
                <xsl:text>Contact us</xsl:text>
              </xsl:attribute>
              <xsl:text>Contact</xsl:text>
            </a>
          </div>

          <div id="content">
            <xsl:apply-templates select="./head/title" mode="title.mode"/>
  	    <xsl:apply-templates select="./head/subtitle" mode="title.mode"/>
	    <xsl:apply-templates select="./head/author"/>
            <xsl:apply-templates select="./head/editorgroup"/>
            <xsl:apply-templates select="child::*[name(.)!='webpage']"/>

            <p align="right">
              <a href="#top">Back to top</a>
            </p>
          </div>
        </div>

        <br/>

        <div id="copyright">
          The individual articles are copyrighted by their authors.
        </div>

        <p>
	  <xsl:attribute name="align">
	    <xsl:text>center</xsl:text>
	  </xsl:attribute>
          <a>
            <xsl:attribute name="href">
              <xsl:text>http://developer.berlios.de/projects/slackworld/</xsl:text>
            </xsl:attribute>
            <img>
              <xsl:attribute name="src">
                <xsl:text>http://developer.berlios.de/bslogo.php?group_id=3435&amp;type=1</xsl:text>
              </xsl:attribute>
              <xsl:attribute name="alt">
                <xsl:text>BerliOS Logo</xsl:text>
              </xsl:attribute>
              <xsl:attribute name="border">
                <xsl:text>0</xsl:text>
              </xsl:attribute>
            </img>
          </a>
        </p>
<!--
        <br/>
        <div id="footer">
          <xsl:call-template name="process.footnotes"/>
          <xsl:call-template name="webpage.footer"/>
        </div>
-->
      </div>
    </body>
  </html>
</xsl:template>

</xsl:stylesheet>

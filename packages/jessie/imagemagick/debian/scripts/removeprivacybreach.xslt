<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:xs="http://www.w3.org/2001/XMLSchema"
		exclude-result-prefixes="xsl xs">

  <xsl:output method="xml"
	      omit-xml-declaration="yes"
	      version="1.0" encoding="UTF-8"
	      doctype-public="-//W3C//DTD XHTML 1.1//EN"
	      doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
	      indent="no"/>

  <!-- ****************************** -->
  <!-- *   Some utilities function  * -->
  <!-- ****************************** -->


  <!-- basename -->
  <xsl:template name="basename">
    <xsl:param name="path"/>
    <xsl:choose>
      <xsl:when test="contains($path, '/')">
	<xsl:call-template name="basename">
	  <xsl:with-param name="path" select="substring-after($path, '/')"/>
	</xsl:call-template>
      </xsl:when>
      <xsl:otherwise>
	<xsl:value-of select="$path"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- dirname -->
  <xsl:template name="dirname"><xsl:param name="path"/>
  <xsl:if test="contains($path, '/')">
    <xsl:value-of select=" substring-before($path, '/') "/>
    <xsl:text>/</xsl:text>
  <xsl:call-template name="dirname"><xsl:with-param select="substring-after($path, '/')" name="path"/></xsl:call-template></xsl:if>
  </xsl:template>

  <!-- replace every dir by .. -->
  <xsl:template name="root">
    <xsl:param name="path"/>
    <xsl:choose>
      <xsl:when test="$path=''"></xsl:when>
      <xsl:when test="contains($path, '/')">
	<xsl:text>..</xsl:text>
	<xsl:if test="substring-after($path, '/')">
	  <xsl:text>/</xsl:text>
	  <xsl:call-template name="root">
	    <xsl:with-param select="substring-after($path, '/')" name="path"/>
	  </xsl:call-template>
	</xsl:if>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <!-- ****************************** -->
  <!-- *   local function          * -->
  <!-- ****************************** -->

  <!-- Replace well know legacy imagemagick website with correct local location -->
  <xsl:template name="replacelegacy">
    <xsl:param name="path"/>
    <xsl:choose>
      <xsl:when test="substring($path, string-length($path) - string-length('//') +1)='//'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="substring($path,1,string-length($path) -1)" name="path"/>
	</xsl:call-template>
      </xsl:when>
      <!-- discourse server is external website -->
      <xsl:when test="substring($path, string-length($path) - string-length('.imagemagick.org/discourse-server') +1)='.imagemagick.org/discourse-server'">
	<xsl:text>https://www.imagemagick.org/discourse-server</xsl:text>
      </xsl:when>
      <xsl:when test="substring($path, string-length($path) - string-length('.imagemagick.org/discourse-server/') +1)='.imagemagick.org/discourse-server/'">
	<xsl:text>https://www.imagemagick.org/discourse-server/</xsl:text>
      </xsl:when>
      <xsl:when test="contains($path,'.imagemagick.org/discourse-server')">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- direct link to imagemagick -->
      <xsl:when test="substring($path, string-length($path) - string-length('.imagemagick.org') +1)='.imagemagick.org'">
	<xsl:text>https://www.imagemagick.org/</xsl:text>
      </xsl:when>
      <xsl:when test="substring($path, string-length($path) - string-length('.imagemagick.org/') +1)='.imagemagick.org/'">
	<xsl:text>https://www.imagemagick.org/</xsl:text>
      </xsl:when>
      <!-- direct link to git -->
      <xsl:when test="contains($path,'git.imagemagick.org/')">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- direct link to usage -->
      <xsl:when test="contains($path,'.imagemagick.org/Usage')">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- direct link to download -->
      <xsl:when test="contains($path,'.imagemagick.org/download/')">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- direct link to download -->
      <xsl:when test="substring($path, string-length($path) - string-length('.imagemagick.org/download') +1)='.imagemagick.org/download'">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- direct link to ftp -->
      <xsl:when test="contains($path,'ftp://')">
	<xsl:value-of select="$path"/>
      </xsl:when>
      <!-- strip http:// -->
      <xsl:when test="contains($path, '://')">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="substring-after($path, '://')" name="path"/>
	</xsl:call-template>
      </xsl:when>
      <!-- replace php by html -->
      <xsl:when test="substring($path, string-length($path) - string-length('.php') +1)='.php'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="concat(substring($path,1,string-length($path) - string-length('.php')),'.html')" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- replace legacy with www -->
      <xsl:when test="substring($path,1,string-length('legacy.imagemagick.org/'))='legacy.imagemagick.org/'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="concat('www.imagemagick.org/',substring($path,string-length('legacy.imagemagick.org/')+1))" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- replace script sub dir with www -->
      <xsl:when test="substring($path,1,string-length('www.imagemagick.org/script/'))='www.imagemagick.org/script/'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="concat('www.imagemagick.org/www/',substring($path,string-length('www.imagemagick.org/script/')+1))" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- replace legacy.imagemagick.org by nothing -->
      <xsl:when test="substring($path,1,string-length('www.imagemagick.org/'))='www.imagemagick.org/'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="substring($path,string-length('www.imagemagick.org/')+1)" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- spurious / -->
      <xsl:when test="substring($path,1,1)='/'">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="substring($path,2)" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- if no dir it is default thus www/ dir -->
      <xsl:when test="substring-before($path,'/')=''">
	<xsl:call-template name="replacelegacy">
	  <xsl:with-param select="concat('www/',$path)" name="path" />
	</xsl:call-template>
      </xsl:when>
      <!-- replace by relative path (filename part)-->
      <xsl:otherwise>
	<xsl:choose>
	  <xsl:when test="substring($filename,1,string-length('./www'))='./www'">
	    <xsl:call-template name="root">
	      <xsl:with-param select="substring($filename,string-length('./www')+1)" name="path"/>
	    </xsl:call-template>
	  </xsl:when>
	</xsl:choose>

	<!-- replace by relative path (link part)-->
	<xsl:call-template name="dirname">
	  <xsl:with-param select="$path" name="path"/>
	</xsl:call-template>
	<xsl:call-template name="basename">
	  <xsl:with-param select="$path" name="path"/>
	</xsl:call-template>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="magickcsspath">
    <!-- replace by relative path (filename part)-->
    <xsl:choose>
      <xsl:when test="substring($filename,1,string-length('./www'))='./www'">
	<xsl:call-template name="root">
	  <xsl:with-param select="substring($filename,string-length('./www')+1)" name="path"/>
	  </xsl:call-template><xsl:text>www/css/magick.css</xsl:text>
      </xsl:when>
      <xsl:otherwise>
	<xsl:text>www/css/magick.css</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <!-- ****************************** -->
  <!-- *   Global template          * -->
  <!-- ****************************** -->


  <!-- the identity template -->
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>

  <!-- Add some versionning -->
  <xsl:template match="*[local-name(.)='html']">
    <xsl:text>&#10;</xsl:text>
    <xsl:comment>Regenerated with privacy breach removal script</xsl:comment>
    <xsl:text>&#10;</xsl:text>
    <xsl:copy>
      <xsl:apply-templates select="@* | node()" />
    </xsl:copy>
  </xsl:template>

  <!-- replace pointer to legacy site -->
  <xsl:template match="*[local-name(.) = 'a'][contains(@href,'legacy.imagemagick.org')]">
    <xsl:message><xsl:text>Replace in </xsl:text><xsl:value-of select="$filename" /><xsl:text> </xsl:text><xsl:value-of select="@href" /><xsl:text> by </xsl:text><xsl:call-template name="replacelegacy"><xsl:with-param select="@href" name="path"/></xsl:call-template></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:call-template name="replacelegacy"><xsl:with-param select="@href" name="path"/></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'img'][contains(@src,'legacy.imagemagick.org')]">
    <xsl:message><xsl:text>Replace in </xsl:text><xsl:value-of select="$filename" /><xsl:text> </xsl:text><xsl:value-of select="@src" /><xsl:text> by </xsl:text><xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <!-- replace pointer to legacy site -->
  <xsl:template match="*[local-name(.) = 'a'][contains(@href,'www.imagemagick.org')]">
    <xsl:message><xsl:text>Replace in </xsl:text><xsl:value-of select="$filename" /><xsl:text> </xsl:text><xsl:value-of select="@href" /><xsl:text> by </xsl:text><xsl:call-template name="replacelegacy"><xsl:with-param select="@href" name="path"/></xsl:call-template></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:call-template name="replacelegacy"><xsl:with-param select="@href" name="path"/></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'img'][contains(@src,'www.imagemagick.org')]">
    <xsl:message><xsl:text>Replace in </xsl:text><xsl:value-of select="$filename" /><xsl:text> </xsl:text><xsl:value-of select="@src" /><xsl:text> by </xsl:text><xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'input'][contains(@src,'www.imagemagick.org')]">
    <xsl:message><xsl:text>Replace in </xsl:text><xsl:value-of select="$filename" /><xsl:text> </xsl:text><xsl:value-of select="@src" /><xsl:text> by </xsl:text><xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template></xsl:message>
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:call-template name="replacelegacy"><xsl:with-param select="@src" name="path"/></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>
  


  <!-- remove various privacy breach -->
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'googlesyndication')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'google_ad')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(comment(),'google_ad')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'apis.google.com/js/plusone.js')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'GoogleAnalyticsObject')]" />
  <xsl:template match="*[local-name(.) = 'div'][@class='g-plusone']" />
  <xsl:template match="*[local-name(.) = 'meta'][@name='google-site-verification']" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'pagead/show_ads.js')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'document.getElementById(&quot;gplusone&quot;)')]" />
  <xsl:template match="*[local-name(.) = 'adsense']" />
  <xsl:template match="*[local-name(.) = 'CustomSearchEngine']" />
  <xsl:template match="*[local-name(.) = 'customsearchengine']" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'google.com/jsapi')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'google.search.CustomSearchControl')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'adsbygoogle')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'window.adsbygoogle')]" />
  <xsl:template match="*[local-name(.) = 'ins'][@class='adsbygoogle']" />
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'google-analytics.com/analytics.js')]" />

  <!-- remove google fonts -->
  <xsl:template match="*[local-name(.) = 'link'][contains(@href,'//fonts.googleapis.com/css')]" />

  <!-- flattr -->
  <xsl:template match="*[local-name(.) = 'script'][contains(text(),'http://api.flattr.com/js/0.6/load.js?mode=auto')]" />
  <xsl:template match="*[local-name(.) = 'img'][contains(@src,'api.flattr.com/button/flattr-badge-large.png')]" />
  <xsl:template match="*[local-name(.) = 'iframe'][contains(@src,'tools.flattr.net/widgets/thing.html')]" />
  <xsl:template match="*[local-name(.) = 'div'][child::a[@class='FlattrButton']]" />
  <xsl:template match="*[local-name(.) = 'noscript'][child::*[local-name(.) = 'a'][contains(@href,'flattr.com/thing/')]]" />
  <xsl:template match="*[local-name(.) = 'a'][@class='FlattrButton']" />


  <!-- replace online jquery with local one -->
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.min.js')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:value-of select="'/usr/share/javascript/jquery/jquery.min.js'"/>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.mousewheel')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:value-of select="'/usr/share/javascript/jquery-mousewheel/jquery.mousewheel.js'"/>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.fancybox.pack.js')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="src">
	<xsl:value-of select="'/usr/share/javascript/jquery-fancybox/jquery.fancybox.min.js'"/>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <xsl:template match="*[local-name(.) = 'link'][contains(@href,'jquery.fancybox.css')]">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:value-of select="'/usr/share/javascript/jquery-fancybox/jquery.fancybox.css'"/>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>

  <!-- rename some error -->
  <xsl:template match="*[local-name(.) = 'link'][substring(@href, string-length(@href) - string-length('magick.html') +1)='magick.html']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:call-template name="magickcsspath"></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="*[local-name(.) = 'link'][substring(@href, string-length(@href) - string-length('magick.css') +1)='magick.css']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:call-template name="magickcsspath"></xsl:call-template>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="*[local-name(.) = 'script'][substring(@src, string-length(@src) - string-length('magick.html') +1)='magick.html']">
    <xsl:copy>
      <xsl:apply-templates select="@*"/>
      <xsl:attribute name="href">
	<xsl:value-of select="substring(@src,1,string-length(@src) - string-length('.html'))"/><xsl:text>.js</xsl:text>
      </xsl:attribute>
    </xsl:copy>
  </xsl:template>


  <!-- temporary remove optionnal package -->
  <xsl:template match="*[local-name(.) = 'link'][@type='text/css' and contains(@href,'jquery.fancybox-buttons.css')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.fancybox-buttons.js')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.fancybox-media.js')]" />
  <xsl:template match="*[local-name(.) = 'link'][@type='text/css' and contains(@href,'jquery.fancybox-thumbs.css')]" />
  <xsl:template match="*[local-name(.) = 'script'][contains(@src,'jquery.fancybox-thumbs.js')]" />

  <!-- remove rss meta data -->
  <xsl:template match="*[local-name(.)= 'link'][@href='http://imagemagick.org/ici.rdf']" />

</xsl:stylesheet>

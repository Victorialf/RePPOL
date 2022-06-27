<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes"/>
	
	<xsl:template match="/" name="interfaxim">
		<xsl:apply-templates select="//tei:TEI"/>
	</xsl:template>
	<!-- VARIABLE POUR MULTIPAGES -->
<!--ATTENTION : les chemins de result document ne fonctionnent qu'en local il faut donc adapter-->
	<!--	déclaration variable pour RESULTS-DOC-->
	<xsl:variable name="basename">reppol</xsl:variable>
	<xsl:variable name="home" select="concat($basename, '_home','.html')"/>
	<xsl:variable name="about" select="concat($basename, '_about','.html')"/>
	<xsl:variable name="pedago" select="concat($basename, '_trancriptioninteractive','.html')"/>
	<xsl:variable name="index_characters" select="concat($basename,'_indexcharacters.html')"/>
	<xsl:variable name="index_places" select="concat($basename,'_indexplaces.html')"/>
	<xsl:variable name="index_dates" select="concat($basename,'_indexdates.html')"/>
	<xsl:variable name="transcriptions" select="concat($basename,'_transcription')"/><!-- ATTENTION je n'ai pas de '.html' pour produire page de sélection et page de chacune des transcriptions -->

	<!--	template pour HEAD-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<meta charset="UTF-8"/>
			<meta name="author" content="Aude DE MÉZERAC-ZANETI; Olivier SPINA; Victoria LE FOURNER; Felipe GOES SILVA; Adrien MÉVEL;"/>
			<meta name="description" content="transcriptions échantillons de Cambridge, Corpus Christi College, MS 128: Documents Relating to Archbishop Cranmer, manuscrit conservé à la Parker Library"/>
			<meta name="keywords" content="XSLT,XML,TEI"/>
			<link rel="icon" type="image/jpg" href=""/><!--LINK ICI-->
			<link rel="stylesheet" href="reppol.css" type="text/css"/><!--LINK ICI-->
			<title>RePPOL - <xsl:value-of select="$title"/></title>
		</head>
	</xsl:template>
	<!--	template pour HEADER-->
	<xsl:template name="header">
		<header id="top">
			<div class="logo">
				<a href="{$home}"><img src="logo_reppol-noir-rouge.png" class="logo"></img></a>
			</div>
			<!--						<h1>
							RePPOL-PAPE
						</h1>-->
			<nav class="nav_top">
				<ul>
					<!--<li>
						<a href="{$home}">Home</a>
					</li>-->
					<li>
						<a href="{$about}">The project</a>
					</li>
					<li>
						<a href="{concat($transcriptions,'.html')}">Transcriptions</a>
					</li>
					<li>
						<a href="{$pedago}">Interactive transcriptions</a>
					</li>
					<li>Index
						<ul class="nav_index">
							<li><a href="{$index_characters}">Persons</a></li>
							<li><a href="{$index_places}">Places</a></li>
							<li><a href="{$index_dates}">Dates</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</header>
		<script>
			
			function reppol_t(){
			document.getElementById("calendar").style.display="none";
			document.getElementById("transcription_reppol").style.display="block";
			}
			function calendar_t(){
			document.getElementById("transcription_reppol").style.display="none";
			document.getElementById("calendar").style.display="block";
			}
			function topFunction() {
			document.body.scrollTop = 0; // For Safari
			document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
			}
			
			<!--var facsHeight = $('#facspage').css('height');
			//manipulate the height as you want if it is different than the maindiv's height
			$('#text').css('max-height', 'facsHeight');-->
		</script>
	</xsl:template>
	<!--	template pour FOOTER-->
	<xsl:template name="footer">
		<footer>
			<div>
				<p>More documentation on <a href="" target="blanck">GitLab</a></p>
			</div>
			<div>
				<p>Mention légales :</p>
			</div>
			<div>
				<p>Events about RePPOL</p>
				<ul>
					<li><a href="" target="blanck">exemple</a></li>
					<li><a href="" target="blanck">exemple</a></li>
					<li><a href="" target="blanck">placeholder</a></li>
					<li><a href="" target="blanck">placeholder</a></li>
					<li><a href="" target="blanck">placeholder</a></li>
				</ul>
			</div>
		</footer>
	</xsl:template>
	
<!--	DÉBUT page home-->
	<xsl:template match="tei:TEI">
		<xsl:result-document href="{$home}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'home'"/>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header"/>
					<article id="home">
						<section>
							<!--<p>Le projet RePPOL est un projet scientifique et pédagogique collaboratif consacré à la transcription, l'édition critique et l'analyse du manuscrit <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 conservé à la bibliothèque de Corpus Christi College, Cambridge</a>.</p>-->
							<p>The Rethinking Prebendaries Plot Online (RePPOL) project is a pedagogic, scientific and collaborative project dedicated to the transcription, critical edition and analysis of the <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 manuscript kept in the Parker Library</a>.</p>
						</section>
						<section class="home_buttons">
							<a class="button" href="{concat($transcriptions, '.html')}"><button>
								Transcriptions
							</button></a>
							<a class="button" href="{$pedago}"><button>
								Interactive transcriptions
							</button></a>
							<a class="button" href="{$about}"><button>
								About the project
							</button></a>
							<a class="button" href="{$index_characters}"><button>
								Persons index
							</button></a>
							<a class="button" href="{$index_places}"><button>
								Places index
							</button></a>
							<a class="button" href="{$index_dates}"><button>
								Dates index
							</button></a>
						</section>
						<!--Alternative version - abandoned cause ugly
							<section>
							<p>To read the transcriptions made by the RePPOL project click <a href="{$transcriptions}">here</a>.</p>
							<p>To learn more about the project click <a href="{$about}">here</a>.</p>
							<p>To enjoy the interactive transcriptions click <a href="{$pedago}">here</a>.</p>
							<p>Or take a look at the indexes :</p>
							<ul>
								<li>to learn about the <a href="{$index_characters}">characters</a></li>
								<li>to discover <a href="{$index_places}">places</a></li>
								<li>to check the <a href="{$index_dates}">dates</a></li>
							</ul>
						</section>-->
					</article>
<!--					<xsl:call-template name="footer"/>-->
				</body>
			</html>
		</xsl:result-document>
<!--	FIN page HOME-->
<!--	DÉBUT page ABOUT-->
		<xsl:result-document href="{$about}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'about'"/>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header"/>
					<article id="about">
						<section><!--class="project_right" /version colonne/-->
							<!--		<!-\-<h2>The project</h2>-\->
							<p>Le projet RePPOL est un projet scientifique et pédagogique collaboratif consacré à la transcription, l'édition critique et l'analyse du manuscrit <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 conservé à la bibliothèque de Corpus Christi College, Cambridge</a>.<br />Pour en savoir plus, cliquez <a href="#moreabout">ICI</a>.</p>-->
							<p>Led by :</p>
							<ul>
								<xsl:for-each select="//tei:respStmt">
									<li>
										<xsl:apply-templates/>
									</li>
								</xsl:for-each>
							</ul>
							<p>Financed by :</p>
							<ul>
								<xsl:for-each select="//tei:funder">
									<li>
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="@ref"/>
											</xsl:attribute>
											<xsl:attribute name="target">blanck</xsl:attribute>
											<xsl:value-of select="."/>
										</xsl:element>
									</li>
								</xsl:for-each>
							</ul>
							<p>Supported by :</p>
							<ul>
								<xsl:for-each select="//tei:sponsor">
									<li>
										<xsl:element name="a">
											<xsl:attribute name="href">
												<xsl:value-of select="@ref"/>
											</xsl:attribute>
											<xsl:attribute name="target">blanck</xsl:attribute>
											<xsl:value-of select="."/>
										</xsl:element>
									</li>
								</xsl:for-each>
							</ul>
						</section>
						<section> <!--class="project_left" /version colonne/-->
							<xsl:for-each select="//tei:projectDesc/tei:p[@xml:lang='en']">
								<p>
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</section>
						<section><!--class="project_right" /version colonne/-->
							<!--<p>Les <a href="{$pedago}" target="blanck">transcriptions interactives</a> vous propose une démonstration sur dix pages de transcriptions interactives paléographiques et pédagogiques constituées à l'aide de la transformation <a href="https://github.com/TimotheAlbouy/Interfaxim" target="blanck">Interfaxim</a> développé par <a href="https://github.com/TimotheAlbouy" target="blanck">M. Thimothe Albouy</a>.</p>-->
							<p>The ten pages long demonstration offered as <a href="{$pedago}" target="blanck">interactive transcriptions</a> wouldn't have been possible without the <a href="https://github.com/TimotheAlbouy/Interfaxim" target="blanck">Interfaxim</a> XSL-stylesheet developped by <a href="https://github.com/TimotheAlbouy" target="blanck">Mr Thimothe Albouy</a>.</p>
						</section>
					</article>
<!--					<xsl:call-template name="footer"/>-->
				</body>
			</html>
		</xsl:result-document>
<!--	FIN page ABOUT-->
<!--	DÉBUT page PEDAGO-->
		<xsl:result-document href="{$pedago}">
				<html>
					<xsl:call-template name="head">
						<xsl:with-param name="title" select="'interactive transcriptions'"/>
					</xsl:call-template>
					<body>
						<xsl:call-template name="header"/>
						<article id="transcription_pedago"><!--div transcription et navigation entre les pages-->
							<!--<h2>PAPE-RePPOL</h2>-->
							<div id="tabs-sections" class="tabs">
								<xsl:for-each select="//tei:facsimile/tei:surface">
									<button onclick="{concat('changeSection(event, ', position(), ')')}">Page
<!--										<xsl:value-of select="position()"/>-->
										<xsl:value-of select="tei:graphic/@n"/>
									</button>
								</xsl:for-each>
							</div>
							<xsl:for-each select="//tei:facsimile/tei:surface">
								<xsl:variable name="url" select="tei:graphic/@url"/>
								<div class="section-wrapper" data-section="{position()}">
									<img src="{$url}"/>
									<div class="zone-list">
										<xsl:for-each select="tei:zone">
											<xsl:variable name="left" select="@ulx"/>
											<xsl:variable name="top" select="@uly"/>
											<xsl:variable name="width" select="number(@lrx) - number(@ulx)"/>
											<xsl:variable name="height" select="number(@lry) - number(@uly)"/>
											<xsl:variable name="id" select="@xml:id"/>
											<xsl:variable name="facs" select="concat('#', $id)"/>
											<div class="zone"
												style="top: {$top}px; left: {$left}px; height: {$height}px; width: {$width}px;">
												<span style="top: {$height}px;">
													<xsl:apply-templates select="//tei:seg[@facs = $facs]"/>
												</span>
											</div>
										</xsl:for-each>
									</div>
									<div class="comment">
										<details>
											<summary>Commentaires potentiels ici</summary>
											lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet 
										</details>
									</div>
									<!--a priori c'est ici qu'on ajoute les commentaires pour chacune des pages dans une div
									ATTENTION conflit avec l'implémentation des zones puisque leur taille est absolue et pas relative + trouver un moyen pour bien générer le bon commentaire en face de la bonne page, dans des balises summary/details 
									peut être en ajoutant des correps aussi au truc dans le xml pour faire comme dans le script plus haut-->
								</div>
							</xsl:for-each>
							<script>
								<!--function changeVersion(e, ver) {
								var ovnodes = document.getElementsByClassName("ov");
								var rvnodes = document.getElementsByClassName("rv");
								if (ver === "ov") {
								for (var i = 0; i &lt; ovnodes.length; i++) {
								var el = ovnodes[i];
								el.style.display = "inline";
								}
								for (var i = 0; i &lt; rvnodes.length; i++) {
								var el = rvnodes[i];
								el.style.display = "none";
								}
								} else if (ver === "rv") {
								for (var i = 0; i &lt; ovnodes.length; i++) {
								var el = ovnodes[i];
								el.style.display = "none";
								}
								for (var i = 0; i &lt; rvnodes.length; i++) {
								var el = rvnodes[i];
								el.style.display = "inline";
								}
								}
								var btnVersions = document.querySelectorAll("#tabs-versions button");
								for (var i = 0; i &lt; btnVersions.length; i++) {
								var el = btnVersions[i];
								el.className = el.className.replace(" active", "");
								}
								e.currentTarget.className += " active";
								}-->
								
								function changeSection(e, sec) {
								var sections = document.getElementsByClassName("section-wrapper");
								for (var i = 0; i &lt; sections.length; i++) {
								var el = sections[i];
								if (el.dataset.section == sec)
								el.style.display = "inline-block";
								else el.style.display = "none";
								}
								var btnSections = document.querySelectorAll("#tabs-sections button");
								for (var i = 0; i &lt; btnSections.length; i++) {
								var el = btnSections[i];
								el.className = el.className.replace(" active", "");
								}
								e.currentTarget.className += " active";
								}
								
							<!--	document.getElementById("rvBtn").click();-->
								document.querySelector("#tabs-sections button:first-child").click();
							</script>
						</article>
<!--						<xsl:call-template name="footer"/>-->
					</body>
				</html>
		</xsl:result-document>
	</xsl:template>
<!--	FIN page PEDAGO-->


	<xsl:template match="certainty | tei:certainty">
		<span class="ns">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--	MODIFICATION AM 18/05/2022 POUR REPPOL-->
	<xsl:template match="tei:del|tei:hi|hi|del">
		<xsl:element name="span">
			<xsl:attribute name="class">
				<xsl:value-of select="concat('pape_',@rend)"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:add|add">
		<xsl:element name="span">
			<xsl:attribute name="class">
				<xsl:value-of select="concat('pape_',@place)"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:metamark | tei:expan |expan |metamark|tei:note|note">
		<xsl:element name="span">
			<xsl:attribute name="class">
				<xsl:value-of select="concat('pape_',local-name(.))"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
	<xsl:template match="tei:ref">
		<xsl:element name="a">
			<xsl:attribute name="href">
				<xsl:value-of select="@target"/>
			</xsl:attribute>
			<xsl:attribute name="target">blanck</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<xsl:template match="tei:name">
		<xsl:choose>
			<xsl:when test="@ref">
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="@ref"/>
					</xsl:attribute>
					<xsl:attribute name="target">blanck</xsl:attribute>
					<xsl:apply-templates/>
				</xsl:element>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="descendant::tei:resp"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
				<xsl:text>, </xsl:text>
				<xsl:value-of select="descendant::tei:resp"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>


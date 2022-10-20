<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>

	<!--	déclaration variable pour RESULTS-DOC-->
	<xsl:variable name="basename">reppol</xsl:variable>
	<xsl:variable name="home" select="concat($basename, '_home', '.html')"/>
	<xsl:variable name="about" select="concat($basename, '_project', '.html')"/>
	<xsl:variable name="legals" select="concat($basename, '_about.html')"/>
	<xsl:variable name="biblio" select="concat($basename,'_biblio.html')"/>
	<xsl:variable name="pedago" select="concat($basename, '_trancriptioninteractive', '.html')"/>
	<xsl:variable name="index_characters" select="concat($basename, '_indexcharacters.html')"/>
	<xsl:variable name="index_places" select="concat($basename, '_indexplaces.html')"/>
	<xsl:variable name="index_dates" select="concat($basename, '_indexdates.html')"/>
	<xsl:variable name="transcriptions" select="concat($basename, '_transcription')"/>
	<!-- ATTENTION je n'ai pas de '.html' pour produire page de sélection et page de chacune des transcriptions -->
	<xsl:template match="tei:teiHeader" mode="text"/>

	<!--	template pour HEAD-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<meta charset="UTF-8"/>
			<meta name="author"
				content="Aude DE MÉZERAC-ZANETI; Olivier SPINA; Victoria LE FOURNER; Felipe GOES SILVA; Adrien MÉVEL;"/>
			<meta name="description"
				content="transcriptions échantillons de Cambridge, Corpus Christi College, MS 128: Documents Relating to Archbishop Cranmer, manuscrit conservé à la Parker Library"/>
			<meta name="keywords" content="XSLT,XML,TEI"/>
			<link rel="stylesheet" href="https://use.typekit.net/duu3aei.css"/>
			<link rel="icon" type="image/jpg" href="img/logo_rep_or.png"/>
			<!--LINK ICI-->
			<link rel="stylesheet" href="reppol.css" type="text/css"/>
			<!--LINK ICI-->
			
			<title>RePPOL - <xsl:value-of select="$title"/></title>
		</head>
	</xsl:template>
	<!--	template pour HEADER-->
	<xsl:template name="header">
		<xsl:param name="white"/>
		<header id="top">
			<div class="logo">
				<a href="{$home}">
					<xsl:choose>
						<xsl:when test="$white='yes'"><img src="img/logo_rep_or.png" class="logo"/></xsl:when>
						<xsl:otherwise><img src="img/logo_rep_wh.png" class="logo"/></xsl:otherwise>
					</xsl:choose>
				</a>
			</div>
			<nav class="nav_top">
				<ul>
					<!--<li>
						<a href="{$home}">Home</a>
					</li>-->
					<li>
						<a href="{$about}">the project</a>
					</li>
					<li>
						<a href="{concat($transcriptions,'.html')}">transcriptions</a>
					</li>
					<li>
						<a href="{$pedago}">interactive transcriptions</a>
					</li>
					<li style="position:relative;">index
						<ul class="nav_index">
							<li><a href="{$index_characters}">persons</a></li>
							<li><a href="{$index_places}">places</a></li>
							<li><a href="{$index_dates}">dates</a></li>
						</ul>
					</li>
					<!--<li>
						<a href="{$biblio}">bibliography</a>
					</li>-->
					<li>
						<a href="{$legals}">about</a>
					</li>
				</ul>
			</nav>
			<div>
<!--				FORM & SEARCH-->
				
			</div>
			<div class="links">
				<a href="https://github.com/Victorialf/RePPOL" target="blanck">
					<img src="img/GitHub-Mark-32px.png"/>
				</a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_cc.png"/></a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_by.png"/></a>
				
			</div>
		</header>
	</xsl:template>
	<!--template pour SCRIPT-->
	<xsl:template name="script">
		<script>
			
			function reppol_t(){
			document.getElementById("calendar").style.display="none";
			document.getElementById("transcription_reppol").style.display="flex";
			}
			function calendar_t(){
			document.getElementById("transcription_reppol").style.display="none";
			document.getElementById("calendar").style.display="flex";
			}
			function topFunction() {
			document.body.scrollTop = 0; // For Safari
			document.documentElement.scrollTop = 0; // For Chrome, Firefox, IE and Opera
			}
			function tabsAnimation(evt, date) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabs_content");
			for (i = 0; i &lt; tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("c_tabs_b");
			for (i = 0; i &lt; tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className.replace(" active_tab", "");
			}
			document.getElementById(date).style.display = "block";
			evt.currentTarget.className += " active_tab";
			}
			<!--var Height = $('#facspage').css('height');
			//manipulate the height as you want if it is different than the maindiv's height
			$('#text').css('max-height', 'Height');-->
			function openTab(evt, tabName) {
			// Declare all variables
			var i, placetabcontent, placetablinks;
			// Get all elements with class="tabcontent" and hide them
			placetabcontent = document.getElementsByClassName("placetabcontent");
			for (i = 0; i &lt; placetabcontent.length; i++) {
			placetabcontent[i].style.display = "none";
			}
			
			// Get all elements with class="tablinks" and remove the class "active"
			placetablinks = document.getElementsByClassName("placetablinks");
			for (i = 0; i &lt; placetablinks.length; i++) {
			placetablinks[i].className = placetablinks[i].className.replace(" active", "");
			}
			
			// Show the current tab, and add an "active" class to the button that opened the tab
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += " active";
			} 
		</script>
		<!--<!-\-		Plus nécessaie après body{overflow:nope}-\->
		<a href="#top"><img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png" class="top"/></a>-->
	</xsl:template>
	<!--	template pour FOOTER-->
	<xsl:template name="footer">
		<section class="home footer">
			<div class="footer_logo">
				<a href="http://www.isite-ulne.fr/index.php/fr/page-daccueil/" target="blanck"><img src="img/logo_isite.png"/></a>
			</div>
			<div class="footer_logo">
				<a href="https://comod.universite-lyon.fr/site-francais/" target="blanck"><img src="img/logo_labex.png"/></a>
			</div>
			<div class="footer_logo">
				<a href="https://www.univ-lille.fr/" target="blanck">
					<img src="img/logo_u_lille.png"/></a>
			</div>
			<div class="footer_logo">
				<a href="https://www.meshs.fr/page/accueil" target="blanck">
					<img src="img/logo_meshs.png"/>
					
				</a>
			</div>
			<div class="footer_logo">
				<a href="https://cecille.univ-lille.fr/" target="blanck"><img src="img/logo_cecille.png"/></a>
			</div>
			<div class="footer_logo">
				<a href="http://larhra.ish-lyon.cnrs.fr/" target="blanck">
					<img src="img/logo_lahra.png"/>
				</a>
			</div>
		</section>
		
		<!--<footer>
			<div class="footer_icons">
				<div class="footer_logo">
					<a href="http://www.isite-ulne.fr/index.php/fr/page-daccueil/" target="blanck"><img src="http://www.isite-ulne.fr/wp-content/uploads/2018/07/I-SITE-ULNE_Logo-COUL_RVB.png"/></a>
				</div>
				<div class="footer_logo">
					<a href="https://comod.universite-lyon.fr/site-francais/" target="blanck"><!-\-<img src="https://comod.universite-lyon.fr/medias/photo/labex-comod-noir-png-300dpi-sans-fond-blanc_1551950983580-png?ID_FICHE=41153"/>-\-><img src="https://comod.universite-lyon.fr/medias/photo/labex-comod-png-300dpi-sans-fond-blanc_1551950869031-png?ID_FICHE=41153"/></a>
				</div>
				<div class="footer_logo">
					<a href="https://www.univ-lille.fr/" target="blanck"><!-\-<img src="ULille.sans.baseline-Horizontal-CMJN-Noir.png"/>-\->
						<img src="https://www.univ-lille.fr/typo3conf/ext/ul2fpfb/Resources/Public/assets/img/logos/ULille-nb.svg"/></a>
				</div>
				<div class="footer_logo">
					<a href="https://www.meshs.fr/page/accueil" target="blanck">
						<img src="http://medias.meshs.fr/medias/images/logos/meshs/MESHS_Logo_NoirRouge_Sans.png"/>
						<!-\-<img src="http://medias.meshs.fr/medias/images/logos/meshs/MESHS_Logo_NoirGris_Sans.png"/>-\->
					</a>
				</div>
				<div class="footer_logo">
					<a href="https://cecille.univ-lille.fr/" target="blanck"><img src="http://gis-religions.fr/images/logos/labos/GIS-LOGO-CECILLE.jpg"/></a>
				</div>
				<div class="footer_logo">
					<a href="http://larhra.ish-lyon.cnrs.fr/" target="blanck">
						<img src="https://halshs.archives-ouvertes.fr/LARHRA/public/logo_larhra_fond_blanc.jpg"/>
					</a>
				</div>
			</div>
			<div class="footer_legal">
				Ce site et les transcriptions réalisées dans le cadre du projet RePPOL sont mis à disposition selon les termes de la <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Licence Creative Commons Attribution 4.0 International</a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Licence Creative Commons" style="border-width:0; margin:10px;" src="https://creativecommons.org/images/chooser/chooser_cc.png" height="50%"/><img alt="Licence Creative Commons" style="border-width:0; margin:10px;" src="https://creativecommons.org/images/chooser/chooser_by.png" height="50%"/></a>
				<p>More documentation on <a href="https://github.com/Victorialf/RePPOL" target="blanck">Github</a></p>
			</div>
		</footer>-->
	</xsl:template>

	<xsl:template match="/">
		<!--		PAGE INDEX CHARACTERS-->
		<xsl:result-document href="{$index_characters}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'character index'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
						<article class="index">
							<section class="index_prelist">
								<h2>browse :</h2>
								<ul>
									<xsl:apply-templates select="//tei:persName[not(@key='')]"
										mode="index_prelist">
										<xsl:sort select="@key"/>
										
									</xsl:apply-templates>
									<xsl:apply-templates select="//tei:persName[@key='']" mode="index_prelist"/>
								</ul>
							</section>
							<section class="index" id="top_2">
								<h2>person index :</h2>
								<xsl:apply-templates select="//tei:persName[not(@key='')]" mode="index">
									<xsl:sort select="@key"/>
								</xsl:apply-templates>
								<xsl:apply-templates select="//tei:persName[@key='']" mode="index"/>
							</section>
						</article>
						<!--					<xsl:call-template name="footer"/>-->
					</div>
					<xsl:call-template name="script"/>
				</body>
			</html>
		</xsl:result-document>
		<!--		PAGE INDEX PLACES-->
		<xsl:result-document href="{$index_places}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'place index'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
						<article class="index">
							<section class="index_prelist">
								<h2>browse :</h2>
								<ul class="index">
									<xsl:apply-templates select="//tei:placeName[not(@ref='')]"
										mode="index_prelist">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
									<xsl:apply-templates select="//tei:placeName[@ref='']" mode="index_prelist"/>
								</ul>
							</section>
							<div class="place_section_container" id="top_2">
								<section class="place_index_tab">
									<button class="placetablinks" onclick="openTab(event, 'place_index')">place index :</button>
									<button class="placetablinks" onclick="openTab(event, 'place_map')">map :</button>
								</section>
								<section id="place_index" class="placetabcontent">
<!--									<h2>place index :</h2>-->
									<xsl:apply-templates select="//tei:placeName[not(@ref='')]" mode="index">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
									<xsl:apply-templates select="//tei:placeName[@ref='']" mode="index"/>
								</section>
								<section id="place_map" class="placetabcontent">
<!--									<h2>map :</h2>-->
									<a href="https://gallica.bnf.fr/ark:/12148/btv1b550004040" target="blanck"><img class="index_map" src="https://gallica.bnf.fr/iiif/ark:/12148/btv1b550004040/f1/7041,2304,1306,960/1280,/0/grey.jpg" alt="Kent's map by Symonson Philip, Source : Gallica.bnf.fr / Bibliothèque nationale de France"/></a>
									<p style="text-align:right;">Source : Gallica.bnf.fr / Bibliothèque nationale de France</p>
								</section>
							</div>
						</article>
					</div>
					<xsl:call-template name="script"/>
					<!--					<xsl:call-template name="footer"/>-->
				</body>
			</html>
		</xsl:result-document>
		<!--		PAGE INDEX DATES-->
		<xsl:result-document href="{$index_dates}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'date index'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
						<article class="index">
							<section class="calendar">
								<h2>browse :</h2>
								<xsl:call-template name="calendar"/>
							</section>
							<section class="index" id="top_2">
								<h2>date index :</h2>
								<xsl:apply-templates select="//tei:date[ancestor::tei:body][not(@when='')]"
									mode="index">
									<xsl:sort select="@when"/>
								</xsl:apply-templates>
								<xsl:apply-templates select="//tei:date[ancestor::tei:body][@when='']" mode="index"/>
							</section>
						</article>
					</div>
					<xsl:call-template name="script"/>
					<!--					<xsl:call-template name="footer"/>-->
				</body>
			</html>
		</xsl:result-document>
<!--		FIN page INDEX DATE-->
		<!--PAGE : SELECTEUR TRANSCRIPTION-->
		<xsl:result-document href="{concat($transcriptions, '.html')}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'transcriptions'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
						<article class="fac_selector">
							<xsl:for-each select="//tei:surface">
								<xsl:variable name="facs" select="concat('#', @xml:id)"/>
								<div class="fac_selector">

									<img src="{descendant::tei:graphic/replace(@url,'full/0/default','150,/0/default')}"/>

									<a
										href="{concat($transcriptions, //tei:text[@xml:id='reppol_trans']//tei:pb[@facs=$facs]/@n, '.html')}"
										target="blanck">
										<div class="fac_selector_overlay">
											<h6>p. <xsl:value-of
												select="substring-after(@xml:id, 'fs_')"/></h6>
										</div>
									</a>
								</div>
							</xsl:for-each>
						</article>
					</div>
				</body>
				<xsl:call-template name="script"/>
				<!--				<xsl:call-template name="footer"/>-->
			</html>
		</xsl:result-document>
<!--		PAGES DE TRANSCRIPTIONS INDIVIDUELLES-->
		<xsl:for-each select="//tei:text[@xml:id = 'reppol_trans']//tei:pb">
			<xsl:variable name="facs" select="@facs"/>
			<xsl:variable name="startid">#</xsl:variable>
			<xsl:result-document href="{concat($transcriptions, @n, '.html')}">
				<html>
					<xsl:call-template name="head">
						<xsl:with-param name="title" select="concat('transcription ', @n)"/>
					</xsl:call-template>
					<body style="background-color:#efe9e3;">
						<div class="article_container">
							<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template>
							<article class="transcription">
								<section class="page_nav">
									<a
										href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}">
										<img
											src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
											class="page_nav left"/>
									</a>
									<h2 class="page"><!--ms128, -->p. <xsl:value-of select="@n"/></h2>
									<a
										href="{concat($transcriptions, following::tei:pb[1]/@n, '.html')}">
										<img
											src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
											class="page_nav right"/>
									</a>
								</section>
								<section id="transcription_reppol" class="transcript">
									<div id="facspage">
										<xsl:element name="img">
											<xsl:attribute name="class">facspage</xsl:attribute>
											<xsl:attribute name="src">
												<xsl:value-of
												select="//tei:surface[@xml:id = (replace($facs, '#', ''))]/tei:graphic/@url"
												/>
											</xsl:attribute>
										</xsl:element>
									</div>
									<div id="text">
											<button onclick="reppol_t();" class="t_nav active">Transcription RePPOL</button>
											<button onclick="calendar_t();" class="t_nav">Transcription Calendar</button>
										<xsl:apply-templates
											select="//tei:div[@type = 'page'][descendant::tei:pb[@facs = $facs]]"
											mode="text"/>
									</div>


										<!--<div style="width:100%; clear:both; height:60px;"/>
										<!-\-cheatcode pour démo-\->-->

								</section>
								<section id="calendar" class="transcript">

									<xsl:variable name="facs" select="@facs"/>
									<xsl:variable name="startid">#</xsl:variable>
										<div id="facspage">
											<xsl:element name="img">
												<xsl:attribute name="class">facspage</xsl:attribute>
												<xsl:attribute name="src">
												<xsl:value-of
													select="//tei:surface[@xml:id = (replace($facs, '#', ''))]/tei:graphic/@url"
												/>
												</xsl:attribute>
											</xsl:element>
										</div>
										<div id="text">
												<button onclick="reppol_t();" class="t_nav">Transcription RePPOL</button>
												<button onclick="calendar_t();" class="t_nav active">Transcription Calendar</button>
											
											<xsl:choose>
												<xsl:when test="//tei:div[@type = 'page_calendar']/tei:pb[@facs = $facs]">
												<xsl:apply-templates
												select="//tei:div[@type = 'page_calendar'][child::tei:pb[@facs = $facs]]"
												mode="calendar"/>
												</xsl:when>
												<xsl:otherwise>
												<!--En l'absence de calendar un message s'affiche pour le signaler-->
												<xsl:element name="p">
												<xsl:attribute name="style"
												>text-align:center;</xsl:attribute>
												<xsl:text>No transcription is available in the calendar for this part of the manuscript.</xsl:text>
												</xsl:element>
												</xsl:otherwise>
											</xsl:choose>
										</div>
									<!--<div style="width:100%; clear:both; height:60px;"/>
									<!-\-cheatcode pour démo-\->-->
								</section>
								<section class="page_nav">
									<a
										href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}">
										<img
											src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
											class="page_nav left"/>
									</a>
									<a
										href="{concat($transcriptions, following::tei:pb[1]/@n, '.html')}">
										<img
											src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
											class="page_nav right"/>
									</a>
								</section>
							</article>
						</div>
						<xsl:call-template name="script"/>
						<!--						<xsl:call-template name="footer"/>-->
					</body>
				</html>
			</xsl:result-document>
		</xsl:for-each>


	</xsl:template>
	<!--template pour collection, section, sous-section-->
	<xsl:template match="tei:div[@type]" mode="text">
		<div class="{@type}">
			<xsl:apply-templates mode="text"/>
		</div>
	</xsl:template>
	<xsl:template match="tei:div[@sameAs]" mode="text">
		<xsl:apply-templates mode="text"/>
	</xsl:template>
	<xsl:template match="tei:head" mode="text">
		<p class="{local-name()} {@rend}">
			<!--				ajout d'une classe pour @rend lorsqu'il y a lieu-->
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--template qui se charge de créer des div pour les sous-sections d'une section (uniquement dans le cas des @type=articles-->
	<xsl:template
		match="tei:div[(child::tei:head) and (child::tei:div) and (ancestor::tei:div[@type = ('article') or ('answer_set')])]"
		mode="text">
		<div>
			<xsl:apply-templates mode="text"/>
		</div>
	</xsl:template>
	<!--template pour div contenant des numéros de page-->
	<xsl:template match="tei:div[child::tei:ab]" mode="text">
		<div style="float:right;">
			<xsl:for-each select="descendant::tei:num">
				<p class="{@subtype[//tei:num]}">
					<xsl:apply-templates/>
				</p>
			</xsl:for-each>
		</div>
	</xsl:template>
	<xsl:template match="tei:div" mode="text">
		<xsl:choose>
			<xsl:when
				test="(descendant::tei:note[@rend = 'margin_left']) and (descendant::tei:p[@rend = 'main'])">
				<!--					cas où : NOTES dans la MARGE GAUCHE et P dans MAIN-->
				<div class="display_unit">
					<!--Après création d'une div on créait en fonction du contenu correspondant des enfants div de tailles différentes-->
					<div class="margin_left">
						<xsl:for-each select="tei:note">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main">
						<xsl:for-each select="tei:p">
							<p>
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
				</div>
			</xsl:when>
			<!--				cas où : P dans TOUTE LA LARGEUR-->
			<xsl:when
				test="(descendant::tei:p[@rend = 'whole_width']) and (not(descendant::tei:note[@rend = 'margin_left']))">
				<!--Après création d'une div on créait en fonction du contenu correspondant des enfants div de tailles différentes-->
				<div class="whole_width">
					<xsl:for-each select="tei:p">
						<p>
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
				</div>
			</xsl:when>
			<!--				cas où P dans MAIN, seul-->
			<xsl:when test="descendant::tei:p[@rend = 'main']">
				<div class="display_unit">
					<div class="margin_left"/>
					<div class="main">
						<xsl:for-each select="tei:p">
							<p>
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
				</div>
			</xsl:when>
			<!--				cas où : P dans MAIN_L et MAIN_R-->
			<xsl:when
				test="(descendant::tei:p[@rend = 'main_left']) and (descendant::tei:p[@rend = 'main_right'])">
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main_left">
						<xsl:for-each select="tei:p[@rend = 'main_left']">
							<p>
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main_right">
						<xsl:for-each select="tei:p[@rend = 'main_right']">
							<p>
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
				</div>
			</xsl:when>
			<!--				cas où : NOTE dans MARGIN_L au-dessus d'un P prenant TOUTE LA LARGEUR-->
			<xsl:when
				test="(descendant::tei:note[@rend = 'margin_left']) and (descendant::tei:p[@rend = 'whole_width'])">
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main"/>
				</div>
				<div class="whole_width">
					<xsl:for-each select="tei:p">
						<p>
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:when
				test="(descendant::tei:list[@rend = 'main_left']) and (descendant::tei:list[@rend = 'main_right']) and not(descendant::tei:note[@rend='main_right'])">
				<!--cas où : LIST à GAUCHE ET LIST à DROITE-->
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main">
						<xsl:for-each select="tei:head">
							<p class="head_list">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
						<div class="main_left">
							<xsl:for-each select="tei:list[@rend = 'main_left']">
								<xsl:variable name="meta"
									select="following-sibling::tei:metamark[1]"/>
								<xsl:variable name="meta_p"
									select="following-sibling::tei:p[1]/tei:metamark[1]"/>
								<xsl:variable name="meta_n"
									select="following-sibling::tei:note[1]/tei:metamark[1]"/>
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<xsl:choose>
									<xsl:when test="$meta = '}'">
										<ul class="bracket">
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:when>
									<xsl:when test="$meta_p = '}'">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<!--											<xsl:for-each select="descendant::tei:metamark[.='}']">
												
											</xsl:for-each>-->
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:when test="($meta_n = '}') and ($meta_p != $meta_n)">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<ul>
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<!--						<xsl:for-each select="tei:note[@rend='main_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>-->
						</div>
						<div class="main_right">
							<xsl:for-each select="tei:list[@rend = 'main_right']">
								<xsl:variable name="meta"
									select="following-sibling::tei:metamark[1]"/>
								<xsl:variable name="meta_p"
									select="following-sibling::tei:p[1]/tei:metamark[1]"/>
								<xsl:variable name="meta_n"
									select="following-sibling::tei:note[1]/tei:metamark[1]"/>
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<xsl:choose>
									<xsl:when test="$meta = '}'">
										<ul class="bracket">
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:when>
									<xsl:when test="$meta_p = '}'">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<!--											<xsl:for-each select="descendant::tei:metamark[.='}']">
												
											</xsl:for-each>-->
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:when test="($meta_n = '}') and ($meta_p != $meta_n)">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<ul>
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<!--						<xsl:for-each select="tei:note[@rend='main_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>-->
						</div>
						<!--
<!-\-						ANCIEN TEMPLATE NE PRENANT PAS EN COMPTE LES METAMARKE BRACKET-\->
						<div class="main_left">
						<xsl:for-each select="tei:list[@rend='main_left']">
							<xsl:for-each select="tei:head">
								<p class="head_list"><xsl:apply-templates/></p>
							</xsl:for-each>
							<ul>
								<xsl:for-each select="tei:item">
									<li>
									<xsl:apply-templates/>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:for-each>
						<!-\-
						<xsl:for-each select="tei:note[@rend='main_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>-\->
					</div>
					<div class="main_right">
						<xsl:for-each select="tei:list[@rend='main_right']">
							<xsl:for-each select="tei:head">
								<p class="head_list"><xsl:apply-templates/></p>
							</xsl:for-each>
							<ul>
								<xsl:for-each select="tei:item">
									<li>
										<xsl:apply-templates/>
									</li>
								</xsl:for-each>
							</ul>
						</xsl:for-each>
					</div>-->
					</div>
				</div>
			</xsl:when>
			<xsl:when
				test="(descendant::tei:list[@rend = 'main_left']) and (descendant::tei:p[@rend = 'main_right'])">
				<!--					cas où : LIST à GAUCHE et P à DROITE-->
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main">
						<div class="main_left">
							<xsl:for-each select="tei:list[@rend = 'main_left']">
								<xsl:variable name="meta"
									select="following-sibling::tei:metamark[1]"/>
								<xsl:variable name="meta_p"
									select="following-sibling::tei:p[1]/tei:metamark[1]"/>
								<xsl:variable name="meta_n"
									select="following-sibling::tei:note[1]/tei:metamark[1]"/>
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<xsl:choose>
									<xsl:when test="$meta = '}'">
										<ul class="bracket">
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:when>
									<xsl:when test="$meta_p = '}'">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<!--											<xsl:for-each select="descendant::tei:metamark[.='}']">
												
											</xsl:for-each>-->
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:when test="($meta_n = '}') and ($meta_p != $meta_n)">
										<div class="metafloat_list">
											<ul class="bracket">
												<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
												</xsl:for-each>
											</ul>
											<xsl:for-each select="following-sibling::tei:note">
												<p class="metafloat note">
												<xsl:apply-templates/>
												</p>
											</xsl:for-each>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<ul>
											<xsl:for-each select="tei:item">
												<li>
												<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:for-each>
							<!--						<xsl:for-each select="tei:note[@rend='main_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>-->
						</div>
						<div class="main_right" style="vertical-align:middle;">
							<xsl:for-each select="tei:p">
								<p>
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when
				test="(descendant::tei:list[@rend = 'main_left']) or (descendant::tei:list[@rend = 'main_right']) and not(descendant::tei:note[@rend='main_right'])">
				<!--					cas où : LIST MAIN_L OU LIST MAIN_R-->
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main">
						<div class="main_left">
							<xsl:for-each select="tei:list[@rend = 'main_left']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<xsl:for-each select="tei:note[@rend = 'main_left']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
						<div class="main_right">
							<xsl:for-each select="tei:list[@rend = 'main_right']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<xsl:for-each select="tei:note[@rend = 'main_right']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when
				test="(descendant::tei:head) and (descendant::tei:list[@rend = 'main_left']) and (descendant::tei:list[@rend = 'main_right'])">
				<!--					cas où : HEAD de deux LIST dans MAIN_L et MAIN_R-->
				<div class="display_unit">
					<!--CHECK ME 03/06-->
					<xsl:for-each select="tei:head">
						<p class="head_list">
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
					<div class="margin_left">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main">
						<div class="main_left">
							<xsl:for-each select="tei:list[@rend = 'main_left']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<xsl:for-each select="tei:note[@rend = 'main_left']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
						<div class="main_right">
							<xsl:for-each select="tei:list[@rend = 'main_right']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<xsl:for-each select="tei:note[@rend = 'main_right']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="(descendant::tei:list[@rend='margin_left'])and(descendant::tei:note[@rend='main'])">
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:list[@rend = 'margin_left']">
							<xsl:variable name="meta"
								select="following-sibling::tei:metamark[1]"/>
							<xsl:variable name="meta_p"
								select="following-sibling::tei:p[1]/tei:metamark[1]"/>
							<xsl:variable name="meta_n"
								select="following-sibling::tei:note[1]/tei:metamark[1]"/>
							<xsl:for-each select="tei:head">
								<p class="head_list">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
							<xsl:choose>
								<xsl:when test="$meta = '}'">
									<ul class="bracket">
										<xsl:for-each select="tei:item">
											<li>
												<xsl:apply-templates/>
											</li>
										</xsl:for-each>
									</ul>
								</xsl:when>
								<xsl:when test="$meta_p = '}'">
									<div class="metafloat_list">
										<ul class="bracket">
											<xsl:for-each select="tei:item">
												<li>
													<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
										<xsl:for-each select="following-sibling::tei:note">
											<p class="metafloat note">
												<!--											<xsl:for-each select="descendant::tei:metamark[.='}']">
												
											</xsl:for-each>-->
												<xsl:apply-templates/>
											</p>
										</xsl:for-each>
									</div>
								</xsl:when>
								<xsl:when test="($meta_n = '}') and ($meta_p != $meta_n)">
									<div class="metafloat_list">
										<ul class="bracket">
											<xsl:for-each select="tei:item">
												<li>
													<xsl:apply-templates/>
												</li>
											</xsl:for-each>
										</ul>
										<xsl:for-each select="following-sibling::tei:note">
											<p class="metafloat note">
												<xsl:apply-templates/>
											</p>
										</xsl:for-each>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<ul>
										<xsl:for-each select="tei:item">
											<li>
												<xsl:apply-templates/>
											</li>
										</xsl:for-each>
									</ul>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</div>
					<div class="main">
						<xsl:for-each select="note[@rend='main']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
				</div>
			</xsl:when>
			<xsl:when
				test="descendant::tei:note[@rend = 'margin_left'] and (not(descendant::tei:hi[@rend = 'vertical_bottom-top']))">
				<!--					cas où il n'y a qu'une NOTE SEULE-->
				<div class="display_unit">
					<div class="margin_left">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main"/>
				</div>
			</xsl:when>
			<xsl:when
				test="descendant::tei:note[@rend = 'margin_left'] and (descendant::tei:hi[@rend = 'vertical_bottom-top'])">
				<!--					cas où il n'y a qu'une NOTE SEULE avec un HI marquant le changement d'ORIENTATION DU TEXTE -->
				<div class="margin_left vertical">
					<xsl:for-each select="tei:note[@rend = 'margin_left']">
						<p class="note">
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:when test="descendant::tei:note[@rend='main']">
				<!--cas où NOTE SEULE dans le CORPS PRINCIPAL-->
				<div class="display_unit">
					<div class="margin_left"/>
					<div class="main">
						<xsl:for-each select="tei:note[@rend = 'main']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
				</div>
			</xsl:when>
			<!-- cas où il n'y a qu'un PARAGRAPHE sur la DROITE, SEUL -->
			<xsl:when test="descendant::tei:p[@rend='main_right']">
				<div class="display_unit">
					<div class="main">
						<div class="main_left"/>
						<div class="main_right">
							<xsl:for-each select="tei:p[@rend='main_right']">
								<p><xsl:apply-templates/></p>
							</xsl:for-each>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="descendant::tei:note[@rend='margin_left'] and (descendant::tei:list[@rend='main_left']) and (descendant::tei:note[@rend='main_right']) and (descendant::tei:list[@rend='main_right'])">
				<!--cas où NOTES dans MARGIN_L et MAIN_R et LIST dans MAIN_L et _R
				ne s'applique en fait qu'à l'index (en théorie)-->
				<div class="display_unit">
					<!--la différence : ajout d'une class css permettant de resserer un peu la page en réduisant la taille des <div>-->
					<div class="margin_left smaller">
						<xsl:for-each select="tei:note[@rend = 'margin_left']">
							<p class="note">
								<xsl:apply-templates/>
							</p>
						</xsl:for-each>
					</div>
					<div class="main smaller">
						<div class="main_left smaller">
							<xsl:for-each select="tei:list[@rend = 'main_left']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							<!--<xsl:for-each select="tei:note[@rend = 'main_left']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>-->
						</div>
						<div class="main_right_note">
							<xsl:for-each select="tei:note[@rend = 'main_right']">
								<p class="note">
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>
						</div>
						<div class="main_right smaller">
							<xsl:for-each select="tei:list[@rend = 'main_right']">
								<xsl:for-each select="tei:head">
									<p class="head_list">
										<xsl:apply-templates/>
									</p>
								</xsl:for-each>
								<ul>
									<xsl:for-each select="tei:item">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							</xsl:for-each>
							
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<p>If you're reading this automatically generated text, it means this part of the transcription is still a work in progress. Please, come back later.</p>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--	template pour CRÉATION ÉLÉMENT avec class = nom élément
				+ ajout en commentaire d'un <a> avec href = @ref (avant de décommenter nécessite des ajustements
						retirer expan et roleName
						modifier manière de créer href pour différents cas de figure ?-->
	<xsl:template match="tei:num | tei:persName | tei:roleName | tei:placeName | tei:expan">
		<span class="{local-name()}">
			<!--			<a href="{@ref}" target="blanck">-->
			<xsl:apply-templates/>
			<!--</a>-->
		</span>
	</xsl:template>
	<!--	template CRÉATION ÉLÉMENT avec class = @rend/place-->
	<xsl:template match="tei:del | tei:add | tei:hi">
		<span class="{@rend} {@place}">
			<xsl:apply-templates/>
		</span>
	</xsl:template>
	<!--	<xsl:template match="tei:list[ancestor::tei:note]">
		<xsl:variable name="meta" select="following-sibling::tei:metamark"/>
		<xsl:element name="ul">
			<xsl:if test="$meta='}'">
				<xsl:attribute name="class">bracket</xsl:attribute>
			</xsl:if>
			<xsl:for-each select="tei:item">
				<li><xsl:apply-templates/></li>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>-->
	<!--	template CRÉATION DE LIST DANS NOTE avec BRACKET SI BESOIN-->
	<xsl:template match="tei:list[ancestor::tei:note]">
		<xsl:variable name="meta" select="following-sibling::tei:metamark"/>
		<xsl:choose>
			<xsl:when test="$meta = '}'">
				<div class="metafloat_list">
					<xsl:element name="ul">
						<xsl:attribute name="class">bracket</xsl:attribute>
						<xsl:for-each select="tei:item">
							<li>
								<xsl:apply-templates/>
							</li>
						</xsl:for-each>
					</xsl:element>
					<xsl:for-each select="following-sibling::tei:p">
						<p class="metafloat">
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
					<xsl:for-each select="following-sibling::tei:note">
						<p class="metafloat note">
							<xsl:apply-templates/>
						</p>
					</xsl:for-each>
					<xsl:for-each select="following-sibling::tei:metamark[not(. = '}')]">
						<p class="metafloat">
							<span class="metamark">
								<xsl:apply-templates/>
							</span>
						</p>
					</xsl:for-each>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:element name="ul">
					<xsl:for-each select="tei:item">
						<li>
							<xsl:apply-templates/>
						</li>
					</xsl:for-each>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--	template gérant CRÉATION DES METAMARKS et SUPPRESSION DES BRACKETS si besoin-->
	<xsl:template match="tei:metamark">
		<xsl:variable name="meta" select="."/>
		<xsl:choose>
			<xsl:when test="($meta = '}') and (preceding-sibling::tei:list)">
				<xsl:if test="following-sibling::tei:metamark"> </xsl:if>
			</xsl:when>
			<xsl:when
				test="(preceding-sibling::tei:metamark[. = '}']) and (preceding-sibling::tei:list)"/>
			<xsl:when test="($meta = '}') and (ancestor::tei:note[preceding-sibling::tei:list])"/>
			<xsl:when test="($meta = '}') and (ancestor::tei:p[preceding-sibling::tei:list])"/>
			<xsl:otherwise>
				<!--<span class="{local-name()}">
					<xsl:apply-templates/>
				</span>-->
				<xsl:element name="span">
					<xsl:attribute name="class">
						<xsl:value-of select="local-name()"/>
					</xsl:attribute>
					<xsl:if test="$meta = 'n'">
						<!--ajout d'un style particulier pour les metamark = n-->
						<xsl:attribute name="style">font-size:18pt; color:#999;</xsl:attribute><!-- color:#1c481f; -->
					</xsl:if>
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--	<xsl:template match="tei:metamark[.='}']"/><!-\-supprime les metamarks qui contiennent }-\->-->

	<!--	LES TEMPLATES POUR LE calendar-->
	<xsl:template match="tei:div[@type = 'page_calendar']">
		<div type="@type">
			<xsl:apply-templates
				select="tei:div[ancestor::tei:div[@type = 'page_calendar']] | tei:p[ancestor::tei:div[@type = 'page_calendar']] | tei:head[ancestor::tei:div[@type = 'page_calendar']]"
				mode="calendar"/>
		</div>
	</xsl:template>
	<xsl:template match="tei:div[ancestor::tei:div[@type = 'page_calendar']]" mode="calendar">
		<xsl:element name="{local-name()}">
			<xsl:apply-templates mode="calendar"/>
		</xsl:element>
	</xsl:template>
	<xsl:template
		match="tei:p[ancestor::tei:div[@type = 'page_calendar']] | tei:head[ancestor::tei:div[@type = 'page_calendar']]"
		mode="calendar">
		<xsl:element name="p">
			<xsl:attribute name="class">
				<xsl:value-of select="local-name()"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	<!--		POUR LES INDEX, MODE : index -->
	<xsl:template match="tei:persName" mode="index_prelist">
		<xsl:variable name="key" select="@key"/>
		<xsl:if test="not(preceding::tei:persName[@key = $key])">
			<li>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('#', generate-id())"/>
					</xsl:attribute>
					<xsl:call-template name="CamelCase">
						<xsl:with-param name="key_change">
							<xsl:value-of select="@key"/>
						</xsl:with-param>
					</xsl:call-template>
					<xsl:if test="@key=''">Unidentified persons</xsl:if>
				</xsl:element>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:persName" mode="index">
		<xsl:variable name="ref" select="@ref"/>
		<xsl:variable name="key" select="@key"/>
		<xsl:if test="not(preceding::tei:persName[@key = $key])">
			<div id="{generate-id()}" class="index_unit">
				<h3>
					<xsl:call-template name="CamelCase">
						<!--cf : https://askcodez.com/convertir-le-premier-caractere-de-chaque-mot-en-majuscule.html-->
						<xsl:with-param name="key_change">
							<xsl:value-of select="@key"/>
						</xsl:with-param>
					</xsl:call-template>
					<xsl:if test="@key=''">Unidentified persons</xsl:if>
				</h3>
				<p>Functions : 
					<xsl:if test="@type='religious'"><xsl:value-of select="@type"/></xsl:if>
					<xsl:if test="@type='lay_man'">lay man</xsl:if>
					<xsl:if test="@type='lay_woman'">lay woman</xsl:if>
				
					<!--<xsl:call-template name="role_persname">
						<xsl:with-param name="key"/>
					</xsl:call-template>-->
					<xsl:for-each select="//tei:roleName[ancestor::tei:persName[@key=$key]]">
						<xsl:variable name="type" select="@type"/>
						<xsl:choose>
							<xsl:when test="preceding::tei:persName[@key=$key]/tei:roleName/@type=$type">
								<!--<xsl:text>| $type = </xsl:text><xsl:value-of select="$type"/> <xsl:text>| @type = </xsl:text><xsl:value-of select="@type"/>-->
							</xsl:when>
							<xsl:otherwise>, <xsl:value-of select="@type"/></xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>.
				</p>
				<p>Mentioned :</p>
				<ul>
					<xsl:apply-templates select=". | following::tei:persName[@key = $key]"
						mode="sub_index"/>
				</ul>
				<p style="display:inline-block;">Link : 
					<xsl:choose>
						<xsl:when test="@ref=''"><!--Lorsque @ref est vide on écrit "-"-->
							<xsl:text>-</xsl:text>
						</xsl:when>
						<xsl:when test="not(@ref)">
							<xsl:text>-</xsl:text>
						</xsl:when>
						<xsl:otherwise><!--on appelle le template gérant la création des links-->
							<xsl:call-template name="persname_link">
								<xsl:with-param name="ref" select="@ref"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</p>
				<!--dans l'idéal tester la nature du @ref, le début du @ref pour cced la suite pour DNB-->
				<!--				<a href=""></a>-->
				<a href="#top_2">
					<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
						class="top"
						style="position:absolute; bottom:0; right:0; padding:5px; width:30px;"
					/>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:persName" mode="sub_index">
		<li><xsl:text>"</xsl:text><xsl:apply-templates/><xsl:text>"</xsl:text>: p.<a
				href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}"><xsl:value-of
					select="preceding::tei:pb[1]/@n"/></a></li>
	</xsl:template>

	

	
	<xsl:template match="tei:placeName" mode="index_prelist">
<!--		<xsl:variable name="key" select="@key"/>-->
		<xsl:variable name="ref" select="@ref"/>
		<xsl:if test="not(preceding::tei:placeName[@ref = $ref])">
			<li>
				<xsl:element name="a">
					<xsl:attribute name="href">
						<xsl:value-of select="concat('#', generate-id())"/>
					</xsl:attribute>
					<xsl:choose>
						<xsl:when test="@ref=''">Other</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CamelCase_space">
								<xsl:with-param name="name_change" select="."/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:element>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:placeName" mode="index">
		<xsl:variable name="ref_base" select="'https://www.openstreetmap.org/search?query='"/>
		<xsl:variable name="ref" select="@ref"/>
<!--		<xsl:variable name="key" select="@key"/>-->
		<xsl:variable name="base_uri" select="'https://theclergydatabase.org.uk/jsp/locations/DisplayLocation.jsp?locKey='"/>
		<xsl:if test="not(preceding::tei:placeName[@ref = $ref])">
			<div id="{generate-id()}" class="index_unit">
				<h3>
					<xsl:choose>
						<xsl:when test="@ref=''">Other</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="CamelCase_space">
								<xsl:with-param name="name_change" select="."/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
				</h3>
				<p>Type : <xsl:value-of select="@type"/></p>
				<p>Mentioned :</p>
				<ul>
					<xsl:apply-templates select=". | following::tei:placeName[@ref = $ref]" mode="sub_index"/>
				</ul>
				<p style="display:inline-block;">Link : <xsl:choose>
					<xsl:when test="@ref = ('x')or()">
						<xsl:text>-</xsl:text>
					</xsl:when>
					<xsl:otherwise>
						<ul class="links_inline">
							<li><a href="{concat($base_uri, @ref)}">CCED</a></li>
						
						<xsl:choose><!--generate open-street links-->
							<xsl:when test="@ref='6'"><li><a href="{concat($ref_base, '51.09563666023264, 0.9443751452224245')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='16'"><li><a href="{concat($ref_base, '51.14576352159874, 0.8740108702332904')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='27'"><li><a href="{concat($ref_base, '51.12951242200254, 0.7540032430536673')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='43'"><li><a href="{concat($ref_base, '51.19975420080327, 0.9056226109356197')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='44'"><li><a href="{concat($ref_base, '51.21257428841646, 0.6897059854433114')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='45'"><li><a href="{concat($ref_base, '51.23442640656221, 0.5323448277713716')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='46'"><li><a href="{concat($ref_base, '51.29513818915764, 0.9572080376614853')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='57'"><li><a href="{concat($ref_base, '51.13212895787294, 1.302947579018137')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='66'"><li><a href="{concat($ref_base, '51.277648633703876, 1.0828494602763346')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='73'"><li><a href="{concat($ref_base, '51.276275986548235, 1.07757578974423')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='76'"><li><a href="{concat($ref_base, '51.27810202522983, 1.0855233549998646')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='85'"><li><a href="{concat($ref_base, '51.38426722257884, 0.5228846292421128')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='93'"><li><a href="{concat($ref_base, '51.244905091064496, 0.9627086167814554')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='148'"><li><a href="{concat($ref_base, '51.3177,0.8928')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='242'"><li><a href="{concat($ref_base, '50.95117535978458, 0.9065697644456505')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='260'"><li><a href="{concat($ref_base, '51.44254433958588, 0.3833232467670284')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='265'"><li><a href="{concat($ref_base, '51.21450426826586, 1.3592873680943796')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='275'"><li><a href="{concat($ref_base, '51.09713728823203, 1.1169920368954644')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='276'"><li><a href="{concat($ref_base, '51.35412251588519, 0.6670796932072199')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='291'"><li><a href="{concat($ref_base, '51.30844209417786, 0.8698966668067528')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='303'"><li><a href="{concat($ref_base, '51.17755453243505, 0.7561188280618952')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='310'"><li><a href="{concat($ref_base, '51.3642637207888, 0.6109353741360732')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='316'"><li><a href="{concat($ref_base, '51.196316274741974, 1.3611056342813097')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='338'"><li><a href="{concat($ref_base, '51.27381571344677, 1.3423353026039284')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='339'"><li><a href="{concat($ref_base, '51.27738721984441, 1.3388088425220264')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='340'"><li><a href="{concat($ref_base, '51.27505327417798, 1.339810656014829')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='349'"><li><a href="{concat($ref_base, '51.27434058957334, 0.8809924458287133')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='361'"><li><a href="{concat($ref_base, '51.24289954742153, 0.8096375733057797')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='366'"><li><a href="{concat($ref_base, '51.30033387972874, 1.1813821021641806')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='385'"><li><a href="{concat($ref_base, '51.0703845886681, 0.6850335175063367')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='408'"><li><a href="{concat($ref_base, '51.30926777086775, 1.1410263130109777')}">Open street map</a></li></xsl:when>
							<xsl:when test="@ref='429'"><li><a href="{concat($ref_base, '51.27329987024547, 0.7544625439546462')}">Open street map</a></li></xsl:when>
						</xsl:choose>
						</ul>
					</xsl:otherwise>
				</xsl:choose>
				</p>
				<a href="#top_2">
					<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
						class="top"
						style="position:absolute; bottom:0; right:0; padding:5px; width:30px;"/>
				</a>
			</div>
		</xsl:if>
		
		
		<!--<xsl:choose>
			<xsl:when test="@ref = 'x'">
				<xsl:element name="li">
					<xsl:apply-templates/>
				</xsl:element>
			</xsl:when>
			<xsl:when test="not(preceding::tei:placeName[@ref = $ref])">
				<xsl:element name="li">
					<a href="{concat($ref_base,$ref)}" target="blanck">
						<xsl:call-template name="CamelCase_space">
							<xsl:with-param name="name_change" select="."/>
						</xsl:call-template>
					</a>
				</xsl:element>
			</xsl:when>
		</xsl:choose>-->
	</xsl:template>
	<xsl:template match="tei:placeName" mode="sub_index">
		<li><xsl:text>"</xsl:text><xsl:apply-templates/><xsl:text>"</xsl:text>: p.<a
			href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}"><xsl:value-of
				select="preceding::tei:pb[1]/@n"/></a></li>
	</xsl:template>
	


	<xsl:template name="calendar">
		<div class="c_tabs">
<!--			le passage via regex d'un tableau où chaque case = un lien vers un date qui possiblement n'a pas d'existence dans le texte à un tableau où les liens ne sont créés que si date existe dans texte est documenté dans le git (webstite/calendar/cleaning_and_anchoring.pl)-->
			<div class="tabs_nav">
				<button class="c_tabs_b active_tab" onclick="tabsAnimation(event, 'c_1540')"
					>1540</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, 'c_1541')">1541</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, 'c_1542')">1542</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, 'c_1543')">1543</button>
			</div>
			<div id="c_1540" class="tabs_content active_tabs_content">
<!--				<h3>1540</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01'">
<a href="#1540-01" class="date_valid">January</a></xsl:when>					<xsl:otherwise>January</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-01'">
<a href="#1540-01-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-02'">
<a href="#1540-01-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-03'">
<a href="#1540-01-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-04'">
<a href="#1540-01-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-05'">
<a href="#1540-01-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-06'">
<a href="#1540-01-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-07'">
<a href="#1540-01-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-08'">
<a href="#1540-01-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-09'">
<a href="#1540-01-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-10'">
<a href="#1540-01-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-11'">
<a href="#1540-01-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-12'">
<a href="#1540-01-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-13'">
<a href="#1540-01-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-14'">
<a href="#1540-01-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-15'">
<a href="#1540-01-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-16'">
<a href="#1540-01-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-17'">
<a href="#1540-01-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-18'">
<a href="#1540-01-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-19'">
<a href="#1540-01-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-20'">
<a href="#1540-01-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-21'">
<a href="#1540-01-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-22'">
<a href="#1540-01-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-23'">
<a href="#1540-01-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-24'">
<a href="#1540-01-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-25'">
<a href="#1540-01-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-26'">
<a href="#1540-01-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-27'">
<a href="#1540-01-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-28'">
<a href="#1540-01-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-29'">
<a href="#1540-01-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-30'">
<a href="#1540-01-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-01-31'">
<a href="#1540-01-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02'">
<a href="#1540-02" class="date_valid">February</a></xsl:when>					<xsl:otherwise>February</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-01'">
<a href="#1540-02-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-02'">
<a href="#1540-02-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-03'">
<a href="#1540-02-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-04'">
<a href="#1540-02-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-05'">
<a href="#1540-02-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-06'">
<a href="#1540-02-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-07'">
<a href="#1540-02-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-08'">
<a href="#1540-02-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-09'">
<a href="#1540-02-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-10'">
<a href="#1540-02-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-11'">
<a href="#1540-02-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-12'">
<a href="#1540-02-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-13'">
<a href="#1540-02-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-14'">
<a href="#1540-02-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-15'">
<a href="#1540-02-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-16'">
<a href="#1540-02-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-17'">
<a href="#1540-02-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-18'">
<a href="#1540-02-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-19'">
<a href="#1540-02-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-20'">
<a href="#1540-02-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-21'">
<a href="#1540-02-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-22'">
<a href="#1540-02-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-23'">
<a href="#1540-02-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-24'">
<a href="#1540-02-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-25'">
<a href="#1540-02-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-26'">
<a href="#1540-02-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-27'">
<a href="#1540-02-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-28'">
<a href="#1540-02-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-02-29'">
<a href="#1540-02-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03'">
<a href="#1540-03" class="date_valid">March</a></xsl:when>					<xsl:otherwise>March</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-01'">
<a href="#1540-03-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-02'">
<a href="#1540-03-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-03'">
<a href="#1540-03-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-04'">
<a href="#1540-03-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-05'">
<a href="#1540-03-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-06'">
<a href="#1540-03-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-07'">
<a href="#1540-03-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-08'">
<a href="#1540-03-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-09'">
<a href="#1540-03-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-10'">
<a href="#1540-03-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-11'">
<a href="#1540-03-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-12'">
<a href="#1540-03-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-13'">
<a href="#1540-03-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-14'">
<a href="#1540-03-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-15'">
<a href="#1540-03-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-16'">
<a href="#1540-03-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-17'">
<a href="#1540-03-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-18'">
<a href="#1540-03-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-19'">
<a href="#1540-03-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-20'">
<a href="#1540-03-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-21'">
<a href="#1540-03-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-22'">
<a href="#1540-03-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-23'">
<a href="#1540-03-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-24'">
<a href="#1540-03-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-25'">
<a href="#1540-03-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-26'">
<a href="#1540-03-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-27'">
<a href="#1540-03-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-28'">
<a href="#1540-03-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-29'">
<a href="#1540-03-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-30'">
<a href="#1540-03-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-03-31'">
<a href="#1540-03-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04'">
<a href="#1540-04" class="date_valid">April</a></xsl:when>					<xsl:otherwise>April</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-01'">
<a href="#1540-04-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-02'">
<a href="#1540-04-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-03'">
<a href="#1540-04-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-04'">
<a href="#1540-04-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-05'">
<a href="#1540-04-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-06'">
<a href="#1540-04-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-07'">
<a href="#1540-04-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-08'">
<a href="#1540-04-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-09'">
<a href="#1540-04-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-10'">
<a href="#1540-04-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-11'">
<a href="#1540-04-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-12'">
<a href="#1540-04-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-13'">
<a href="#1540-04-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-14'">
<a href="#1540-04-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-15'">
<a href="#1540-04-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-16'">
<a href="#1540-04-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-17'">
<a href="#1540-04-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-18'">
<a href="#1540-04-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-19'">
<a href="#1540-04-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-20'">
<a href="#1540-04-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-21'">
<a href="#1540-04-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-22'">
<a href="#1540-04-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-23'">
<a href="#1540-04-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-24'">
<a href="#1540-04-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-25'">
<a href="#1540-04-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-26'">
<a href="#1540-04-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-27'">
<a href="#1540-04-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-28'">
<a href="#1540-04-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-29'">
<a href="#1540-04-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-04-30'">
<a href="#1540-04-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05'">
<a href="#1540-05" class="date_valid">May</a></xsl:when>					<xsl:otherwise>May</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-01'">
<a href="#1540-05-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-02'">
<a href="#1540-05-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-03'">
<a href="#1540-05-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-04'">
<a href="#1540-05-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-05'">
<a href="#1540-05-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-06'">
<a href="#1540-05-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-07'">
<a href="#1540-05-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-08'">
<a href="#1540-05-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-09'">
<a href="#1540-05-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-10'">
<a href="#1540-05-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-11'">
<a href="#1540-05-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-12'">
<a href="#1540-05-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-13'">
<a href="#1540-05-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-14'">
<a href="#1540-05-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-15'">
<a href="#1540-05-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-16'">
<a href="#1540-05-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-17'">
<a href="#1540-05-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-18'">
<a href="#1540-05-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-19'">
<a href="#1540-05-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-20'">
<a href="#1540-05-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-21'">
<a href="#1540-05-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-22'">
<a href="#1540-05-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-23'">
<a href="#1540-05-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-24'">
<a href="#1540-05-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-25'">
<a href="#1540-05-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-26'">
<a href="#1540-05-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-27'">
<a href="#1540-05-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-28'">
<a href="#1540-05-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-29'">
<a href="#1540-05-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-30'">
<a href="#1540-05-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-05-31'">
<a href="#1540-05-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06'">
<a href="#1540-06" class="date_valid">June</a></xsl:when>					<xsl:otherwise>June</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-01'">
<a href="#1540-06-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-02'">
<a href="#1540-06-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-03'">
<a href="#1540-06-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-04'">
<a href="#1540-06-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-05'">
<a href="#1540-06-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-06'">
<a href="#1540-06-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-07'">
<a href="#1540-06-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-08'">
<a href="#1540-06-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-09'">
<a href="#1540-06-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-10'">
<a href="#1540-06-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-11'">
<a href="#1540-06-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-12'">
<a href="#1540-06-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-13'">
<a href="#1540-06-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-14'">
<a href="#1540-06-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-15'">
<a href="#1540-06-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-16'">
<a href="#1540-06-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-17'">
<a href="#1540-06-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-18'">
<a href="#1540-06-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-19'">
<a href="#1540-06-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-20'">
<a href="#1540-06-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-21'">
<a href="#1540-06-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-22'">
<a href="#1540-06-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-23'">
<a href="#1540-06-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-24'">
<a href="#1540-06-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-25'">
<a href="#1540-06-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-26'">
<a href="#1540-06-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-27'">
<a href="#1540-06-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-28'">
<a href="#1540-06-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-29'">
<a href="#1540-06-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-06-30'">
<a href="#1540-06-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07'">
<a href="#1540-07" class="date_valid">July</a></xsl:when>					<xsl:otherwise>July</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-01'">
<a href="#1540-07-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-02'">
<a href="#1540-07-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-03'">
<a href="#1540-07-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-04'">
<a href="#1540-07-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-05'">
<a href="#1540-07-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-06'">
<a href="#1540-07-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-07'">
<a href="#1540-07-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-08'">
<a href="#1540-07-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-09'">
<a href="#1540-07-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-10'">
<a href="#1540-07-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-11'">
<a href="#1540-07-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-12'">
<a href="#1540-07-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-13'">
<a href="#1540-07-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-14'">
<a href="#1540-07-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-15'">
<a href="#1540-07-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-16'">
<a href="#1540-07-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-17'">
<a href="#1540-07-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-18'">
<a href="#1540-07-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-19'">
<a href="#1540-07-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-20'">
<a href="#1540-07-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-21'">
<a href="#1540-07-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-22'">
<a href="#1540-07-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-23'">
<a href="#1540-07-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-24'">
<a href="#1540-07-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-25'">
<a href="#1540-07-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-26'">
<a href="#1540-07-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-27'">
<a href="#1540-07-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-28'">
<a href="#1540-07-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-29'">
<a href="#1540-07-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-30'">
<a href="#1540-07-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-07-31'">
<a href="#1540-07-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08'">
<a href="#1540-08" class="date_valid">August</a></xsl:when>					<xsl:otherwise>August</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-01'">
<a href="#1540-08-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-02'">
<a href="#1540-08-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-03'">
<a href="#1540-08-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-04'">
<a href="#1540-08-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-05'">
<a href="#1540-08-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-06'">
<a href="#1540-08-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-07'">
<a href="#1540-08-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-08'">
<a href="#1540-08-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-09'">
<a href="#1540-08-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-10'">
<a href="#1540-08-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-11'">
<a href="#1540-08-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-12'">
<a href="#1540-08-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-13'">
<a href="#1540-08-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-14'">
<a href="#1540-08-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-15'">
<a href="#1540-08-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-16'">
<a href="#1540-08-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-17'">
<a href="#1540-08-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-18'">
<a href="#1540-08-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-19'">
<a href="#1540-08-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-20'">
<a href="#1540-08-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-21'">
<a href="#1540-08-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-22'">
<a href="#1540-08-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-23'">
<a href="#1540-08-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-24'">
<a href="#1540-08-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-25'">
<a href="#1540-08-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-26'">
<a href="#1540-08-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-27'">
<a href="#1540-08-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-28'">
<a href="#1540-08-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-29'">
<a href="#1540-08-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-30'">
<a href="#1540-08-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-08-31'">
<a href="#1540-08-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09'">
<a href="#1540-09" class="date_valid">September</a></xsl:when>					<xsl:otherwise>September</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-01'">
<a href="#1540-09-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-02'">
<a href="#1540-09-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-03'">
<a href="#1540-09-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-04'">
<a href="#1540-09-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-05'">
<a href="#1540-09-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-06'">
<a href="#1540-09-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-07'">
<a href="#1540-09-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-08'">
<a href="#1540-09-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-09'">
<a href="#1540-09-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-10'">
<a href="#1540-09-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-11'">
<a href="#1540-09-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-12'">
<a href="#1540-09-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-13'">
<a href="#1540-09-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-14'">
<a href="#1540-09-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-15'">
<a href="#1540-09-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-16'">
<a href="#1540-09-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-17'">
<a href="#1540-09-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-18'">
<a href="#1540-09-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-19'">
<a href="#1540-09-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-20'">
<a href="#1540-09-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-21'">
<a href="#1540-09-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-22'">
<a href="#1540-09-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-23'">
<a href="#1540-09-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-24'">
<a href="#1540-09-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-25'">
<a href="#1540-09-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-26'">
<a href="#1540-09-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-27'">
<a href="#1540-09-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-28'">
<a href="#1540-09-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-29'">
<a href="#1540-09-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-09-30'">
<a href="#1540-09-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10'">
<a href="#1540-10" class="date_valid">October</a></xsl:when>					<xsl:otherwise>October</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-01'">
<a href="#1540-10-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-02'">
<a href="#1540-10-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-03'">
<a href="#1540-10-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-04'">
<a href="#1540-10-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-05'">
<a href="#1540-10-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-06'">
<a href="#1540-10-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-07'">
<a href="#1540-10-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-08'">
<a href="#1540-10-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-09'">
<a href="#1540-10-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-10'">
<a href="#1540-10-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-11'">
<a href="#1540-10-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-12'">
<a href="#1540-10-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-13'">
<a href="#1540-10-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-14'">
<a href="#1540-10-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-15'">
<a href="#1540-10-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-16'">
<a href="#1540-10-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-17'">
<a href="#1540-10-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-18'">
<a href="#1540-10-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-19'">
<a href="#1540-10-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-20'">
<a href="#1540-10-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-21'">
<a href="#1540-10-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-22'">
<a href="#1540-10-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-23'">
<a href="#1540-10-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-24'">
<a href="#1540-10-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-25'">
<a href="#1540-10-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-26'">
<a href="#1540-10-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-27'">
<a href="#1540-10-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-28'">
<a href="#1540-10-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-29'">
<a href="#1540-10-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-30'">
<a href="#1540-10-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-10-31'">
<a href="#1540-10-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11'">
<a href="#1540-11" class="date_valid">November</a></xsl:when>					<xsl:otherwise>November</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-01'">
<a href="#1540-11-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-02'">
<a href="#1540-11-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-03'">
<a href="#1540-11-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-04'">
<a href="#1540-11-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-05'">
<a href="#1540-11-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-06'">
<a href="#1540-11-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-07'">
<a href="#1540-11-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-08'">
<a href="#1540-11-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-09'">
<a href="#1540-11-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-10'">
<a href="#1540-11-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-11'">
<a href="#1540-11-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-12'">
<a href="#1540-11-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-13'">
<a href="#1540-11-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-14'">
<a href="#1540-11-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-15'">
<a href="#1540-11-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-16'">
<a href="#1540-11-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-17'">
<a href="#1540-11-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-18'">
<a href="#1540-11-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-19'">
<a href="#1540-11-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-20'">
<a href="#1540-11-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-21'">
<a href="#1540-11-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-22'">
<a href="#1540-11-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-23'">
<a href="#1540-11-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-24'">
<a href="#1540-11-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-25'">
<a href="#1540-11-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-26'">
<a href="#1540-11-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-27'">
<a href="#1540-11-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-28'">
<a href="#1540-11-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-29'">
<a href="#1540-11-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-11-30'">
<a href="#1540-11-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12'">
<a href="#1540-12" class="date_valid">December</a></xsl:when>					<xsl:otherwise>December</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540'">
<a href="#1540" class="date_valid">1540</a></xsl:when>					<xsl:otherwise>1540</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-01'">
<a href="#1540-12-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-02'">
<a href="#1540-12-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-03'">
<a href="#1540-12-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-04'">
<a href="#1540-12-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-05'">
<a href="#1540-12-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-06'">
<a href="#1540-12-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-07'">
<a href="#1540-12-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-08'">
<a href="#1540-12-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-09'">
<a href="#1540-12-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-10'">
<a href="#1540-12-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-11'">
<a href="#1540-12-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-12'">
<a href="#1540-12-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-13'">
<a href="#1540-12-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-14'">
<a href="#1540-12-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-15'">
<a href="#1540-12-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-16'">
<a href="#1540-12-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-17'">
<a href="#1540-12-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-18'">
<a href="#1540-12-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-19'">
<a href="#1540-12-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-20'">
<a href="#1540-12-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-21'">
<a href="#1540-12-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-22'">
<a href="#1540-12-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-23'">
<a href="#1540-12-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-24'">
<a href="#1540-12-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-25'">
<a href="#1540-12-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-26'">
<a href="#1540-12-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-27'">
<a href="#1540-12-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-28'">
<a href="#1540-12-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-29'">
<a href="#1540-12-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-30'">
<a href="#1540-12-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1540-12-31'">
<a href="#1540-12-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="c_1541" class="tabs_content">
<!--				<h3>1541</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01'">
<a href="#1541-01" class="date_valid">January</a></xsl:when>					<xsl:otherwise>January</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-01'">
<a href="#1541-01-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-02'">
<a href="#1541-01-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-03'">
<a href="#1541-01-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-04'">
<a href="#1541-01-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-05'">
<a href="#1541-01-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-06'">
<a href="#1541-01-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-07'">
<a href="#1541-01-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-08'">
<a href="#1541-01-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-09'">
<a href="#1541-01-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-10'">
<a href="#1541-01-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-11'">
<a href="#1541-01-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-12'">
<a href="#1541-01-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-13'">
<a href="#1541-01-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-14'">
<a href="#1541-01-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-15'">
<a href="#1541-01-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-16'">
<a href="#1541-01-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-17'">
<a href="#1541-01-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-18'">
<a href="#1541-01-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-19'">
<a href="#1541-01-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-20'">
<a href="#1541-01-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-21'">
<a href="#1541-01-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-22'">
<a href="#1541-01-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-23'">
<a href="#1541-01-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-24'">
<a href="#1541-01-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-25'">
<a href="#1541-01-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-26'">
<a href="#1541-01-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-27'">
<a href="#1541-01-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-28'">
<a href="#1541-01-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-29'">
<a href="#1541-01-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-30'">
<a href="#1541-01-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-01-31'">
<a href="#1541-01-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02'">
<a href="#1541-02" class="date_valid">February</a></xsl:when>					<xsl:otherwise>February</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-01'">
<a href="#1541-02-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-02'">
<a href="#1541-02-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-03'">
<a href="#1541-02-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-04'">
<a href="#1541-02-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-05'">
<a href="#1541-02-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-06'">
<a href="#1541-02-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-07'">
<a href="#1541-02-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-08'">
<a href="#1541-02-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-09'">
<a href="#1541-02-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-10'">
<a href="#1541-02-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-11'">
<a href="#1541-02-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-12'">
<a href="#1541-02-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-13'">
<a href="#1541-02-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-14'">
<a href="#1541-02-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-15'">
<a href="#1541-02-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-16'">
<a href="#1541-02-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-17'">
<a href="#1541-02-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-18'">
<a href="#1541-02-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-19'">
<a href="#1541-02-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-20'">
<a href="#1541-02-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-21'">
<a href="#1541-02-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-22'">
<a href="#1541-02-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-23'">
<a href="#1541-02-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-24'">
<a href="#1541-02-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-25'">
<a href="#1541-02-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-26'">
<a href="#1541-02-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-27'">
<a href="#1541-02-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-02-28'">
<a href="#1541-02-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03'">
<a href="#1541-03" class="date_valid">March</a></xsl:when>					<xsl:otherwise>March</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-01'">
<a href="#1541-03-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-02'">
<a href="#1541-03-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-03'">
<a href="#1541-03-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-04'">
<a href="#1541-03-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-05'">
<a href="#1541-03-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-06'">
<a href="#1541-03-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-07'">
<a href="#1541-03-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-08'">
<a href="#1541-03-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-09'">
<a href="#1541-03-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-10'">
<a href="#1541-03-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-11'">
<a href="#1541-03-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-12'">
<a href="#1541-03-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-13'">
<a href="#1541-03-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-14'">
<a href="#1541-03-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-15'">
<a href="#1541-03-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-16'">
<a href="#1541-03-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-17'">
<a href="#1541-03-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-18'">
<a href="#1541-03-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-19'">
<a href="#1541-03-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-20'">
<a href="#1541-03-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-21'">
<a href="#1541-03-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-22'">
<a href="#1541-03-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-23'">
<a href="#1541-03-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-24'">
<a href="#1541-03-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-25'">
<a href="#1541-03-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-26'">
<a href="#1541-03-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-27'">
<a href="#1541-03-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-28'">
<a href="#1541-03-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-29'">
<a href="#1541-03-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-30'">
<a href="#1541-03-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-03-31'">
<a href="#1541-03-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04'">
<a href="#1541-04" class="date_valid">April</a></xsl:when>					<xsl:otherwise>April</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-01'">
<a href="#1541-04-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-02'">
<a href="#1541-04-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-03'">
<a href="#1541-04-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-04'">
<a href="#1541-04-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-05'">
<a href="#1541-04-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-06'">
<a href="#1541-04-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-07'">
<a href="#1541-04-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-08'">
<a href="#1541-04-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-09'">
<a href="#1541-04-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-10'">
<a href="#1541-04-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-11'">
<a href="#1541-04-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-12'">
<a href="#1541-04-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-13'">
<a href="#1541-04-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-14'">
<a href="#1541-04-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-15'">
<a href="#1541-04-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-16'">
<a href="#1541-04-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-17'">
<a href="#1541-04-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-18'">
<a href="#1541-04-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-19'">
<a href="#1541-04-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-20'">
<a href="#1541-04-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-21'">
<a href="#1541-04-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-22'">
<a href="#1541-04-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-23'">
<a href="#1541-04-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-24'">
<a href="#1541-04-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-25'">
<a href="#1541-04-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-26'">
<a href="#1541-04-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-27'">
<a href="#1541-04-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-28'">
<a href="#1541-04-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-29'">
<a href="#1541-04-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-04-30'">
<a href="#1541-04-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05'">
<a href="#1541-05" class="date_valid">May</a></xsl:when>					<xsl:otherwise>May</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-01'">
<a href="#1541-05-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-02'">
<a href="#1541-05-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-03'">
<a href="#1541-05-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-04'">
<a href="#1541-05-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-05'">
<a href="#1541-05-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-06'">
<a href="#1541-05-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-07'">
<a href="#1541-05-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-08'">
<a href="#1541-05-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-09'">
<a href="#1541-05-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-10'">
<a href="#1541-05-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-11'">
<a href="#1541-05-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-12'">
<a href="#1541-05-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-13'">
<a href="#1541-05-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-14'">
<a href="#1541-05-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-15'">
<a href="#1541-05-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-16'">
<a href="#1541-05-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-17'">
<a href="#1541-05-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-18'">
<a href="#1541-05-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-19'">
<a href="#1541-05-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-20'">
<a href="#1541-05-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-21'">
<a href="#1541-05-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-22'">
<a href="#1541-05-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-23'">
<a href="#1541-05-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-24'">
<a href="#1541-05-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-25'">
<a href="#1541-05-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-26'">
<a href="#1541-05-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-27'">
<a href="#1541-05-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-28'">
<a href="#1541-05-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-29'">
<a href="#1541-05-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-30'">
<a href="#1541-05-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-05-31'">
<a href="#1541-05-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06'">
<a href="#1541-06" class="date_valid">June</a></xsl:when>					<xsl:otherwise>June</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-01'">
<a href="#1541-06-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-02'">
<a href="#1541-06-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-03'">
<a href="#1541-06-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-04'">
<a href="#1541-06-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-05'">
<a href="#1541-06-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-06'">
<a href="#1541-06-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-07'">
<a href="#1541-06-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-08'">
<a href="#1541-06-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-09'">
<a href="#1541-06-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-10'">
<a href="#1541-06-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-11'">
<a href="#1541-06-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-12'">
<a href="#1541-06-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-13'">
<a href="#1541-06-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-14'">
<a href="#1541-06-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-15'">
<a href="#1541-06-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-16'">
<a href="#1541-06-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-17'">
<a href="#1541-06-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-18'">
<a href="#1541-06-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-19'">
<a href="#1541-06-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-20'">
<a href="#1541-06-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-21'">
<a href="#1541-06-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-22'">
<a href="#1541-06-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-23'">
<a href="#1541-06-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-24'">
<a href="#1541-06-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-25'">
<a href="#1541-06-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-26'">
<a href="#1541-06-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-27'">
<a href="#1541-06-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-28'">
<a href="#1541-06-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-29'">
<a href="#1541-06-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-06-30'">
<a href="#1541-06-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07'">
<a href="#1541-07" class="date_valid">July</a></xsl:when>					<xsl:otherwise>July</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-01'">
<a href="#1541-07-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-02'">
<a href="#1541-07-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-03'">
<a href="#1541-07-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-04'">
<a href="#1541-07-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-05'">
<a href="#1541-07-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-06'">
<a href="#1541-07-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-07'">
<a href="#1541-07-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-08'">
<a href="#1541-07-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-09'">
<a href="#1541-07-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-10'">
<a href="#1541-07-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-11'">
<a href="#1541-07-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-12'">
<a href="#1541-07-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-13'">
<a href="#1541-07-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-14'">
<a href="#1541-07-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-15'">
<a href="#1541-07-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-16'">
<a href="#1541-07-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-17'">
<a href="#1541-07-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-18'">
<a href="#1541-07-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-19'">
<a href="#1541-07-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-20'">
<a href="#1541-07-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-21'">
<a href="#1541-07-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-22'">
<a href="#1541-07-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-23'">
<a href="#1541-07-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-24'">
<a href="#1541-07-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-25'">
<a href="#1541-07-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-26'">
<a href="#1541-07-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-27'">
<a href="#1541-07-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-28'">
<a href="#1541-07-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-29'">
<a href="#1541-07-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-30'">
<a href="#1541-07-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-07-31'">
<a href="#1541-07-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08'">
<a href="#1541-08" class="date_valid">August</a></xsl:when>					<xsl:otherwise>August</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-01'">
<a href="#1541-08-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-02'">
<a href="#1541-08-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-03'">
<a href="#1541-08-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-04'">
<a href="#1541-08-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-05'">
<a href="#1541-08-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-06'">
<a href="#1541-08-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-07'">
<a href="#1541-08-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-08'">
<a href="#1541-08-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-09'">
<a href="#1541-08-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-10'">
<a href="#1541-08-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-11'">
<a href="#1541-08-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-12'">
<a href="#1541-08-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-13'">
<a href="#1541-08-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-14'">
<a href="#1541-08-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-15'">
<a href="#1541-08-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-16'">
<a href="#1541-08-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-17'">
<a href="#1541-08-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-18'">
<a href="#1541-08-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-19'">
<a href="#1541-08-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-20'">
<a href="#1541-08-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-21'">
<a href="#1541-08-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-22'">
<a href="#1541-08-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-23'">
<a href="#1541-08-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-24'">
<a href="#1541-08-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-25'">
<a href="#1541-08-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-26'">
<a href="#1541-08-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-27'">
<a href="#1541-08-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-28'">
<a href="#1541-08-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-29'">
<a href="#1541-08-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-30'">
<a href="#1541-08-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-08-31'">
<a href="#1541-08-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09'">
<a href="#1541-09" class="date_valid">September</a></xsl:when>					<xsl:otherwise>September</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-01'">
<a href="#1541-09-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-02'">
<a href="#1541-09-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-03'">
<a href="#1541-09-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-04'">
<a href="#1541-09-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-05'">
<a href="#1541-09-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-06'">
<a href="#1541-09-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-07'">
<a href="#1541-09-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-08'">
<a href="#1541-09-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-09'">
<a href="#1541-09-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-10'">
<a href="#1541-09-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-11'">
<a href="#1541-09-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-12'">
<a href="#1541-09-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-13'">
<a href="#1541-09-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-14'">
<a href="#1541-09-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-15'">
<a href="#1541-09-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-16'">
<a href="#1541-09-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-17'">
<a href="#1541-09-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-18'">
<a href="#1541-09-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-19'">
<a href="#1541-09-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-20'">
<a href="#1541-09-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-21'">
<a href="#1541-09-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-22'">
<a href="#1541-09-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-23'">
<a href="#1541-09-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-24'">
<a href="#1541-09-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-25'">
<a href="#1541-09-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-26'">
<a href="#1541-09-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-27'">
<a href="#1541-09-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-28'">
<a href="#1541-09-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-29'">
<a href="#1541-09-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-09-30'">
<a href="#1541-09-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10'">
<a href="#1541-10" class="date_valid">October</a></xsl:when>					<xsl:otherwise>October</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-01'">
<a href="#1541-10-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-02'">
<a href="#1541-10-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-03'">
<a href="#1541-10-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-04'">
<a href="#1541-10-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-05'">
<a href="#1541-10-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-06'">
<a href="#1541-10-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-07'">
<a href="#1541-10-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-08'">
<a href="#1541-10-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-09'">
<a href="#1541-10-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-10'">
<a href="#1541-10-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-11'">
<a href="#1541-10-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-12'">
<a href="#1541-10-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-13'">
<a href="#1541-10-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-14'">
<a href="#1541-10-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-15'">
<a href="#1541-10-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-16'">
<a href="#1541-10-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-17'">
<a href="#1541-10-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-18'">
<a href="#1541-10-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-19'">
<a href="#1541-10-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-20'">
<a href="#1541-10-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-21'">
<a href="#1541-10-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-22'">
<a href="#1541-10-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-23'">
<a href="#1541-10-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-24'">
<a href="#1541-10-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-25'">
<a href="#1541-10-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-26'">
<a href="#1541-10-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-27'">
<a href="#1541-10-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-28'">
<a href="#1541-10-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-29'">
<a href="#1541-10-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-30'">
<a href="#1541-10-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-10-31'">
<a href="#1541-10-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11'">
<a href="#1541-11" class="date_valid">November</a></xsl:when>					<xsl:otherwise>November</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-01'">
<a href="#1541-11-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-02'">
<a href="#1541-11-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-03'">
<a href="#1541-11-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-04'">
<a href="#1541-11-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-05'">
<a href="#1541-11-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-06'">
<a href="#1541-11-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-07'">
<a href="#1541-11-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-08'">
<a href="#1541-11-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-09'">
<a href="#1541-11-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-10'">
<a href="#1541-11-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-11'">
<a href="#1541-11-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-12'">
<a href="#1541-11-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-13'">
<a href="#1541-11-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-14'">
<a href="#1541-11-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-15'">
<a href="#1541-11-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-16'">
<a href="#1541-11-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-17'">
<a href="#1541-11-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-18'">
<a href="#1541-11-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-19'">
<a href="#1541-11-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-20'">
<a href="#1541-11-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-21'">
<a href="#1541-11-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-22'">
<a href="#1541-11-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-23'">
<a href="#1541-11-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-24'">
<a href="#1541-11-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-25'">
<a href="#1541-11-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-26'">
<a href="#1541-11-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-27'">
<a href="#1541-11-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-28'">
<a href="#1541-11-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-29'">
<a href="#1541-11-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-11-30'">
<a href="#1541-11-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12'">
<a href="#1541-12" class="date_valid">December</a></xsl:when>					<xsl:otherwise>December</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541'">
<a href="#1541" class="date_valid">1541</a></xsl:when>					<xsl:otherwise>1541</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-01'">
<a href="#1541-12-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-02'">
<a href="#1541-12-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-03'">
<a href="#1541-12-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-04'">
<a href="#1541-12-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-05'">
<a href="#1541-12-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-06'">
<a href="#1541-12-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-07'">
<a href="#1541-12-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-08'">
<a href="#1541-12-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-09'">
<a href="#1541-12-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-10'">
<a href="#1541-12-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-11'">
<a href="#1541-12-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-12'">
<a href="#1541-12-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-13'">
<a href="#1541-12-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-14'">
<a href="#1541-12-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-15'">
<a href="#1541-12-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-16'">
<a href="#1541-12-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-17'">
<a href="#1541-12-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-18'">
<a href="#1541-12-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-19'">
<a href="#1541-12-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-20'">
<a href="#1541-12-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-21'">
<a href="#1541-12-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-22'">
<a href="#1541-12-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-23'">
<a href="#1541-12-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-24'">
<a href="#1541-12-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-25'">
<a href="#1541-12-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-26'">
<a href="#1541-12-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-27'">
<a href="#1541-12-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-28'">
<a href="#1541-12-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-29'">
<a href="#1541-12-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-30'">
<a href="#1541-12-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1541-12-31'">
<a href="#1541-12-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="c_1542" class="tabs_content">
<!--				<h3>1542</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01'">
<a href="#1542-01" class="date_valid">January</a></xsl:when>					<xsl:otherwise>January</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-01'">
<a href="#1542-01-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-02'">
<a href="#1542-01-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-03'">
<a href="#1542-01-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-04'">
<a href="#1542-01-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-05'">
<a href="#1542-01-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-06'">
<a href="#1542-01-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-07'">
<a href="#1542-01-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-08'">
<a href="#1542-01-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-09'">
<a href="#1542-01-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-10'">
<a href="#1542-01-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-11'">
<a href="#1542-01-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-12'">
<a href="#1542-01-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-13'">
<a href="#1542-01-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-14'">
<a href="#1542-01-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-15'">
<a href="#1542-01-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-16'">
<a href="#1542-01-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-17'">
<a href="#1542-01-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-18'">
<a href="#1542-01-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-19'">
<a href="#1542-01-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-20'">
<a href="#1542-01-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-21'">
<a href="#1542-01-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-22'">
<a href="#1542-01-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-23'">
<a href="#1542-01-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-24'">
<a href="#1542-01-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-25'">
<a href="#1542-01-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-26'">
<a href="#1542-01-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-27'">
<a href="#1542-01-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-28'">
<a href="#1542-01-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-29'">
<a href="#1542-01-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-30'">
<a href="#1542-01-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-01-31'">
<a href="#1542-01-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02'">
<a href="#1542-02" class="date_valid">February</a></xsl:when>					<xsl:otherwise>February</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-01'">
<a href="#1542-02-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-02'">
<a href="#1542-02-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-03'">
<a href="#1542-02-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-04'">
<a href="#1542-02-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-05'">
<a href="#1542-02-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-06'">
<a href="#1542-02-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-07'">
<a href="#1542-02-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-08'">
<a href="#1542-02-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-09'">
<a href="#1542-02-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-10'">
<a href="#1542-02-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-11'">
<a href="#1542-02-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-12'">
<a href="#1542-02-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-13'">
<a href="#1542-02-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-14'">
<a href="#1542-02-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-15'">
<a href="#1542-02-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-16'">
<a href="#1542-02-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-17'">
<a href="#1542-02-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-18'">
<a href="#1542-02-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-19'">
<a href="#1542-02-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-20'">
<a href="#1542-02-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-21'">
<a href="#1542-02-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-22'">
<a href="#1542-02-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-23'">
<a href="#1542-02-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-24'">
<a href="#1542-02-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-25'">
<a href="#1542-02-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-26'">
<a href="#1542-02-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-27'">
<a href="#1542-02-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-02-28'">
<a href="#1542-02-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03'">
<a href="#1542-03" class="date_valid">March</a></xsl:when>					<xsl:otherwise>March</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-01'">
<a href="#1542-03-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-02'">
<a href="#1542-03-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-03'">
<a href="#1542-03-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-04'">
<a href="#1542-03-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-05'">
<a href="#1542-03-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-06'">
<a href="#1542-03-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-07'">
<a href="#1542-03-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-08'">
<a href="#1542-03-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-09'">
<a href="#1542-03-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-10'">
<a href="#1542-03-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-11'">
<a href="#1542-03-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-12'">
<a href="#1542-03-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-13'">
<a href="#1542-03-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-14'">
<a href="#1542-03-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-15'">
<a href="#1542-03-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-16'">
<a href="#1542-03-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-17'">
<a href="#1542-03-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-18'">
<a href="#1542-03-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-19'">
<a href="#1542-03-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-20'">
<a href="#1542-03-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-21'">
<a href="#1542-03-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-22'">
<a href="#1542-03-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-23'">
<a href="#1542-03-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-24'">
<a href="#1542-03-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-25'">
<a href="#1542-03-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-26'">
<a href="#1542-03-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-27'">
<a href="#1542-03-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-28'">
<a href="#1542-03-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-29'">
<a href="#1542-03-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-30'">
<a href="#1542-03-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-03-31'">
<a href="#1542-03-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04'">
<a href="#1542-04" class="date_valid">April</a></xsl:when>					<xsl:otherwise>April</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-01'">
<a href="#1542-04-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-02'">
<a href="#1542-04-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-03'">
<a href="#1542-04-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-04'">
<a href="#1542-04-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-05'">
<a href="#1542-04-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-06'">
<a href="#1542-04-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-07'">
<a href="#1542-04-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-08'">
<a href="#1542-04-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-09'">
<a href="#1542-04-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-10'">
<a href="#1542-04-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-11'">
<a href="#1542-04-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-12'">
<a href="#1542-04-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-13'">
<a href="#1542-04-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-14'">
<a href="#1542-04-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-15'">
<a href="#1542-04-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-16'">
<a href="#1542-04-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-17'">
<a href="#1542-04-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-18'">
<a href="#1542-04-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-19'">
<a href="#1542-04-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-20'">
<a href="#1542-04-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-21'">
<a href="#1542-04-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-22'">
<a href="#1542-04-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-23'">
<a href="#1542-04-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-24'">
<a href="#1542-04-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-25'">
<a href="#1542-04-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-26'">
<a href="#1542-04-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-27'">
<a href="#1542-04-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-28'">
<a href="#1542-04-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-29'">
<a href="#1542-04-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-04-30'">
<a href="#1542-04-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05'">
<a href="#1542-05" class="date_valid">May</a></xsl:when>					<xsl:otherwise>May</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-01'">
<a href="#1542-05-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-02'">
<a href="#1542-05-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-03'">
<a href="#1542-05-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-04'">
<a href="#1542-05-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-05'">
<a href="#1542-05-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-06'">
<a href="#1542-05-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-07'">
<a href="#1542-05-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-08'">
<a href="#1542-05-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-09'">
<a href="#1542-05-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-10'">
<a href="#1542-05-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-11'">
<a href="#1542-05-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-12'">
<a href="#1542-05-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-13'">
<a href="#1542-05-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-14'">
<a href="#1542-05-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-15'">
<a href="#1542-05-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-16'">
<a href="#1542-05-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-17'">
<a href="#1542-05-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-18'">
<a href="#1542-05-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-19'">
<a href="#1542-05-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-20'">
<a href="#1542-05-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-21'">
<a href="#1542-05-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-22'">
<a href="#1542-05-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-23'">
<a href="#1542-05-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-24'">
<a href="#1542-05-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-25'">
<a href="#1542-05-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-26'">
<a href="#1542-05-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-27'">
<a href="#1542-05-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-28'">
<a href="#1542-05-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-29'">
<a href="#1542-05-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-30'">
<a href="#1542-05-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-05-31'">
<a href="#1542-05-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06'">
<a href="#1542-06" class="date_valid">June</a></xsl:when>					<xsl:otherwise>June</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-01'">
<a href="#1542-06-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-02'">
<a href="#1542-06-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-03'">
<a href="#1542-06-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-04'">
<a href="#1542-06-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-05'">
<a href="#1542-06-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-06'">
<a href="#1542-06-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-07'">
<a href="#1542-06-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-08'">
<a href="#1542-06-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-09'">
<a href="#1542-06-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-10'">
<a href="#1542-06-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-11'">
<a href="#1542-06-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-12'">
<a href="#1542-06-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-13'">
<a href="#1542-06-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-14'">
<a href="#1542-06-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-15'">
<a href="#1542-06-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-16'">
<a href="#1542-06-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-17'">
<a href="#1542-06-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-18'">
<a href="#1542-06-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-19'">
<a href="#1542-06-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-20'">
<a href="#1542-06-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-21'">
<a href="#1542-06-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-22'">
<a href="#1542-06-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-23'">
<a href="#1542-06-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-24'">
<a href="#1542-06-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-25'">
<a href="#1542-06-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-26'">
<a href="#1542-06-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-27'">
<a href="#1542-06-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-28'">
<a href="#1542-06-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-29'">
<a href="#1542-06-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-06-30'">
<a href="#1542-06-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07'">
<a href="#1542-07" class="date_valid">July</a></xsl:when>					<xsl:otherwise>July</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-01'">
<a href="#1542-07-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-02'">
<a href="#1542-07-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-03'">
<a href="#1542-07-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-04'">
<a href="#1542-07-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-05'">
<a href="#1542-07-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-06'">
<a href="#1542-07-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-07'">
<a href="#1542-07-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-08'">
<a href="#1542-07-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-09'">
<a href="#1542-07-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-10'">
<a href="#1542-07-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-11'">
<a href="#1542-07-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-12'">
<a href="#1542-07-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-13'">
<a href="#1542-07-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-14'">
<a href="#1542-07-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-15'">
<a href="#1542-07-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-16'">
<a href="#1542-07-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-17'">
<a href="#1542-07-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-18'">
<a href="#1542-07-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-19'">
<a href="#1542-07-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-20'">
<a href="#1542-07-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-21'">
<a href="#1542-07-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-22'">
<a href="#1542-07-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-23'">
<a href="#1542-07-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-24'">
<a href="#1542-07-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-25'">
<a href="#1542-07-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-26'">
<a href="#1542-07-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-27'">
<a href="#1542-07-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-28'">
<a href="#1542-07-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-29'">
<a href="#1542-07-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-30'">
<a href="#1542-07-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-07-31'">
<a href="#1542-07-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08'">
<a href="#1542-08" class="date_valid">August</a></xsl:when>					<xsl:otherwise>August</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-01'">
<a href="#1542-08-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-02'">
<a href="#1542-08-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-03'">
<a href="#1542-08-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-04'">
<a href="#1542-08-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-05'">
<a href="#1542-08-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-06'">
<a href="#1542-08-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-07'">
<a href="#1542-08-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-08'">
<a href="#1542-08-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-09'">
<a href="#1542-08-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-10'">
<a href="#1542-08-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-11'">
<a href="#1542-08-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-12'">
<a href="#1542-08-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-13'">
<a href="#1542-08-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-14'">
<a href="#1542-08-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-15'">
<a href="#1542-08-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-16'">
<a href="#1542-08-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-17'">
<a href="#1542-08-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-18'">
<a href="#1542-08-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-19'">
<a href="#1542-08-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-20'">
<a href="#1542-08-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-21'">
<a href="#1542-08-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-22'">
<a href="#1542-08-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-23'">
<a href="#1542-08-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-24'">
<a href="#1542-08-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-25'">
<a href="#1542-08-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-26'">
<a href="#1542-08-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-27'">
<a href="#1542-08-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-28'">
<a href="#1542-08-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-29'">
<a href="#1542-08-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-30'">
<a href="#1542-08-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-08-31'">
<a href="#1542-08-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09'">
<a href="#1542-09" class="date_valid">September</a></xsl:when>					<xsl:otherwise>September</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-01'">
<a href="#1542-09-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-02'">
<a href="#1542-09-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-03'">
<a href="#1542-09-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-04'">
<a href="#1542-09-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-05'">
<a href="#1542-09-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-06'">
<a href="#1542-09-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-07'">
<a href="#1542-09-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-08'">
<a href="#1542-09-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-09'">
<a href="#1542-09-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-10'">
<a href="#1542-09-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-11'">
<a href="#1542-09-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-12'">
<a href="#1542-09-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-13'">
<a href="#1542-09-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-14'">
<a href="#1542-09-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-15'">
<a href="#1542-09-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-16'">
<a href="#1542-09-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-17'">
<a href="#1542-09-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-18'">
<a href="#1542-09-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-19'">
<a href="#1542-09-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-20'">
<a href="#1542-09-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-21'">
<a href="#1542-09-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-22'">
<a href="#1542-09-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-23'">
<a href="#1542-09-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-24'">
<a href="#1542-09-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-25'">
<a href="#1542-09-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-26'">
<a href="#1542-09-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-27'">
<a href="#1542-09-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-28'">
<a href="#1542-09-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-29'">
<a href="#1542-09-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-09-30'">
<a href="#1542-09-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10'">
<a href="#1542-10" class="date_valid">October</a></xsl:when>					<xsl:otherwise>October</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-01'">
<a href="#1542-10-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-02'">
<a href="#1542-10-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-03'">
<a href="#1542-10-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-04'">
<a href="#1542-10-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-05'">
<a href="#1542-10-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-06'">
<a href="#1542-10-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-07'">
<a href="#1542-10-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-08'">
<a href="#1542-10-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-09'">
<a href="#1542-10-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-10'">
<a href="#1542-10-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-11'">
<a href="#1542-10-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-12'">
<a href="#1542-10-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-13'">
<a href="#1542-10-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-14'">
<a href="#1542-10-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-15'">
<a href="#1542-10-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-16'">
<a href="#1542-10-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-17'">
<a href="#1542-10-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-18'">
<a href="#1542-10-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-19'">
<a href="#1542-10-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-20'">
<a href="#1542-10-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-21'">
<a href="#1542-10-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-22'">
<a href="#1542-10-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-23'">
<a href="#1542-10-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-24'">
<a href="#1542-10-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-25'">
<a href="#1542-10-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-26'">
<a href="#1542-10-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-27'">
<a href="#1542-10-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-28'">
<a href="#1542-10-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-29'">
<a href="#1542-10-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-30'">
<a href="#1542-10-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-10-31'">
<a href="#1542-10-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11'">
<a href="#1542-11" class="date_valid">November</a></xsl:when>					<xsl:otherwise>November</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-01'">
<a href="#1542-11-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-02'">
<a href="#1542-11-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-03'">
<a href="#1542-11-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-04'">
<a href="#1542-11-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-05'">
<a href="#1542-11-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-06'">
<a href="#1542-11-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-07'">
<a href="#1542-11-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-08'">
<a href="#1542-11-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-09'">
<a href="#1542-11-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-10'">
<a href="#1542-11-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-11'">
<a href="#1542-11-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-12'">
<a href="#1542-11-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-13'">
<a href="#1542-11-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-14'">
<a href="#1542-11-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-15'">
<a href="#1542-11-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-16'">
<a href="#1542-11-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-17'">
<a href="#1542-11-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-18'">
<a href="#1542-11-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-19'">
<a href="#1542-11-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-20'">
<a href="#1542-11-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-21'">
<a href="#1542-11-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-22'">
<a href="#1542-11-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-23'">
<a href="#1542-11-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-24'">
<a href="#1542-11-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-25'">
<a href="#1542-11-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-26'">
<a href="#1542-11-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-27'">
<a href="#1542-11-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-28'">
<a href="#1542-11-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-29'">
<a href="#1542-11-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-11-30'">
<a href="#1542-11-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12'">
<a href="#1542-12" class="date_valid">December</a></xsl:when>					<xsl:otherwise>December</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542'">
<a href="#1542" class="date_valid">1542</a></xsl:when>					<xsl:otherwise>1542</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-01'">
<a href="#1542-12-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-02'">
<a href="#1542-12-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-03'">
<a href="#1542-12-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-04'">
<a href="#1542-12-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-05'">
<a href="#1542-12-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-06'">
<a href="#1542-12-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-07'">
<a href="#1542-12-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-08'">
<a href="#1542-12-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-09'">
<a href="#1542-12-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-10'">
<a href="#1542-12-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-11'">
<a href="#1542-12-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-12'">
<a href="#1542-12-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-13'">
<a href="#1542-12-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-14'">
<a href="#1542-12-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-15'">
<a href="#1542-12-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-16'">
<a href="#1542-12-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-17'">
<a href="#1542-12-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-18'">
<a href="#1542-12-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-19'">
<a href="#1542-12-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-20'">
<a href="#1542-12-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-21'">
<a href="#1542-12-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-22'">
<a href="#1542-12-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-23'">
<a href="#1542-12-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-24'">
<a href="#1542-12-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-25'">
<a href="#1542-12-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-26'">
<a href="#1542-12-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-27'">
<a href="#1542-12-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-28'">
<a href="#1542-12-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-29'">
<a href="#1542-12-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-30'">
<a href="#1542-12-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1542-12-31'">
<a href="#1542-12-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="c_1543" class="tabs_content">
				<!--<h3>1543</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01'">
<a href="#1543-01" class="date_valid">January</a></xsl:when>					<xsl:otherwise>January</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-01'">
<a href="#1543-01-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-02'">
<a href="#1543-01-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-03'">
<a href="#1543-01-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-04'">
<a href="#1543-01-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-05'">
<a href="#1543-01-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-06'">
<a href="#1543-01-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-07'">
<a href="#1543-01-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-08'">
<a href="#1543-01-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-09'">
<a href="#1543-01-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-10'">
<a href="#1543-01-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-11'">
<a href="#1543-01-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-12'">
<a href="#1543-01-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-13'">
<a href="#1543-01-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-14'">
<a href="#1543-01-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-15'">
<a href="#1543-01-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-16'">
<a href="#1543-01-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-17'">
<a href="#1543-01-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-18'">
<a href="#1543-01-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-19'">
<a href="#1543-01-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-20'">
<a href="#1543-01-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-21'">
<a href="#1543-01-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-22'">
<a href="#1543-01-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-23'">
<a href="#1543-01-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-24'">
<a href="#1543-01-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-25'">
<a href="#1543-01-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-26'">
<a href="#1543-01-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-27'">
<a href="#1543-01-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-28'">
<a href="#1543-01-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-29'">
<a href="#1543-01-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-30'">
<a href="#1543-01-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-01-31'">
<a href="#1543-01-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02'">
<a href="#1543-02" class="date_valid">February</a></xsl:when>					<xsl:otherwise>February</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-01'">
<a href="#1543-02-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-02'">
<a href="#1543-02-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-03'">
<a href="#1543-02-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-04'">
<a href="#1543-02-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-05'">
<a href="#1543-02-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-06'">
<a href="#1543-02-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-07'">
<a href="#1543-02-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-08'">
<a href="#1543-02-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-09'">
<a href="#1543-02-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-10'">
<a href="#1543-02-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-11'">
<a href="#1543-02-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-12'">
<a href="#1543-02-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-13'">
<a href="#1543-02-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-14'">
<a href="#1543-02-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-15'">
<a href="#1543-02-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-16'">
<a href="#1543-02-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-17'">
<a href="#1543-02-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-18'">
<a href="#1543-02-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-19'">
<a href="#1543-02-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-20'">
<a href="#1543-02-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-21'">
<a href="#1543-02-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-22'">
<a href="#1543-02-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-23'">
<a href="#1543-02-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-24'">
<a href="#1543-02-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-25'">
<a href="#1543-02-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-26'">
<a href="#1543-02-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-27'">
<a href="#1543-02-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-02-28'">
<a href="#1543-02-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03'">
<a href="#1543-03" class="date_valid">March</a></xsl:when>					<xsl:otherwise>March</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-01'">
<a href="#1543-03-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-02'">
<a href="#1543-03-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-03'">
<a href="#1543-03-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-04'">
<a href="#1543-03-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-05'">
<a href="#1543-03-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-06'">
<a href="#1543-03-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-07'">
<a href="#1543-03-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-08'">
<a href="#1543-03-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-09'">
<a href="#1543-03-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-10'">
<a href="#1543-03-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-11'">
<a href="#1543-03-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-12'">
<a href="#1543-03-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-13'">
<a href="#1543-03-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-14'">
<a href="#1543-03-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-15'">
<a href="#1543-03-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-16'">
<a href="#1543-03-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-17'">
<a href="#1543-03-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-18'">
<a href="#1543-03-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-19'">
<a href="#1543-03-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-20'">
<a href="#1543-03-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-21'">
<a href="#1543-03-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-22'">
<a href="#1543-03-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-23'">
<a href="#1543-03-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-24'">
<a href="#1543-03-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-25'">
<a href="#1543-03-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-26'">
<a href="#1543-03-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-27'">
<a href="#1543-03-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-28'">
<a href="#1543-03-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-29'">
<a href="#1543-03-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-30'">
<a href="#1543-03-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-03-31'">
<a href="#1543-03-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04'">
<a href="#1543-04" class="date_valid">April</a></xsl:when>					<xsl:otherwise>April</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-01'">
<a href="#1543-04-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-02'">
<a href="#1543-04-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-03'">
<a href="#1543-04-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-04'">
<a href="#1543-04-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-05'">
<a href="#1543-04-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-06'">
<a href="#1543-04-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-07'">
<a href="#1543-04-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-08'">
<a href="#1543-04-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-09'">
<a href="#1543-04-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-10'">
<a href="#1543-04-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-11'">
<a href="#1543-04-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-12'">
<a href="#1543-04-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-13'">
<a href="#1543-04-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-14'">
<a href="#1543-04-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-15'">
<a href="#1543-04-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-16'">
<a href="#1543-04-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-17'">
<a href="#1543-04-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-18'">
<a href="#1543-04-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-19'">
<a href="#1543-04-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-20'">
<a href="#1543-04-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-21'">
<a href="#1543-04-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-22'">
<a href="#1543-04-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-23'">
<a href="#1543-04-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-24'">
<a href="#1543-04-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-25'">
<a href="#1543-04-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-26'">
<a href="#1543-04-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-27'">
<a href="#1543-04-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-28'">
<a href="#1543-04-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-29'">
<a href="#1543-04-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-04-30'">
<a href="#1543-04-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05'">
<a href="#1543-05" class="date_valid">May</a></xsl:when>					<xsl:otherwise>May</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-01'">
<a href="#1543-05-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-02'">
<a href="#1543-05-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-03'">
<a href="#1543-05-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-04'">
<a href="#1543-05-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-05'">
<a href="#1543-05-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-06'">
<a href="#1543-05-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-07'">
<a href="#1543-05-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-08'">
<a href="#1543-05-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-09'">
<a href="#1543-05-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-10'">
<a href="#1543-05-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-11'">
<a href="#1543-05-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-12'">
<a href="#1543-05-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-13'">
<a href="#1543-05-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-14'">
<a href="#1543-05-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-15'">
<a href="#1543-05-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-16'">
<a href="#1543-05-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-17'">
<a href="#1543-05-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-18'">
<a href="#1543-05-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-19'">
<a href="#1543-05-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-20'">
<a href="#1543-05-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-21'">
<a href="#1543-05-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-22'">
<a href="#1543-05-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-23'">
<a href="#1543-05-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-24'">
<a href="#1543-05-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-25'">
<a href="#1543-05-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-26'">
<a href="#1543-05-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-27'">
<a href="#1543-05-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-28'">
<a href="#1543-05-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-29'">
<a href="#1543-05-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-30'">
<a href="#1543-05-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-05-31'">
<a href="#1543-05-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06'">
<a href="#1543-06" class="date_valid">June</a></xsl:when>					<xsl:otherwise>June</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-01'">
<a href="#1543-06-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-02'">
<a href="#1543-06-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-03'">
<a href="#1543-06-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-04'">
<a href="#1543-06-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-05'">
<a href="#1543-06-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-06'">
<a href="#1543-06-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-07'">
<a href="#1543-06-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-08'">
<a href="#1543-06-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-09'">
<a href="#1543-06-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-10'">
<a href="#1543-06-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-11'">
<a href="#1543-06-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-12'">
<a href="#1543-06-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-13'">
<a href="#1543-06-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-14'">
<a href="#1543-06-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-15'">
<a href="#1543-06-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-16'">
<a href="#1543-06-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-17'">
<a href="#1543-06-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-18'">
<a href="#1543-06-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-19'">
<a href="#1543-06-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-20'">
<a href="#1543-06-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-21'">
<a href="#1543-06-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-22'">
<a href="#1543-06-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-23'">
<a href="#1543-06-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-24'">
<a href="#1543-06-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-25'">
<a href="#1543-06-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-26'">
<a href="#1543-06-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-27'">
<a href="#1543-06-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-28'">
<a href="#1543-06-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-29'">
<a href="#1543-06-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-06-30'">
<a href="#1543-06-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07'">
<a href="#1543-07" class="date_valid">July</a></xsl:when>					<xsl:otherwise>July</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-01'">
<a href="#1543-07-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-02'">
<a href="#1543-07-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-03'">
<a href="#1543-07-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-04'">
<a href="#1543-07-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-05'">
<a href="#1543-07-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-06'">
<a href="#1543-07-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-07'">
<a href="#1543-07-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-08'">
<a href="#1543-07-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-09'">
<a href="#1543-07-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-10'">
<a href="#1543-07-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-11'">
<a href="#1543-07-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-12'">
<a href="#1543-07-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-13'">
<a href="#1543-07-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-14'">
<a href="#1543-07-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-15'">
<a href="#1543-07-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-16'">
<a href="#1543-07-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-17'">
<a href="#1543-07-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-18'">
<a href="#1543-07-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-19'">
<a href="#1543-07-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-20'">
<a href="#1543-07-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-21'">
<a href="#1543-07-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-22'">
<a href="#1543-07-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-23'">
<a href="#1543-07-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-24'">
<a href="#1543-07-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-25'">
<a href="#1543-07-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-26'">
<a href="#1543-07-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-27'">
<a href="#1543-07-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-28'">
<a href="#1543-07-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-29'">
<a href="#1543-07-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-30'">
<a href="#1543-07-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-07-31'">
<a href="#1543-07-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08'">
<a href="#1543-08" class="date_valid">August</a></xsl:when>					<xsl:otherwise>August</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-01'">
<a href="#1543-08-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-02'">
<a href="#1543-08-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-03'">
<a href="#1543-08-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-04'">
<a href="#1543-08-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-05'">
<a href="#1543-08-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-06'">
<a href="#1543-08-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-07'">
<a href="#1543-08-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-08'">
<a href="#1543-08-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-09'">
<a href="#1543-08-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-10'">
<a href="#1543-08-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-11'">
<a href="#1543-08-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-12'">
<a href="#1543-08-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-13'">
<a href="#1543-08-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-14'">
<a href="#1543-08-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-15'">
<a href="#1543-08-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-16'">
<a href="#1543-08-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-17'">
<a href="#1543-08-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-18'">
<a href="#1543-08-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-19'">
<a href="#1543-08-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-20'">
<a href="#1543-08-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-21'">
<a href="#1543-08-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-22'">
<a href="#1543-08-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-23'">
<a href="#1543-08-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-24'">
<a href="#1543-08-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-25'">
<a href="#1543-08-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-26'">
<a href="#1543-08-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-27'">
<a href="#1543-08-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-28'">
<a href="#1543-08-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-29'">
<a href="#1543-08-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-30'">
<a href="#1543-08-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-08-31'">
<a href="#1543-08-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09'">
<a href="#1543-09" class="date_valid">September</a></xsl:when>					<xsl:otherwise>September</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-01'">
<a href="#1543-09-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-02'">
<a href="#1543-09-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-03'">
<a href="#1543-09-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-04'">
<a href="#1543-09-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-05'">
<a href="#1543-09-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-06'">
<a href="#1543-09-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-07'">
<a href="#1543-09-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-08'">
<a href="#1543-09-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-09'">
<a href="#1543-09-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-10'">
<a href="#1543-09-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-11'">
<a href="#1543-09-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-12'">
<a href="#1543-09-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-13'">
<a href="#1543-09-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-14'">
<a href="#1543-09-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-15'">
<a href="#1543-09-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-16'">
<a href="#1543-09-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-17'">
<a href="#1543-09-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-18'">
<a href="#1543-09-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-19'">
<a href="#1543-09-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-20'">
<a href="#1543-09-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-21'">
<a href="#1543-09-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-22'">
<a href="#1543-09-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-23'">
<a href="#1543-09-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-24'">
<a href="#1543-09-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-25'">
<a href="#1543-09-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-26'">
<a href="#1543-09-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-27'">
<a href="#1543-09-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-28'">
<a href="#1543-09-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-29'">
<a href="#1543-09-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-09-30'">
<a href="#1543-09-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10'">
<a href="#1543-10" class="date_valid">October</a></xsl:when>					<xsl:otherwise>October</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-01'">
<a href="#1543-10-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-02'">
<a href="#1543-10-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-03'">
<a href="#1543-10-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-04'">
<a href="#1543-10-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-05'">
<a href="#1543-10-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-06'">
<a href="#1543-10-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-07'">
<a href="#1543-10-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-08'">
<a href="#1543-10-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-09'">
<a href="#1543-10-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-10'">
<a href="#1543-10-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-11'">
<a href="#1543-10-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-12'">
<a href="#1543-10-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-13'">
<a href="#1543-10-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-14'">
<a href="#1543-10-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-15'">
<a href="#1543-10-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-16'">
<a href="#1543-10-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-17'">
<a href="#1543-10-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-18'">
<a href="#1543-10-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-19'">
<a href="#1543-10-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-20'">
<a href="#1543-10-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-21'">
<a href="#1543-10-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-22'">
<a href="#1543-10-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-23'">
<a href="#1543-10-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-24'">
<a href="#1543-10-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-25'">
<a href="#1543-10-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-26'">
<a href="#1543-10-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-27'">
<a href="#1543-10-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-28'">
<a href="#1543-10-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-29'">
<a href="#1543-10-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-30'">
<a href="#1543-10-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-10-31'">
<a href="#1543-10-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11'">
<a href="#1543-11" class="date_valid">November</a></xsl:when>					<xsl:otherwise>November</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-01'">
<a href="#1543-11-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-02'">
<a href="#1543-11-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-03'">
<a href="#1543-11-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-04'">
<a href="#1543-11-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-05'">
<a href="#1543-11-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-06'">
<a href="#1543-11-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-07'">
<a href="#1543-11-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-08'">
<a href="#1543-11-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-09'">
<a href="#1543-11-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-10'">
<a href="#1543-11-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-11'">
<a href="#1543-11-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-12'">
<a href="#1543-11-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-13'">
<a href="#1543-11-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-14'">
<a href="#1543-11-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-15'">
<a href="#1543-11-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-16'">
<a href="#1543-11-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-17'">
<a href="#1543-11-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-18'">
<a href="#1543-11-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-19'">
<a href="#1543-11-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-20'">
<a href="#1543-11-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-21'">
<a href="#1543-11-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-22'">
<a href="#1543-11-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-23'">
<a href="#1543-11-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-24'">
<a href="#1543-11-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-25'">
<a href="#1543-11-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-26'">
<a href="#1543-11-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-27'">
<a href="#1543-11-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-28'">
<a href="#1543-11-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-29'">
<a href="#1543-11-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-11-30'">
<a href="#1543-11-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12'">
<a href="#1543-12" class="date_valid">December</a></xsl:when>					<xsl:otherwise>December</xsl:otherwise>
</xsl:choose>
							</td>
							<td colspan="2">
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543'">
<a href="#1543" class="date_valid">1543</a></xsl:when>					<xsl:otherwise>1543</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>S</td>
							<td>M</td>
							<td>T</td>
							<td>W</td>
							<td>T</td>
							<td>F</td>
							<td>S</td>
						</tr>
						<tr>
							<td/>
							<td/>
							<td/>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-01'">
<a href="#1543-12-01" class="date_valid">1</a></xsl:when>					<xsl:otherwise>1</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-02'">
<a href="#1543-12-02" class="date_valid">2</a></xsl:when>					<xsl:otherwise>2</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-03'">
<a href="#1543-12-03" class="date_valid">3</a></xsl:when>					<xsl:otherwise>3</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-04'">
<a href="#1543-12-04" class="date_valid">4</a></xsl:when>					<xsl:otherwise>4</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-05'">
<a href="#1543-12-05" class="date_valid">5</a></xsl:when>					<xsl:otherwise>5</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-06'">
<a href="#1543-12-06" class="date_valid">6</a></xsl:when>					<xsl:otherwise>6</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-07'">
<a href="#1543-12-07" class="date_valid">7</a></xsl:when>					<xsl:otherwise>7</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-08'">
<a href="#1543-12-08" class="date_valid">8</a></xsl:when>					<xsl:otherwise>8</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-09'">
<a href="#1543-12-09" class="date_valid">9</a></xsl:when>					<xsl:otherwise>9</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-10'">
<a href="#1543-12-10" class="date_valid">10</a></xsl:when>					<xsl:otherwise>10</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-11'">
<a href="#1543-12-11" class="date_valid">11</a></xsl:when>					<xsl:otherwise>11</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-12'">
<a href="#1543-12-12" class="date_valid">12</a></xsl:when>					<xsl:otherwise>12</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-13'">
<a href="#1543-12-13" class="date_valid">13</a></xsl:when>					<xsl:otherwise>13</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-14'">
<a href="#1543-12-14" class="date_valid">14</a></xsl:when>					<xsl:otherwise>14</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-15'">
<a href="#1543-12-15" class="date_valid">15</a></xsl:when>					<xsl:otherwise>15</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-16'">
<a href="#1543-12-16" class="date_valid">16</a></xsl:when>					<xsl:otherwise>16</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-17'">
<a href="#1543-12-17" class="date_valid">17</a></xsl:when>					<xsl:otherwise>17</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-18'">
<a href="#1543-12-18" class="date_valid">18</a></xsl:when>					<xsl:otherwise>18</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-19'">
<a href="#1543-12-19" class="date_valid">19</a></xsl:when>					<xsl:otherwise>19</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-20'">
<a href="#1543-12-20" class="date_valid">20</a></xsl:when>					<xsl:otherwise>20</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-21'">
<a href="#1543-12-21" class="date_valid">21</a></xsl:when>					<xsl:otherwise>21</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-22'">
<a href="#1543-12-22" class="date_valid">22</a></xsl:when>					<xsl:otherwise>22</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-23'">
<a href="#1543-12-23" class="date_valid">23</a></xsl:when>					<xsl:otherwise>23</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-24'">
<a href="#1543-12-24" class="date_valid">24</a></xsl:when>					<xsl:otherwise>24</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-25'">
<a href="#1543-12-25" class="date_valid">25</a></xsl:when>					<xsl:otherwise>25</xsl:otherwise>
</xsl:choose>
							</td>
						</tr>
						<tr>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-26'">
<a href="#1543-12-26" class="date_valid">26</a></xsl:when>					<xsl:otherwise>26</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-27'">
<a href="#1543-12-27" class="date_valid">27</a></xsl:when>					<xsl:otherwise>27</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-28'">
<a href="#1543-12-28" class="date_valid">28</a></xsl:when>					<xsl:otherwise>28</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-29'">
<a href="#1543-12-29" class="date_valid">29</a></xsl:when>					<xsl:otherwise>29</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-30'">
<a href="#1543-12-30" class="date_valid">30</a></xsl:when>					<xsl:otherwise>30</xsl:otherwise>
</xsl:choose>
							</td>
							<td>
								<xsl:choose>
<xsl:when test="//tei:text//tei:date/@when='1543-12-31'">
<a href="#1543-12-31" class="date_valid">31</a></xsl:when>					<xsl:otherwise>31</xsl:otherwise>
</xsl:choose>
							</td>
							<td/>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>

	<xsl:template match="tei:date" mode="index">
		<xsl:variable name="when" select="@when"/>
		<xsl:if test="not(preceding::tei:date[@when = $when])">
			<div class="index_unit" id="{@when}">
				<h3>
					<xsl:value-of select="@when"/>
					<xsl:if test="@when=''">Unidentified dates</xsl:if>
				</h3>
				<ul>
					<xsl:apply-templates select=". | //tei:date[@when = $when]" mode="sub_index"/>
				</ul>
				<a href="#top_2">
					<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
						class="top"
						style="position:absolute; bottom:0; right:0; padding:5px; width:30px;"
					/>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:date" mode="sub_index">
		<li>
			<xsl:text>"</xsl:text>
			<xsl:apply-templates/>
			<xsl:text>"</xsl:text>
			<xsl:text>: p.</xsl:text>
			<a href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}">
				<xsl:value-of select="preceding::tei:pb[1]/@n"/>
			</a>
		</li>
	</xsl:template>

<!--	TEMPLATE NAMED USED TO GENERATE STUFF-->
	<!--cf : https://askcodez.com/convertir-le-premier-caractere-de-chaque-mot-en-majuscule.html-->
	<xsl:template name="CamelCase">
		<!--THIS TEMPLATE CHANGE KEY TO MAKE IT INTO A PROPER NAME WITH MAJ AND WITHOUT "_"-->
		<xsl:param name="key_change"/>
		<xsl:choose>
			<xsl:when test="contains($key_change, '_')">
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="key_change" select="substring-before($key_change, '_')"/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="CamelCase">
					<xsl:with-param name="key_change" select="substring-after($key_change, '_')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="CamelCaseWord">
					<xsl:with-param name="key_change" select="$key_change"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="CamelCaseWord">
		<!--THIS TEMPLATE CHANGE KEY TO MAKE IT INTO A PROPER NAME WITH MAJ AND WITHOUT "_"-->
		<xsl:param name="key_change"/>
		<xsl:value-of
			select="translate(substring($key_change, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		<xsl:value-of
			select="translate(substring($key_change, 2, string-length($key_change) - 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
		/>
	</xsl:template>
	
	<!--cf : https://askcodez.com/convertir-le-premier-caractere-de-chaque-mot-en-majuscule.html
		version, plus proche de l'originale pour les placeName utilisant ' ' et pas '_'-->
	<xsl:template name="CamelCase_space">
		<xsl:param name="name_change"/>
		<xsl:choose>
			<xsl:when test="contains($name_change, ' ')">
				<xsl:call-template name="CamelCaseWord_space">
					<xsl:with-param name="name_change" select="substring-before($name_change, ' ')"
					/>
				</xsl:call-template>
				<xsl:text> </xsl:text>
				<xsl:call-template name="CamelCase_space">
					<xsl:with-param name="name_change" select="substring-after($name_change, ' ')"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="CamelCaseWord_space">
					<xsl:with-param name="name_change" select="$name_change"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	<xsl:template name="CamelCaseWord_space">
		<xsl:param name="name_change"/>
		<xsl:value-of
			select="translate(substring($name_change, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
		<xsl:value-of
			select="translate(substring($name_change, 2, string-length($name_change) - 1), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"
		/>
	</xsl:template>
	
	

	
	<xsl:template name="persname_link">
		<xsl:param name="ref"/>
<!--		THIS TEMPLATE GENERATES LINKS DEPENDING ON @ref -->
		<xsl:variable name="cced" select="'https://theclergydatabase.org.uk/jsp/persons/DisplayPerson.jsp?PersonID='"/>
		<ul class="links_inline">
	<xsl:choose>
		<!--<xsl:when test="@ref = ('x')or()"><!-\-Lorsque @ref est vide on écrit "-"-\->
			<xsl:text>-</xsl:text>
		</xsl:when>-->
		<xsl:when test="not(number(@ref))">
			<xsl:analyze-string select="@ref" regex="\s\d+">
				<xsl:matching-substring>
					<!--<a href="{substring-before(.,' ')}"> Oxford DNB </a>-->
					<li><a href="{concat($cced, substring-after(.,' '))}">CCED</a></li>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<xsl:analyze-string select="." regex="https://theclergydatabase.org.uk/jsp/bishops/DisplayBishop.jsp\?ordTenID=\d+">
						<xsl:matching-substring>
							<li><a href="{.}">CCED</a></li>
						</xsl:matching-substring>
						<xsl:non-matching-substring>
							<li><a href="{.}">Oxford DNB</a></li>
						</xsl:non-matching-substring>
					</xsl:analyze-string>
					<!--<a href="{.}"> Oxford DNB </a>--></xsl:non-matching-substring>
			</xsl:analyze-string>
			<!--<xsl:analyze-string select="@ref" regex="bishops">
				<xsl:matching-substring>
					<a href="{substring-before(.,' ')}"> CCED </a>
				</xsl:matching-substring>
				<xsl:non-matching-substring>
					<a href="{substring-after(.,' ')}"> Oxford DNB </a>
				</xsl:non-matching-substring>
			</xsl:analyze-string>-->
		</xsl:when>
		<xsl:otherwise>
			<li><a href="{concat($cced, @ref)}">CCED</a></li>
		</xsl:otherwise>
	</xsl:choose>
		</ul>
</xsl:template>
</xsl:stylesheet>
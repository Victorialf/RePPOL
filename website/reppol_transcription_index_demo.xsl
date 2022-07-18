<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="2.0">
	<xsl:output method="html" indent="yes" encoding="UTF-8"
		doctype-public="-//W3C//DTD HTML 4.01//EN"/>

	<!--	déclaration variable pour RESULTS-DOC-->
	<xsl:variable name="basename">reppol</xsl:variable>
	<xsl:variable name="home" select="concat($basename, '_home', '.html')"/>
	<xsl:variable name="about" select="concat($basename, '_about', '.html')"/>
	<xsl:variable name="legals" select="concat($basename, '_legals.html')"/>
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
			<link rel="icon" type="image/jpg" href="logo_reppol-noir-rouge.png"/>
			<!--LINK ICI-->
			<link rel="stylesheet" href="reppol.css" type="text/css"/>
			<!--LINK ICI-->
			<title>RePPOL - <xsl:value-of select="$title"/></title>
		</head>
	</xsl:template>
	<!--	template pour HEADER-->
	<xsl:template name="header">
		<header id="top">
			<div class="logo">
				<a href="{$home}">
					<img src="logo_reppol-noir-rouge.png" class="logo"/>
				</a>
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
					<li>Index <ul class="nav_index">
							<li><a href="{$index_characters}">Persons</a></li>
							<li><a href="{$index_places}">Places</a></li>
							<li><a href="{$index_dates}">Dates</a></li>
						</ul>
					</li>
					<li>
						<a href="{$legals}">Legals</a>
					</li>
				</ul>
			</nav>
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
		</script>
		<a href="#top">
			<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png" class="top"
			/>
		</a>
	</xsl:template>
	<!--	template pour FOOTER-->
	<xsl:template name="footer">
		<footer>
			<div class="footer_icons">
				<div class="footer_logo">
					<a href="http://www.isite-ulne.fr/index.php/fr/page-daccueil/" target="blanck">
						<img
							src="http://www.isite-ulne.fr/wp-content/uploads/2018/07/I-SITE-ULNE_Logo-COUL_RVB.png"
						/>
					</a>
				</div>
				<div class="footer_logo">
					<a href="https://comod.universite-lyon.fr/site-francais/" target="blanck">
						<!--<img src="https://comod.universite-lyon.fr/medias/photo/labex-comod-noir-png-300dpi-sans-fond-blanc_1551950983580-png?ID_FICHE=41153"/>-->
						<img
							src="https://comod.universite-lyon.fr/medias/photo/labex-comod-png-300dpi-sans-fond-blanc_1551950869031-png?ID_FICHE=41153"
						/>
					</a>
				</div>
				<div class="footer_logo">
					<a href="https://www.univ-lille.fr/" target="blanck">
						<!--<img src="ULille.sans.baseline-Horizontal-CMJN-Noir.png"/>-->
						<img
							src="https://www.univ-lille.fr/typo3conf/ext/ul2fpfb/Resources/Public/assets/img/logos/ULille-nb.svg"
						/>
					</a>
				</div>
				<div class="footer_logo">
					<a href="https://www.meshs.fr/page/accueil" target="blanck">
						<img
							src="http://medias.meshs.fr/medias/images/logos/meshs/MESHS_Logo_NoirRouge_Sans.png"/>
						<!--<img src="http://medias.meshs.fr/medias/images/logos/meshs/MESHS_Logo_NoirGris_Sans.png"/>-->
					</a>
				</div>
				<div class="footer_logo">
					<a href="https://cecille.univ-lille.fr/" target="blanck">
						<img src="http://gis-religions.fr/images/logos/labos/GIS-LOGO-CECILLE.jpg"/>
					</a>
				</div>
				<div class="footer_logo">
					<a href="http://larhra.ish-lyon.cnrs.fr/" target="blanck">
						<img
							src="https://halshs.archives-ouvertes.fr/LARHRA/public/logo_larhra_fond_blanc.jpg"
						/>
					</a>
				</div>
			</div>
			<div class="footer_legal"> Ce site et les transcriptions réalisées dans le cadre du
				projet RePPOL sont mis à disposition selon les termes de la <a rel="license"
					href="http://creativecommons.org/licenses/by/4.0/">Licence Creative Commons
					Attribution 4.0 International</a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img
						alt="Licence Creative Commons" style="border-width:0; margin:10px;"
						src="https://creativecommons.org/images/chooser/chooser_cc.png" height="50%"
						/><img alt="Licence Creative Commons" style="border-width:0; margin:10px;"
						src="https://creativecommons.org/images/chooser/chooser_by.png" height="50%"
					/></a>
				<p>More documentation on <a href="https://github.com/Victorialf/RePPOL"
						target="blanck">Github</a></p>
			</div>
		</footer>
	</xsl:template>

	<xsl:template match="/">
		<!--		PAGE INDEX CHARACTERS-->
		<xsl:result-document href="{$index_characters}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'character index'"/>
				</xsl:call-template>
				<body style="background-color:#f26339;">
					<div class="article_container">
						<xsl:call-template name="header"/>
						<article>
							<section class="index">
								<h2>Person index :</h2>
								<ul>
									<xsl:apply-templates select="//tei:persName"
										mode="index_prelist">
										<xsl:sort select="@key"/>
									</xsl:apply-templates>
								</ul>
								<xsl:apply-templates select="//tei:persName" mode="index">
									<xsl:sort select="@key"/>
								</xsl:apply-templates>
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
				<body style="background-color:#f26339;">
					<div class="article_container">
						<xsl:call-template name="header"/>
						<article style="display:flex;">
							<section style="width:50%;">
								<img class="index_map" src=""/>
							</section>
							<section class="index">
								<!--<h2>Place index :</h2>-->
								<h3>Counties</h3>
								<ul class="index">
									<xsl:apply-templates select="//tei:placeName[@type = 'county']"
										mode="index">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
								</ul>
								<h3>Cities</h3>
								<ul class="index">
									<xsl:apply-templates select="//tei:placeName[@type = 'city']"
										mode="index">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
								</ul>
								<h3>Parishes</h3>
								<ul class="index">
									<xsl:apply-templates select="//tei:placeName[@type = 'parish']"
										mode="index">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
								</ul>
								<h3>Villages</h3>
								<ul class="index">
									<xsl:apply-templates
										select="//tei:placeName[@type = 'settlement']" mode="index">
										<xsl:sort select="lower-case(.)"/>
									</xsl:apply-templates>
								</ul>
							</section>
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
				<body style="background-color:#f26339;">
					<div class="article_container">
						<xsl:call-template name="header"/>
						<article class="date_index">
							<section class="calendar">
								<h2>Pick a date :</h2>
								<xsl:call-template name="calendar"/>
							</section>
							<section class="index">
								<h2>Date index :</h2>
								<xsl:apply-templates select="//tei:date[ancestor::tei:body]"
									mode="index">
									<xsl:sort select="@when"/>
								</xsl:apply-templates>
							</section>
						</article>
					</div>
					<xsl:call-template name="script"/>
					<!--					<xsl:call-template name="footer"/>-->
				</body>
			</html>
		</xsl:result-document>
		<!--PAGE : SELECTEUR TRANSCRIPTION-->
		<xsl:result-document href="{concat($transcriptions, '.html')}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'transcriptions'"/>
				</xsl:call-template>
				<body style="background-color:#f26339;">
					<div class="article_container">
						<xsl:call-template name="header"/>
						<article class="fac_selector">
							<xsl:for-each select="//tei:surface">
								<xsl:variable name="facs" select="concat('#', @xml:id)"/>
								<div class="fac_selector">

									<img src="{descendant::tei:graphic/@url}"/>

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
							<xsl:call-template name="header"/>
							<article class="transcription">
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
											select="//tei:div[@type = 'page'][child::tei:pb[@facs = $facs]]"
											mode="text"/>
									</div>


										<!--<div style="width:100%; clear:both; height:60px;"/>
										<!-\-cheatcode pour démo-\->-->

								</section>
								<section id="calendar" class="transcript">

									<xsl:variable name="facs" select="@xml:id"/>
									<xsl:variable name="startid">#</xsl:variable>
										<div id="facspage">
											<xsl:element name="img">
												<xsl:attribute name="class">facspage</xsl:attribute>
												<xsl:attribute name="src">
												<xsl:value-of
												select="//tei:surface[@start = (concat($startid, $facs))]/tei:graphic/@url"
												/>
												</xsl:attribute>
											</xsl:element>
										</div>
										<div id="text">
												<button onclick="reppol_t();" class="t_nav">Transcription RePPOL</button>
												<button onclick="calendar_t();" class="t_nav active">Transcription Calendar</button>
											
											<xsl:choose>
												<xsl:when test="//tei:div/tei:pb[@corresp = $facs]">
												<xsl:apply-templates
												select="//tei:div[@type = 'page_calendar'][child::tei:pb[@corresp = $facs]]"
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
	<xsl:template match="tei:head" mode="text">
		<p class="{local-name()} {@rend}">
			<!--				ajout d'une classe pour @rend lorsqu'il y a lieu-->
			<xsl:apply-templates/>
		</p>
	</xsl:template>
	<!--	template qui se charge de créer des div pour les sous-sections d'une section (uniquement dans le cas des @type=articles-->
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
				test="(descendant::tei:list[@rend = 'main_left']) and (descendant::tei:list[@rend = 'main_right'])">
				<!--					cas où : LIST à GAUCHE ET LIST à DROITE-->
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
				test="(descendant::tei:list[@rend = 'main_left']) or (descendant::tei:list[@rend = 'main_right'])">
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
			<xsl:otherwise>
				<p>JE NE SUIS PAS CONFIGURÉ POUR CE CAS DE FIGURE, VOIR XSLT</p>
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
						<xsl:attribute name="style">color:#1c481f; font-size:18pt;</xsl:attribute>
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
				</xsl:element>
			</li>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:persName" mode="index">
		<xsl:variable name="base_uri"
			select="'https://theclergydatabase.org.uk/jsp/persons/DisplayPerson.jsp?PersonID='"/>
		<xsl:variable name="ref" select="@ref"/>
		<xsl:variable name="key" select="@key"/>
		<xsl:if test="not(preceding::tei:persName[@key = $key])">
			<div class="index_unit">

				<h6 id="{generate-id()}">
					<xsl:call-template name="CamelCase">
						<!--cf : https://askcodez.com/convertir-le-premier-caractere-de-chaque-mot-en-majuscule.html-->
						<xsl:with-param name="key_change">
							<xsl:value-of select="@key"/>
						</xsl:with-param>
					</xsl:call-template>
				</h6>
				<p>Functions : <xsl:value-of select="@type"/>, <xsl:value-of
						select="descendant::tei:roleName/@type"/></p>
				<p>Mentioned :</p>
				<ul>
					<xsl:apply-templates select=". | following::tei:persName[@key = $key]"
						mode="sub_index"/>
				</ul>
				<p>Link : <xsl:choose>
						<xsl:when test="@ref = 'x'">
							<xsl:text>-</xsl:text>
						</xsl:when>
						<xsl:when test="not(number(@ref))">
							<a href="{@ref}"> Oxford DNB </a>
						</xsl:when>
						<xsl:otherwise>
							<a href="{concat($base_uri, @ref)}"> CCED </a>
						</xsl:otherwise>
					</xsl:choose>
				</p>
				<!--dans l'idéal tester la nature du @ref, le début du @ref pour cced la suite pour DNB-->
				<!--				<a href=""></a>-->
				<a href="#top">
					<img src="https://upload.wikimedia.org/wikipedia/commons/8/87/Arrow_top.png"
						class="top"
						style="position:absolute; bottom:0; right:0; z-index:99; padding:5px; width:30px;"
					/>
				</a>
			</div>
		</xsl:if>
	</xsl:template>
	<xsl:template match="tei:persName" mode="sub_index">
		<li><xsl:text>"</xsl:text><xsl:apply-templates/><xsl:text>"</xsl:text>: p.<a
				href="{concat($transcriptions, preceding::tei:pb[1]/@n, '.html')}"><xsl:value-of
					select="preceding::tei:pb[1]/@n"/></a></li>
		<!-- ajouter un link ici générer automatiquement vers la page concernée ? -->
	</xsl:template>

	<!--cf : https://askcodez.com/convertir-le-premier-caractere-de-chaque-mot-en-majuscule.html-->
	<xsl:template name="CamelCase">
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


	<xsl:template match="tei:placeName" mode="index">
		<xsl:variable name="ref_base" select="'https://www.openstreetmap.org/search?query='"/>
		<xsl:variable name="ref" select="@ref"/>
		<xsl:choose>
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
		</xsl:choose>
	</xsl:template>


	<xsl:template name="calendar">
		<div class="c_tabs">
			<div class="tabs_nav">
				<button class="c_tabs_b active_tab" onclick="tabsAnimation(event, '1540')"
					>1540</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, '1541')">1541</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, '1542')">1542</button>
				<button class="c_tabs_b" onclick="tabsAnimation(event, '1543')">1543</button>
			</div>
			<div id="1540" class="tabs_content active_tabs_content">
<!--				<h3>1540</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-01">January</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-01-01">1</a>
							</td>
							<td>
								<a href="#1540-01-02">2</a>
							</td>
							<td>
								<a href="#1540-01-03">3</a>
							</td>
							<td>
								<a href="#1540-01-04">4</a>
							</td>
							<td>
								<a href="#1540-01-05">5</a>
							</td>
							<td>
								<a href="#1540-01-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-01-07">7</a>
							</td>
							<td>
								<a href="#1540-01-08">8</a>
							</td>
							<td>
								<a href="#1540-01-09">9</a>
							</td>
							<td>
								<a href="#1540-01-10">10</a>
							</td>
							<td>
								<a href="#1540-01-11">11</a>
							</td>
							<td>
								<a href="#1540-01-12">12</a>
							</td>
							<td>
								<a href="#1540-01-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-01-14">14</a>
							</td>
							<td>
								<a href="#1540-01-15">15</a>
							</td>
							<td>
								<a href="#1540-01-16">16</a>
							</td>
							<td>
								<a href="#1540-01-17">17</a>
							</td>
							<td>
								<a href="#1540-01-18">18</a>
							</td>
							<td>
								<a href="#1540-01-19">19</a>
							</td>
							<td>
								<a href="#1540-01-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-01-21">21</a>
							</td>
							<td>
								<a href="#1540-01-22">22</a>
							</td>
							<td>
								<a href="#1540-01-23">23</a>
							</td>
							<td>
								<a href="#1540-01-24">24</a>
							</td>
							<td>
								<a href="#1540-01-25">25</a>
							</td>
							<td>
								<a href="#1540-01-26">26</a>
							</td>
							<td>
								<a href="#1540-01-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-01-28">28</a>
							</td>
							<td>
								<a href="#1540-01-29">29</a>
							</td>
							<td>
								<a href="#1540-01-30">30</a>
							</td>
							<td>
								<a href="#1540-01-31">31</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-02">February</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-02-01">1</a>
							</td>
							<td>
								<a href="#1540-02-02">2</a>
							</td>
							<td>
								<a href="#1540-02-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-02-04">4</a>
							</td>
							<td>
								<a href="#1540-02-05">5</a>
							</td>
							<td>
								<a href="#1540-02-06">6</a>
							</td>
							<td>
								<a href="#1540-02-07">7</a>
							</td>
							<td>
								<a href="#1540-02-08">8</a>
							</td>
							<td>
								<a href="#1540-02-09">9</a>
							</td>
							<td>
								<a href="#1540-02-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-02-11">11</a>
							</td>
							<td>
								<a href="#1540-02-12">12</a>
							</td>
							<td>
								<a href="#1540-02-13">13</a>
							</td>
							<td>
								<a href="#1540-02-14">14</a>
							</td>
							<td>
								<a href="#1540-02-15">15</a>
							</td>
							<td>
								<a href="#1540-02-16">16</a>
							</td>
							<td>
								<a href="#1540-02-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-02-18">18</a>
							</td>
							<td>
								<a href="#1540-02-19">19</a>
							</td>
							<td>
								<a href="#1540-02-20">20</a>
							</td>
							<td>
								<a href="#1540-02-21">21</a>
							</td>
							<td>
								<a href="#1540-02-22">22</a>
							</td>
							<td>
								<a href="#1540-02-23">23</a>
							</td>
							<td>
								<a href="#1540-02-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-02-25">25</a>
							</td>
							<td>
								<a href="#1540-02-26">26</a>
							</td>
							<td>
								<a href="#1540-02-27">27</a>
							</td>
							<td>
								<a href="#1540-02-28">28</a>
							</td>
							<td>
								<a href="#1540-02-29">29</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-03">March</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-03-01">1</a>
							</td>
							<td>
								<a href="#1540-03-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-03-03">3</a>
							</td>
							<td>
								<a href="#1540-03-04">4</a>
							</td>
							<td>
								<a href="#1540-03-05">5</a>
							</td>
							<td>
								<a href="#1540-03-06">6</a>
							</td>
							<td>
								<a href="#1540-03-07">7</a>
							</td>
							<td>
								<a href="#1540-03-08">8</a>
							</td>
							<td>
								<a href="#1540-03-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-03-10">10</a>
							</td>
							<td>
								<a href="#1540-03-11">11</a>
							</td>
							<td>
								<a href="#1540-03-12">12</a>
							</td>
							<td>
								<a href="#1540-03-13">13</a>
							</td>
							<td>
								<a href="#1540-03-14">14</a>
							</td>
							<td>
								<a href="#1540-03-15">15</a>
							</td>
							<td>
								<a href="#1540-03-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-03-17">17</a>
							</td>
							<td>
								<a href="#1540-03-18">18</a>
							</td>
							<td>
								<a href="#1540-03-19">19</a>
							</td>
							<td>
								<a href="#1540-03-20">20</a>
							</td>
							<td>
								<a href="#1540-03-21">21</a>
							</td>
							<td>
								<a href="#1540-03-22">22</a>
							</td>
							<td>
								<a href="#1540-03-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-03-24">24</a>
							</td>
							<td>
								<a href="#1540-03-25">25</a>
							</td>
							<td>
								<a href="#1540-03-26">26</a>
							</td>
							<td>
								<a href="#1540-03-27">27</a>
							</td>
							<td>
								<a href="#1540-03-28">28</a>
							</td>
							<td>
								<a href="#1540-03-29">29</a>
							</td>
							<td>
								<a href="#1540-03-30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-03-31">31</a>
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
								<a href="#1540-04">April</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-04-01">1</a>
							</td>
							<td>
								<a href="#1540-04-02">2</a>
							</td>
							<td>
								<a href="#1540-04-03">3</a>
							</td>
							<td>
								<a href="#1540-04-04">4</a>
							</td>
							<td>
								<a href="#1540-04-05">5</a>
							</td>
							<td>
								<a href="#1540-04-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-04-07">7</a>
							</td>
							<td>
								<a href="#1540-04-08">8</a>
							</td>
							<td>
								<a href="#1540-04-09">9</a>
							</td>
							<td>
								<a href="#1540-04-10">10</a>
							</td>
							<td>
								<a href="#1540-04-11">11</a>
							</td>
							<td>
								<a href="#1540-04-12">12</a>
							</td>
							<td>
								<a href="#1540-04-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-04-14">14</a>
							</td>
							<td>
								<a href="#1540-04-15">15</a>
							</td>
							<td>
								<a href="#1540-04-16">16</a>
							</td>
							<td>
								<a href="#1540-04-17">17</a>
							</td>
							<td>
								<a href="#1540-04-18">18</a>
							</td>
							<td>
								<a href="#1540-04-19">19</a>
							</td>
							<td>
								<a href="#1540-04-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-04-21">21</a>
							</td>
							<td>
								<a href="#1540-04-22">22</a>
							</td>
							<td>
								<a href="#1540-04-23">23</a>
							</td>
							<td>
								<a href="#1540-04-24">24</a>
							</td>
							<td>
								<a href="#1540-04-25">25</a>
							</td>
							<td>
								<a href="#1540-04-26">26</a>
							</td>
							<td>
								<a href="#1540-04-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-04-28">28</a>
							</td>
							<td>
								<a href="#1540-04-29">29</a>
							</td>
							<td>
								<a href="#1540-04-30">30</a>
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
								<a href="#1540-05">May</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-05-01">1</a>
							</td>
							<td>
								<a href="#1540-05-02">2</a>
							</td>
							<td>
								<a href="#1540-05-03">3</a>
							</td>
							<td>
								<a href="#1540-05-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-05-05">5</a>
							</td>
							<td>
								<a href="#1540-05-06">6</a>
							</td>
							<td>
								<a href="#1540-05-07">7</a>
							</td>
							<td>
								<a href="#1540-05-08">8</a>
							</td>
							<td>
								<a href="#1540-05-09">9</a>
							</td>
							<td>
								<a href="#1540-05-10">10</a>
							</td>
							<td>
								<a href="#1540-05-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-05-12">12</a>
							</td>
							<td>
								<a href="#1540-05-13">13</a>
							</td>
							<td>
								<a href="#1540-05-14">14</a>
							</td>
							<td>
								<a href="#1540-05-15">15</a>
							</td>
							<td>
								<a href="#1540-05-16">16</a>
							</td>
							<td>
								<a href="#1540-05-17">17</a>
							</td>
							<td>
								<a href="#1540-05-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-05-19">19</a>
							</td>
							<td>
								<a href="#1540-05-20">20</a>
							</td>
							<td>
								<a href="#1540-05-21">21</a>
							</td>
							<td>
								<a href="#1540-05-22">22</a>
							</td>
							<td>
								<a href="#1540-05-23">23</a>
							</td>
							<td>
								<a href="#1540-05-24">24</a>
							</td>
							<td>
								<a href="#1540-05-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-05-26">26</a>
							</td>
							<td>
								<a href="#1540-05-27">27</a>
							</td>
							<td>
								<a href="#1540-05-28">28</a>
							</td>
							<td>
								<a href="#1540-05-29">29</a>
							</td>
							<td>
								<a href="#1540-05-30">30</a>
							</td>
							<td>
								<a href="#1540-05-31">31</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-06">June</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-06-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-06-02">2</a>
							</td>
							<td>
								<a href="#1540-06-03">3</a>
							</td>
							<td>
								<a href="#1540-06-04">4</a>
							</td>
							<td>
								<a href="#1540-06-05">5</a>
							</td>
							<td>
								<a href="#1540-06-06">6</a>
							</td>
							<td>
								<a href="#1540-06-07">7</a>
							</td>
							<td>
								<a href="#1540-06-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-06-09">9</a>
							</td>
							<td>
								<a href="#1540-06-10">10</a>
							</td>
							<td>
								<a href="#1540-06-11">11</a>
							</td>
							<td>
								<a href="#1540-06-12">12</a>
							</td>
							<td>
								<a href="#1540-06-13">13</a>
							</td>
							<td>
								<a href="#1540-06-14">14</a>
							</td>
							<td>
								<a href="#1540-06-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-06-16">16</a>
							</td>
							<td>
								<a href="#1540-06-17">17</a>
							</td>
							<td>
								<a href="#1540-06-18">18</a>
							</td>
							<td>
								<a href="#1540-06-19">19</a>
							</td>
							<td>
								<a href="#1540-06-20">20</a>
							</td>
							<td>
								<a href="#1540-06-21">21</a>
							</td>
							<td>
								<a href="#1540-06-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-06-23">23</a>
							</td>
							<td>
								<a href="#1540-06-24">24</a>
							</td>
							<td>
								<a href="#1540-06-25">25</a>
							</td>
							<td>
								<a href="#1540-06-26">26</a>
							</td>
							<td>
								<a href="#1540-06-27">27</a>
							</td>
							<td>
								<a href="#1540-06-28">28</a>
							</td>
							<td>
								<a href="#1540-06-29">29</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-06-30">30</a>
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
								<a href="#1540-07">July</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-07-01">1</a>
							</td>
							<td>
								<a href="#1540-07-02">2</a>
							</td>
							<td>
								<a href="#1540-07-03">3</a>
							</td>
							<td>
								<a href="#1540-07-04">4</a>
							</td>
							<td>
								<a href="#1540-07-05">5</a>
							</td>
							<td>
								<a href="#1540-07-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-07-07">7</a>
							</td>
							<td>
								<a href="#1540-07-08">8</a>
							</td>
							<td>
								<a href="#1540-07-09">9</a>
							</td>
							<td>
								<a href="#1540-07-10">10</a>
							</td>
							<td>
								<a href="#1540-07-11">11</a>
							</td>
							<td>
								<a href="#1540-07-12">12</a>
							</td>
							<td>
								<a href="#1540-07-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-07-14">14</a>
							</td>
							<td>
								<a href="#1540-07-15">15</a>
							</td>
							<td>
								<a href="#1540-07-16">16</a>
							</td>
							<td>
								<a href="#1540-07-17">17</a>
							</td>
							<td>
								<a href="#1540-07-18">18</a>
							</td>
							<td>
								<a href="#1540-07-19">19</a>
							</td>
							<td>
								<a href="#1540-07-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-07-21">21</a>
							</td>
							<td>
								<a href="#1540-07-22">22</a>
							</td>
							<td>
								<a href="#1540-07-23">23</a>
							</td>
							<td>
								<a href="#1540-07-24">24</a>
							</td>
							<td>
								<a href="#1540-07-25">25</a>
							</td>
							<td>
								<a href="#1540-07-26">26</a>
							</td>
							<td>
								<a href="#1540-07-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-07-28">28</a>
							</td>
							<td>
								<a href="#1540-07-29">29</a>
							</td>
							<td>
								<a href="#1540-07-30">30</a>
							</td>
							<td>
								<a href="#1540-07-31">31</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-08">August</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-08-01">1</a>
							</td>
							<td>
								<a href="#1540-08-02">2</a>
							</td>
							<td>
								<a href="#1540-08-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-08-04">4</a>
							</td>
							<td>
								<a href="#1540-08-05">5</a>
							</td>
							<td>
								<a href="#1540-08-06">6</a>
							</td>
							<td>
								<a href="#1540-08-07">7</a>
							</td>
							<td>
								<a href="#1540-08-08">8</a>
							</td>
							<td>
								<a href="#1540-08-09">9</a>
							</td>
							<td>
								<a href="#1540-08-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-08-11">11</a>
							</td>
							<td>
								<a href="#1540-08-12">12</a>
							</td>
							<td>
								<a href="#1540-08-13">13</a>
							</td>
							<td>
								<a href="#1540-08-14">14</a>
							</td>
							<td>
								<a href="#1540-08-15">15</a>
							</td>
							<td>
								<a href="#1540-08-16">16</a>
							</td>
							<td>
								<a href="#1540-08-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-08-18">18</a>
							</td>
							<td>
								<a href="#1540-08-19">19</a>
							</td>
							<td>
								<a href="#1540-08-20">20</a>
							</td>
							<td>
								<a href="#1540-08-21">21</a>
							</td>
							<td>
								<a href="#1540-08-22">22</a>
							</td>
							<td>
								<a href="#1540-08-23">23</a>
							</td>
							<td>
								<a href="#1540-08-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-08-25">25</a>
							</td>
							<td>
								<a href="#1540-08-26">26</a>
							</td>
							<td>
								<a href="#1540-08-27">27</a>
							</td>
							<td>
								<a href="#1540-08-28">28</a>
							</td>
							<td>
								<a href="#1540-08-29">29</a>
							</td>
							<td>
								<a href="#1540-08-30">30</a>
							</td>
							<td>
								<a href="#1540-08-31">31</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-09">September</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-09-01">1</a>
							</td>
							<td>
								<a href="#1540-09-02">2</a>
							</td>
							<td>
								<a href="#1540-09-03">3</a>
							</td>
							<td>
								<a href="#1540-09-04">4</a>
							</td>
							<td>
								<a href="#1540-09-05">5</a>
							</td>
							<td>
								<a href="#1540-09-06">6</a>
							</td>
							<td>
								<a href="#1540-09-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-09-08">8</a>
							</td>
							<td>
								<a href="#1540-09-09">9</a>
							</td>
							<td>
								<a href="#1540-09-10">10</a>
							</td>
							<td>
								<a href="#1540-09-11">11</a>
							</td>
							<td>
								<a href="#1540-09-12">12</a>
							</td>
							<td>
								<a href="#1540-09-13">13</a>
							</td>
							<td>
								<a href="#1540-09-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-09-15">15</a>
							</td>
							<td>
								<a href="#1540-09-16">16</a>
							</td>
							<td>
								<a href="#1540-09-17">17</a>
							</td>
							<td>
								<a href="#1540-09-18">18</a>
							</td>
							<td>
								<a href="#1540-09-19">19</a>
							</td>
							<td>
								<a href="#1540-09-20">20</a>
							</td>
							<td>
								<a href="#1540-09-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-09-22">22</a>
							</td>
							<td>
								<a href="#1540-09-23">23</a>
							</td>
							<td>
								<a href="#1540-09-24">24</a>
							</td>
							<td>
								<a href="#1540-09-25">25</a>
							</td>
							<td>
								<a href="#1540-09-26">26</a>
							</td>
							<td>
								<a href="#1540-09-27">27</a>
							</td>
							<td>
								<a href="#1540-09-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-09-29">29</a>
							</td>
							<td>
								<a href="#1540-09-30">30</a>
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
								<a href="#1540-10">October</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-10-01">1</a>
							</td>
							<td>
								<a href="#1540-10-02">2</a>
							</td>
							<td>
								<a href="#1540-10-03">3</a>
							</td>
							<td>
								<a href="#1540-10-04">4</a>
							</td>
							<td>
								<a href="#1540-10-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-10-06">6</a>
							</td>
							<td>
								<a href="#1540-10-07">7</a>
							</td>
							<td>
								<a href="#1540-10-08">8</a>
							</td>
							<td>
								<a href="#1540-10-09">9</a>
							</td>
							<td>
								<a href="#1540-10-10">10</a>
							</td>
							<td>
								<a href="#1540-10-11">11</a>
							</td>
							<td>
								<a href="#1540-10-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-10-13">13</a>
							</td>
							<td>
								<a href="#1540-10-14">14</a>
							</td>
							<td>
								<a href="#1540-10-15">15</a>
							</td>
							<td>
								<a href="#1540-10-16">16</a>
							</td>
							<td>
								<a href="#1540-10-17">17</a>
							</td>
							<td>
								<a href="#1540-10-18">18</a>
							</td>
							<td>
								<a href="#1540-10-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-10-20">20</a>
							</td>
							<td>
								<a href="#1540-10-21">21</a>
							</td>
							<td>
								<a href="#1540-10-22">22</a>
							</td>
							<td>
								<a href="#1540-10-23">23</a>
							</td>
							<td>
								<a href="#1540-10-24">24</a>
							</td>
							<td>
								<a href="#1540-10-25">25</a>
							</td>
							<td>
								<a href="#1540-10-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-10-27">27</a>
							</td>
							<td>
								<a href="#1540-10-28">28</a>
							</td>
							<td>
								<a href="#1540-10-29">29</a>
							</td>
							<td>
								<a href="#1540-10-30">30</a>
							</td>
							<td>
								<a href="#1540-10-31">31</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-11">November</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-11-01">1</a>
							</td>
							<td>
								<a href="#1540-11-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-11-03">3</a>
							</td>
							<td>
								<a href="#1540-11-04">4</a>
							</td>
							<td>
								<a href="#1540-11-05">5</a>
							</td>
							<td>
								<a href="#1540-11-06">6</a>
							</td>
							<td>
								<a href="#1540-11-07">7</a>
							</td>
							<td>
								<a href="#1540-11-08">8</a>
							</td>
							<td>
								<a href="#1540-11-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-11-10">10</a>
							</td>
							<td>
								<a href="#1540-11-11">11</a>
							</td>
							<td>
								<a href="#1540-11-12">12</a>
							</td>
							<td>
								<a href="#1540-11-13">13</a>
							</td>
							<td>
								<a href="#1540-11-14">14</a>
							</td>
							<td>
								<a href="#1540-11-15">15</a>
							</td>
							<td>
								<a href="#1540-11-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-11-17">17</a>
							</td>
							<td>
								<a href="#1540-11-18">18</a>
							</td>
							<td>
								<a href="#1540-11-19">19</a>
							</td>
							<td>
								<a href="#1540-11-20">20</a>
							</td>
							<td>
								<a href="#1540-11-21">21</a>
							</td>
							<td>
								<a href="#1540-11-22">22</a>
							</td>
							<td>
								<a href="#1540-11-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-11-24">24</a>
							</td>
							<td>
								<a href="#1540-11-25">25</a>
							</td>
							<td>
								<a href="#1540-11-26">26</a>
							</td>
							<td>
								<a href="#1540-11-27">27</a>
							</td>
							<td>
								<a href="#1540-11-28">28</a>
							</td>
							<td>
								<a href="#1540-11-29">29</a>
							</td>
							<td>
								<a href="#1540-11-30">30</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1540-12">December</a>
							</td>
							<td colspan="2">
								<a href="#1540">1540</a>
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
								<a href="#1540-12-01">1</a>
							</td>
							<td>
								<a href="#1540-12-02">2</a>
							</td>
							<td>
								<a href="#1540-12-03">3</a>
							</td>
							<td>
								<a href="#1540-12-04">4</a>
							</td>
							<td>
								<a href="#1540-12-05">5</a>
							</td>
							<td>
								<a href="#1540-12-06">6</a>
							</td>
							<td>
								<a href="#1540-12-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-12-08">8</a>
							</td>
							<td>
								<a href="#1540-12-09">9</a>
							</td>
							<td>
								<a href="#1540-12-10">10</a>
							</td>
							<td>
								<a href="#1540-12-11">11</a>
							</td>
							<td>
								<a href="#1540-12-12">12</a>
							</td>
							<td>
								<a href="#1540-12-13">13</a>
							</td>
							<td>
								<a href="#1540-12-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-12-15">15</a>
							</td>
							<td>
								<a href="#1540-12-16">16</a>
							</td>
							<td>
								<a href="#1540-12-17">17</a>
							</td>
							<td>
								<a href="#1540-12-18">18</a>
							</td>
							<td>
								<a href="#1540-12-19">19</a>
							</td>
							<td>
								<a href="#1540-12-20">20</a>
							</td>
							<td>
								<a href="#1540-12-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-12-22">22</a>
							</td>
							<td>
								<a href="#1540-12-23">23</a>
							</td>
							<td>
								<a href="#1540-12-24">24</a>
							</td>
							<td>
								<a href="#1540-12-25">25</a>
							</td>
							<td>
								<a href="#1540-12-26">26</a>
							</td>
							<td>
								<a href="#1540-12-27">27</a>
							</td>
							<td>
								<a href="#1540-12-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1540-12-29">29</a>
							</td>
							<td>
								<a href="#1540-12-30">30</a>
							</td>
							<td>
								<a href="#1540-12-31">31</a>
							</td>
							<td/>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="1541" class="tabs_content">
<!--				<h3>1541</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-01">January</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-01-01">1</a>
							</td>
							<td>
								<a href="#1541-01-02">2</a>
							</td>
							<td>
								<a href="#1541-01-03">3</a>
							</td>
							<td>
								<a href="#1541-01-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-01-05">5</a>
							</td>
							<td>
								<a href="#1541-01-06">6</a>
							</td>
							<td>
								<a href="#1541-01-07">7</a>
							</td>
							<td>
								<a href="#1541-01-08">8</a>
							</td>
							<td>
								<a href="#1541-01-09">9</a>
							</td>
							<td>
								<a href="#1541-01-10">10</a>
							</td>
							<td>
								<a href="#1541-01-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-01-12">12</a>
							</td>
							<td>
								<a href="#1541-01-13">13</a>
							</td>
							<td>
								<a href="#1541-01-14">14</a>
							</td>
							<td>
								<a href="#1541-01-15">15</a>
							</td>
							<td>
								<a href="#1541-01-16">16</a>
							</td>
							<td>
								<a href="#1541-01-17">17</a>
							</td>
							<td>
								<a href="#1541-01-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-01-19">19</a>
							</td>
							<td>
								<a href="#1541-01-20">20</a>
							</td>
							<td>
								<a href="#1541-01-21">21</a>
							</td>
							<td>
								<a href="#1541-01-22">22</a>
							</td>
							<td>
								<a href="#1541-01-23">23</a>
							</td>
							<td>
								<a href="#1541-01-24">24</a>
							</td>
							<td>
								<a href="#1541-01-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-01-26">26</a>
							</td>
							<td>
								<a href="#1541-01-27">27</a>
							</td>
							<td>
								<a href="#1541-01-28">28</a>
							</td>
							<td>
								<a href="#1541-01-29">29</a>
							</td>
							<td>
								<a href="#1541-01-30">30</a>
							</td>
							<td>
								<a href="#1541-01-31">31</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-02">February</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-02-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-02-02">2</a>
							</td>
							<td>
								<a href="#1541-02-03">3</a>
							</td>
							<td>
								<a href="#1541-02-04">4</a>
							</td>
							<td>
								<a href="#1541-02-05">5</a>
							</td>
							<td>
								<a href="#1541-02-06">6</a>
							</td>
							<td>
								<a href="#1541-02-07">7</a>
							</td>
							<td>
								<a href="#1541-02-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-02-09">9</a>
							</td>
							<td>
								<a href="#1541-02-10">10</a>
							</td>
							<td>
								<a href="#1541-02-11">11</a>
							</td>
							<td>
								<a href="#1541-02-12">12</a>
							</td>
							<td>
								<a href="#1541-02-13">13</a>
							</td>
							<td>
								<a href="#1541-02-14">14</a>
							</td>
							<td>
								<a href="#1541-02-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-02-16">16</a>
							</td>
							<td>
								<a href="#1541-02-17">17</a>
							</td>
							<td>
								<a href="#1541-02-18">18</a>
							</td>
							<td>
								<a href="#1541-02-19">19</a>
							</td>
							<td>
								<a href="#1541-02-20">20</a>
							</td>
							<td>
								<a href="#1541-02-21">21</a>
							</td>
							<td>
								<a href="#1541-02-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-02-23">23</a>
							</td>
							<td>
								<a href="#1541-02-24">24</a>
							</td>
							<td>
								<a href="#1541-02-25">25</a>
							</td>
							<td>
								<a href="#1541-02-26">26</a>
							</td>
							<td>
								<a href="#1541-02-27">27</a>
							</td>
							<td>
								<a href="#1541-02-28">28</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-03">March</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-03-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-03-02">2</a>
							</td>
							<td>
								<a href="#1541-03-03">3</a>
							</td>
							<td>
								<a href="#1541-03-04">4</a>
							</td>
							<td>
								<a href="#1541-03-05">5</a>
							</td>
							<td>
								<a href="#1541-03-06">6</a>
							</td>
							<td>
								<a href="#1541-03-07">7</a>
							</td>
							<td>
								<a href="#1541-03-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-03-09">9</a>
							</td>
							<td>
								<a href="#1541-03-10">10</a>
							</td>
							<td>
								<a href="#1541-03-11">11</a>
							</td>
							<td>
								<a href="#1541-03-12">12</a>
							</td>
							<td>
								<a href="#1541-03-13">13</a>
							</td>
							<td>
								<a href="#1541-03-14">14</a>
							</td>
							<td>
								<a href="#1541-03-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-03-16">16</a>
							</td>
							<td>
								<a href="#1541-03-17">17</a>
							</td>
							<td>
								<a href="#1541-03-18">18</a>
							</td>
							<td>
								<a href="#1541-03-19">19</a>
							</td>
							<td>
								<a href="#1541-03-20">20</a>
							</td>
							<td>
								<a href="#1541-03-21">21</a>
							</td>
							<td>
								<a href="#1541-03-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-03-23">23</a>
							</td>
							<td>
								<a href="#1541-03-24">24</a>
							</td>
							<td>
								<a href="#1541-03-25">25</a>
							</td>
							<td>
								<a href="#1541-03-26">26</a>
							</td>
							<td>
								<a href="#1541-03-27">27</a>
							</td>
							<td>
								<a href="#1541-03-28">28</a>
							</td>
							<td>
								<a href="#1541-03-29">29</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-03-30">30</a>
							</td>
							<td>
								<a href="#1541-03-31">31</a>
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
								<a href="#1541-04">April</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-04-01">1</a>
							</td>
							<td>
								<a href="#1541-04-02">2</a>
							</td>
							<td>
								<a href="#1541-04-03">3</a>
							</td>
							<td>
								<a href="#1541-04-04">4</a>
							</td>
							<td>
								<a href="#1541-04-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-04-06">6</a>
							</td>
							<td>
								<a href="#1541-04-07">7</a>
							</td>
							<td>
								<a href="#1541-04-08">8</a>
							</td>
							<td>
								<a href="#1541-04-09">9</a>
							</td>
							<td>
								<a href="#1541-04-10">10</a>
							</td>
							<td>
								<a href="#1541-04-11">11</a>
							</td>
							<td>
								<a href="#1541-04-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-04-13">13</a>
							</td>
							<td>
								<a href="#1541-04-14">14</a>
							</td>
							<td>
								<a href="#1541-04-15">15</a>
							</td>
							<td>
								<a href="#1541-04-16">16</a>
							</td>
							<td>
								<a href="#1541-04-17">17</a>
							</td>
							<td>
								<a href="#1541-04-18">18</a>
							</td>
							<td>
								<a href="#1541-04-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-04-20">20</a>
							</td>
							<td>
								<a href="#1541-04-21">21</a>
							</td>
							<td>
								<a href="#1541-04-22">22</a>
							</td>
							<td>
								<a href="#1541-04-23">23</a>
							</td>
							<td>
								<a href="#1541-04-24">24</a>
							</td>
							<td>
								<a href="#1541-04-25">25</a>
							</td>
							<td>
								<a href="#1541-04-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-04-27">27</a>
							</td>
							<td>
								<a href="#1541-04-28">28</a>
							</td>
							<td>
								<a href="#1541-04-29">29</a>
							</td>
							<td>
								<a href="#1541-04-30">30</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-05">May</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-05-01">1</a>
							</td>
							<td>
								<a href="#1541-05-02">2</a>
							</td>
							<td>
								<a href="#1541-05-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-05-04">4</a>
							</td>
							<td>
								<a href="#1541-05-05">5</a>
							</td>
							<td>
								<a href="#1541-05-06">6</a>
							</td>
							<td>
								<a href="#1541-05-07">7</a>
							</td>
							<td>
								<a href="#1541-05-08">8</a>
							</td>
							<td>
								<a href="#1541-05-09">9</a>
							</td>
							<td>
								<a href="#1541-05-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-05-11">11</a>
							</td>
							<td>
								<a href="#1541-05-12">12</a>
							</td>
							<td>
								<a href="#1541-05-13">13</a>
							</td>
							<td>
								<a href="#1541-05-14">14</a>
							</td>
							<td>
								<a href="#1541-05-15">15</a>
							</td>
							<td>
								<a href="#1541-05-16">16</a>
							</td>
							<td>
								<a href="#1541-05-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-05-18">18</a>
							</td>
							<td>
								<a href="#1541-05-19">19</a>
							</td>
							<td>
								<a href="#1541-05-20">20</a>
							</td>
							<td>
								<a href="#1541-05-21">21</a>
							</td>
							<td>
								<a href="#1541-05-22">22</a>
							</td>
							<td>
								<a href="#1541-05-23">23</a>
							</td>
							<td>
								<a href="#1541-05-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-05-25">25</a>
							</td>
							<td>
								<a href="#1541-05-26">26</a>
							</td>
							<td>
								<a href="#1541-05-27">27</a>
							</td>
							<td>
								<a href="#1541-05-28">28</a>
							</td>
							<td>
								<a href="#1541-05-29">29</a>
							</td>
							<td>
								<a href="#1541-05-30">30</a>
							</td>
							<td>
								<a href="#1541-05-31">31</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-06">June</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-06-01">1</a>
							</td>
							<td>
								<a href="#1541-06-02">2</a>
							</td>
							<td>
								<a href="#1541-06-03">3</a>
							</td>
							<td>
								<a href="#1541-06-04">4</a>
							</td>
							<td>
								<a href="#1541-06-05">5</a>
							</td>
							<td>
								<a href="#1541-06-06">6</a>
							</td>
							<td>
								<a href="#1541-06-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-06-08">8</a>
							</td>
							<td>
								<a href="#1541-06-09">9</a>
							</td>
							<td>
								<a href="#1541-06-10">10</a>
							</td>
							<td>
								<a href="#1541-06-11">11</a>
							</td>
							<td>
								<a href="#1541-06-12">12</a>
							</td>
							<td>
								<a href="#1541-06-13">13</a>
							</td>
							<td>
								<a href="#1541-06-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-06-15">15</a>
							</td>
							<td>
								<a href="#1541-06-16">16</a>
							</td>
							<td>
								<a href="#1541-06-17">17</a>
							</td>
							<td>
								<a href="#1541-06-18">18</a>
							</td>
							<td>
								<a href="#1541-06-19">19</a>
							</td>
							<td>
								<a href="#1541-06-20">20</a>
							</td>
							<td>
								<a href="#1541-06-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-06-22">22</a>
							</td>
							<td>
								<a href="#1541-06-23">23</a>
							</td>
							<td>
								<a href="#1541-06-24">24</a>
							</td>
							<td>
								<a href="#1541-06-25">25</a>
							</td>
							<td>
								<a href="#1541-06-26">26</a>
							</td>
							<td>
								<a href="#1541-06-27">27</a>
							</td>
							<td>
								<a href="#1541-06-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-06-29">29</a>
							</td>
							<td>
								<a href="#1541-06-30">30</a>
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
								<a href="#1541-07">July</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-07-01">1</a>
							</td>
							<td>
								<a href="#1541-07-02">2</a>
							</td>
							<td>
								<a href="#1541-07-03">3</a>
							</td>
							<td>
								<a href="#1541-07-04">4</a>
							</td>
							<td>
								<a href="#1541-07-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-07-06">6</a>
							</td>
							<td>
								<a href="#1541-07-07">7</a>
							</td>
							<td>
								<a href="#1541-07-08">8</a>
							</td>
							<td>
								<a href="#1541-07-09">9</a>
							</td>
							<td>
								<a href="#1541-07-10">10</a>
							</td>
							<td>
								<a href="#1541-07-11">11</a>
							</td>
							<td>
								<a href="#1541-07-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-07-13">13</a>
							</td>
							<td>
								<a href="#1541-07-14">14</a>
							</td>
							<td>
								<a href="#1541-07-15">15</a>
							</td>
							<td>
								<a href="#1541-07-16">16</a>
							</td>
							<td>
								<a href="#1541-07-17">17</a>
							</td>
							<td>
								<a href="#1541-07-18">18</a>
							</td>
							<td>
								<a href="#1541-07-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-07-20">20</a>
							</td>
							<td>
								<a href="#1541-07-21">21</a>
							</td>
							<td>
								<a href="#1541-07-22">22</a>
							</td>
							<td>
								<a href="#1541-07-23">23</a>
							</td>
							<td>
								<a href="#1541-07-24">24</a>
							</td>
							<td>
								<a href="#1541-07-25">25</a>
							</td>
							<td>
								<a href="#1541-07-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-07-27">27</a>
							</td>
							<td>
								<a href="#1541-07-28">28</a>
							</td>
							<td>
								<a href="#1541-07-29">29</a>
							</td>
							<td>
								<a href="#1541-07-30">30</a>
							</td>
							<td>
								<a href="#1541-07-31">31</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-08">August</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-08-01">1</a>
							</td>
							<td>
								<a href="#1541-08-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-08-03">3</a>
							</td>
							<td>
								<a href="#1541-08-04">4</a>
							</td>
							<td>
								<a href="#1541-08-05">5</a>
							</td>
							<td>
								<a href="#1541-08-06">6</a>
							</td>
							<td>
								<a href="#1541-08-07">7</a>
							</td>
							<td>
								<a href="#1541-08-08">8</a>
							</td>
							<td>
								<a href="#1541-08-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-08-10">10</a>
							</td>
							<td>
								<a href="#1541-08-11">11</a>
							</td>
							<td>
								<a href="#1541-08-12">12</a>
							</td>
							<td>
								<a href="#1541-08-13">13</a>
							</td>
							<td>
								<a href="#1541-08-14">14</a>
							</td>
							<td>
								<a href="#1541-08-15">15</a>
							</td>
							<td>
								<a href="#1541-08-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-08-17">17</a>
							</td>
							<td>
								<a href="#1541-08-18">18</a>
							</td>
							<td>
								<a href="#1541-08-19">19</a>
							</td>
							<td>
								<a href="#1541-08-20">20</a>
							</td>
							<td>
								<a href="#1541-08-21">21</a>
							</td>
							<td>
								<a href="#1541-08-22">22</a>
							</td>
							<td>
								<a href="#1541-08-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-08-24">24</a>
							</td>
							<td>
								<a href="#1541-08-25">25</a>
							</td>
							<td>
								<a href="#1541-08-26">26</a>
							</td>
							<td>
								<a href="#1541-08-27">27</a>
							</td>
							<td>
								<a href="#1541-08-28">28</a>
							</td>
							<td>
								<a href="#1541-08-29">29</a>
							</td>
							<td>
								<a href="#1541-08-30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-08-31">31</a>
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
								<a href="#1541-09">September</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-09-01">1</a>
							</td>
							<td>
								<a href="#1541-09-02">2</a>
							</td>
							<td>
								<a href="#1541-09-03">3</a>
							</td>
							<td>
								<a href="#1541-09-04">4</a>
							</td>
							<td>
								<a href="#1541-09-05">5</a>
							</td>
							<td>
								<a href="#1541-09-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-09-07">7</a>
							</td>
							<td>
								<a href="#1541-09-08">8</a>
							</td>
							<td>
								<a href="#1541-09-09">9</a>
							</td>
							<td>
								<a href="#1541-09-10">10</a>
							</td>
							<td>
								<a href="#1541-09-11">11</a>
							</td>
							<td>
								<a href="#1541-09-12">12</a>
							</td>
							<td>
								<a href="#1541-09-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-09-14">14</a>
							</td>
							<td>
								<a href="#1541-09-15">15</a>
							</td>
							<td>
								<a href="#1541-09-16">16</a>
							</td>
							<td>
								<a href="#1541-09-17">17</a>
							</td>
							<td>
								<a href="#1541-09-18">18</a>
							</td>
							<td>
								<a href="#1541-09-19">19</a>
							</td>
							<td>
								<a href="#1541-09-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-09-21">21</a>
							</td>
							<td>
								<a href="#1541-09-22">22</a>
							</td>
							<td>
								<a href="#1541-09-23">23</a>
							</td>
							<td>
								<a href="#1541-09-24">24</a>
							</td>
							<td>
								<a href="#1541-09-25">25</a>
							</td>
							<td>
								<a href="#1541-09-26">26</a>
							</td>
							<td>
								<a href="#1541-09-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-09-28">28</a>
							</td>
							<td>
								<a href="#1541-09-29">29</a>
							</td>
							<td>
								<a href="#1541-09-30">30</a>
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
								<a href="#1541-10">October</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-10-01">1</a>
							</td>
							<td>
								<a href="#1541-10-02">2</a>
							</td>
							<td>
								<a href="#1541-10-03">3</a>
							</td>
							<td>
								<a href="#1541-10-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-10-05">5</a>
							</td>
							<td>
								<a href="#1541-10-06">6</a>
							</td>
							<td>
								<a href="#1541-10-07">7</a>
							</td>
							<td>
								<a href="#1541-10-08">8</a>
							</td>
							<td>
								<a href="#1541-10-09">9</a>
							</td>
							<td>
								<a href="#1541-10-10">10</a>
							</td>
							<td>
								<a href="#1541-10-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-10-12">12</a>
							</td>
							<td>
								<a href="#1541-10-13">13</a>
							</td>
							<td>
								<a href="#1541-10-14">14</a>
							</td>
							<td>
								<a href="#1541-10-15">15</a>
							</td>
							<td>
								<a href="#1541-10-16">16</a>
							</td>
							<td>
								<a href="#1541-10-17">17</a>
							</td>
							<td>
								<a href="#1541-10-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-10-19">19</a>
							</td>
							<td>
								<a href="#1541-10-20">20</a>
							</td>
							<td>
								<a href="#1541-10-21">21</a>
							</td>
							<td>
								<a href="#1541-10-22">22</a>
							</td>
							<td>
								<a href="#1541-10-23">23</a>
							</td>
							<td>
								<a href="#1541-10-24">24</a>
							</td>
							<td>
								<a href="#1541-10-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-10-26">26</a>
							</td>
							<td>
								<a href="#1541-10-27">27</a>
							</td>
							<td>
								<a href="#1541-10-28">28</a>
							</td>
							<td>
								<a href="#1541-10-29">29</a>
							</td>
							<td>
								<a href="#1541-10-30">30</a>
							</td>
							<td>
								<a href="#1541-10-31">31</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1541-11">November</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-11-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-11-02">2</a>
							</td>
							<td>
								<a href="#1541-11-03">3</a>
							</td>
							<td>
								<a href="#1541-11-04">4</a>
							</td>
							<td>
								<a href="#1541-11-05">5</a>
							</td>
							<td>
								<a href="#1541-11-06">6</a>
							</td>
							<td>
								<a href="#1541-11-07">7</a>
							</td>
							<td>
								<a href="#1541-11-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-11-09">9</a>
							</td>
							<td>
								<a href="#1541-11-10">10</a>
							</td>
							<td>
								<a href="#1541-11-11">11</a>
							</td>
							<td>
								<a href="#1541-11-12">12</a>
							</td>
							<td>
								<a href="#1541-11-13">13</a>
							</td>
							<td>
								<a href="#1541-11-14">14</a>
							</td>
							<td>
								<a href="#1541-11-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-11-16">16</a>
							</td>
							<td>
								<a href="#1541-11-17">17</a>
							</td>
							<td>
								<a href="#1541-11-18">18</a>
							</td>
							<td>
								<a href="#1541-11-19">19</a>
							</td>
							<td>
								<a href="#1541-11-20">20</a>
							</td>
							<td>
								<a href="#1541-11-21">21</a>
							</td>
							<td>
								<a href="#1541-11-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-11-23">23</a>
							</td>
							<td>
								<a href="#1541-11-24">24</a>
							</td>
							<td>
								<a href="#1541-11-25">25</a>
							</td>
							<td>
								<a href="#1541-11-26">26</a>
							</td>
							<td>
								<a href="#1541-11-27">27</a>
							</td>
							<td>
								<a href="#1541-11-28">28</a>
							</td>
							<td>
								<a href="#1541-11-29">29</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-11-30">30</a>
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
								<a href="#1541-12">December</a>
							</td>
							<td colspan="2">
								<a href="#1541">1541</a>
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
								<a href="#1541-12-01">1</a>
							</td>
							<td>
								<a href="#1541-12-02">2</a>
							</td>
							<td>
								<a href="#1541-12-03">3</a>
							</td>
							<td>
								<a href="#1541-12-04">4</a>
							</td>
							<td>
								<a href="#1541-12-05">5</a>
							</td>
							<td>
								<a href="#1541-12-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-12-07">7</a>
							</td>
							<td>
								<a href="#1541-12-08">8</a>
							</td>
							<td>
								<a href="#1541-12-09">9</a>
							</td>
							<td>
								<a href="#1541-12-10">10</a>
							</td>
							<td>
								<a href="#1541-12-11">11</a>
							</td>
							<td>
								<a href="#1541-12-12">12</a>
							</td>
							<td>
								<a href="#1541-12-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-12-14">14</a>
							</td>
							<td>
								<a href="#1541-12-15">15</a>
							</td>
							<td>
								<a href="#1541-12-16">16</a>
							</td>
							<td>
								<a href="#1541-12-17">17</a>
							</td>
							<td>
								<a href="#1541-12-18">18</a>
							</td>
							<td>
								<a href="#1541-12-19">19</a>
							</td>
							<td>
								<a href="#1541-12-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-12-21">21</a>
							</td>
							<td>
								<a href="#1541-12-22">22</a>
							</td>
							<td>
								<a href="#1541-12-23">23</a>
							</td>
							<td>
								<a href="#1541-12-24">24</a>
							</td>
							<td>
								<a href="#1541-12-25">25</a>
							</td>
							<td>
								<a href="#1541-12-26">26</a>
							</td>
							<td>
								<a href="#1541-12-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1541-12-28">28</a>
							</td>
							<td>
								<a href="#1541-12-29">29</a>
							</td>
							<td>
								<a href="#1541-12-30">30</a>
							</td>
							<td>
								<a href="#1541-12-31">31</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="1542" class="tabs_content">
<!--				<h3>1542</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-01">January</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-01-01">1</a>
							</td>
							<td>
								<a href="#1542-01-02">2</a>
							</td>
							<td>
								<a href="#1542-01-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-01-04">4</a>
							</td>
							<td>
								<a href="#1542-01-05">5</a>
							</td>
							<td>
								<a href="#1542-01-06">6</a>
							</td>
							<td>
								<a href="#1542-01-07">7</a>
							</td>
							<td>
								<a href="#1542-01-08">8</a>
							</td>
							<td>
								<a href="#1542-01-09">9</a>
							</td>
							<td>
								<a href="#1542-01-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-01-11">11</a>
							</td>
							<td>
								<a href="#1542-01-12">12</a>
							</td>
							<td>
								<a href="#1542-01-13">13</a>
							</td>
							<td>
								<a href="#1542-01-14">14</a>
							</td>
							<td>
								<a href="#1542-01-15">15</a>
							</td>
							<td>
								<a href="#1542-01-16">16</a>
							</td>
							<td>
								<a href="#1542-01-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-01-18">18</a>
							</td>
							<td>
								<a href="#1542-01-19">19</a>
							</td>
							<td>
								<a href="#1542-01-20">20</a>
							</td>
							<td>
								<a href="#1542-01-21">21</a>
							</td>
							<td>
								<a href="#1542-01-22">22</a>
							</td>
							<td>
								<a href="#1542-01-23">23</a>
							</td>
							<td>
								<a href="#1542-01-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-01-25">25</a>
							</td>
							<td>
								<a href="#1542-01-26">26</a>
							</td>
							<td>
								<a href="#1542-01-27">27</a>
							</td>
							<td>
								<a href="#1542-01-28">28</a>
							</td>
							<td>
								<a href="#1542-01-29">29</a>
							</td>
							<td>
								<a href="#1542-01-30">30</a>
							</td>
							<td>
								<a href="#1542-01-31">31</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-02">February</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-02-01">1</a>
							</td>
							<td>
								<a href="#1542-02-02">2</a>
							</td>
							<td>
								<a href="#1542-02-03">3</a>
							</td>
							<td>
								<a href="#1542-02-04">4</a>
							</td>
							<td>
								<a href="#1542-02-05">5</a>
							</td>
							<td>
								<a href="#1542-02-06">6</a>
							</td>
							<td>
								<a href="#1542-02-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-02-08">8</a>
							</td>
							<td>
								<a href="#1542-02-09">9</a>
							</td>
							<td>
								<a href="#1542-02-10">10</a>
							</td>
							<td>
								<a href="#1542-02-11">11</a>
							</td>
							<td>
								<a href="#1542-02-12">12</a>
							</td>
							<td>
								<a href="#1542-02-13">13</a>
							</td>
							<td>
								<a href="#1542-02-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-02-15">15</a>
							</td>
							<td>
								<a href="#1542-02-16">16</a>
							</td>
							<td>
								<a href="#1542-02-17">17</a>
							</td>
							<td>
								<a href="#1542-02-18">18</a>
							</td>
							<td>
								<a href="#1542-02-19">19</a>
							</td>
							<td>
								<a href="#1542-02-20">20</a>
							</td>
							<td>
								<a href="#1542-02-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-02-22">22</a>
							</td>
							<td>
								<a href="#1542-02-23">23</a>
							</td>
							<td>
								<a href="#1542-02-24">24</a>
							</td>
							<td>
								<a href="#1542-02-25">25</a>
							</td>
							<td>
								<a href="#1542-02-26">26</a>
							</td>
							<td>
								<a href="#1542-02-27">27</a>
							</td>
							<td>
								<a href="#1542-02-28">28</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-03">March</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-03-01">1</a>
							</td>
							<td>
								<a href="#1542-03-02">2</a>
							</td>
							<td>
								<a href="#1542-03-03">3</a>
							</td>
							<td>
								<a href="#1542-03-04">4</a>
							</td>
							<td>
								<a href="#1542-03-05">5</a>
							</td>
							<td>
								<a href="#1542-03-06">6</a>
							</td>
							<td>
								<a href="#1542-03-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-03-08">8</a>
							</td>
							<td>
								<a href="#1542-03-09">9</a>
							</td>
							<td>
								<a href="#1542-03-10">10</a>
							</td>
							<td>
								<a href="#1542-03-11">11</a>
							</td>
							<td>
								<a href="#1542-03-12">12</a>
							</td>
							<td>
								<a href="#1542-03-13">13</a>
							</td>
							<td>
								<a href="#1542-03-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-03-15">15</a>
							</td>
							<td>
								<a href="#1542-03-16">16</a>
							</td>
							<td>
								<a href="#1542-03-17">17</a>
							</td>
							<td>
								<a href="#1542-03-18">18</a>
							</td>
							<td>
								<a href="#1542-03-19">19</a>
							</td>
							<td>
								<a href="#1542-03-20">20</a>
							</td>
							<td>
								<a href="#1542-03-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-03-22">22</a>
							</td>
							<td>
								<a href="#1542-03-23">23</a>
							</td>
							<td>
								<a href="#1542-03-24">24</a>
							</td>
							<td>
								<a href="#1542-03-25">25</a>
							</td>
							<td>
								<a href="#1542-03-26">26</a>
							</td>
							<td>
								<a href="#1542-03-27">27</a>
							</td>
							<td>
								<a href="#1542-03-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-03-29">29</a>
							</td>
							<td>
								<a href="#1542-03-30">30</a>
							</td>
							<td>
								<a href="#1542-03-31">31</a>
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
								<a href="#1542-04">April</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-04-01">1</a>
							</td>
							<td>
								<a href="#1542-04-02">2</a>
							</td>
							<td>
								<a href="#1542-04-03">3</a>
							</td>
							<td>
								<a href="#1542-04-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-04-05">5</a>
							</td>
							<td>
								<a href="#1542-04-06">6</a>
							</td>
							<td>
								<a href="#1542-04-07">7</a>
							</td>
							<td>
								<a href="#1542-04-08">8</a>
							</td>
							<td>
								<a href="#1542-04-09">9</a>
							</td>
							<td>
								<a href="#1542-04-10">10</a>
							</td>
							<td>
								<a href="#1542-04-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-04-12">12</a>
							</td>
							<td>
								<a href="#1542-04-13">13</a>
							</td>
							<td>
								<a href="#1542-04-14">14</a>
							</td>
							<td>
								<a href="#1542-04-15">15</a>
							</td>
							<td>
								<a href="#1542-04-16">16</a>
							</td>
							<td>
								<a href="#1542-04-17">17</a>
							</td>
							<td>
								<a href="#1542-04-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-04-19">19</a>
							</td>
							<td>
								<a href="#1542-04-20">20</a>
							</td>
							<td>
								<a href="#1542-04-21">21</a>
							</td>
							<td>
								<a href="#1542-04-22">22</a>
							</td>
							<td>
								<a href="#1542-04-23">23</a>
							</td>
							<td>
								<a href="#1542-04-24">24</a>
							</td>
							<td>
								<a href="#1542-04-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-04-26">26</a>
							</td>
							<td>
								<a href="#1542-04-27">27</a>
							</td>
							<td>
								<a href="#1542-04-28">28</a>
							</td>
							<td>
								<a href="#1542-04-29">29</a>
							</td>
							<td>
								<a href="#1542-04-30">30</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-05">May</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-05-01">1</a>
							</td>
							<td>
								<a href="#1542-05-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-05-03">3</a>
							</td>
							<td>
								<a href="#1542-05-04">4</a>
							</td>
							<td>
								<a href="#1542-05-05">5</a>
							</td>
							<td>
								<a href="#1542-05-06">6</a>
							</td>
							<td>
								<a href="#1542-05-07">7</a>
							</td>
							<td>
								<a href="#1542-05-08">8</a>
							</td>
							<td>
								<a href="#1542-05-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-05-10">10</a>
							</td>
							<td>
								<a href="#1542-05-11">11</a>
							</td>
							<td>
								<a href="#1542-05-12">12</a>
							</td>
							<td>
								<a href="#1542-05-13">13</a>
							</td>
							<td>
								<a href="#1542-05-14">14</a>
							</td>
							<td>
								<a href="#1542-05-15">15</a>
							</td>
							<td>
								<a href="#1542-05-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-05-17">17</a>
							</td>
							<td>
								<a href="#1542-05-18">18</a>
							</td>
							<td>
								<a href="#1542-05-19">19</a>
							</td>
							<td>
								<a href="#1542-05-20">20</a>
							</td>
							<td>
								<a href="#1542-05-21">21</a>
							</td>
							<td>
								<a href="#1542-05-22">22</a>
							</td>
							<td>
								<a href="#1542-05-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-05-24">24</a>
							</td>
							<td>
								<a href="#1542-05-25">25</a>
							</td>
							<td>
								<a href="#1542-05-26">26</a>
							</td>
							<td>
								<a href="#1542-05-27">27</a>
							</td>
							<td>
								<a href="#1542-05-28">28</a>
							</td>
							<td>
								<a href="#1542-05-29">29</a>
							</td>
							<td>
								<a href="#1542-05-30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-05-31">31</a>
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
								<a href="#1542-06">June</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-06-01">1</a>
							</td>
							<td>
								<a href="#1542-06-02">2</a>
							</td>
							<td>
								<a href="#1542-06-03">3</a>
							</td>
							<td>
								<a href="#1542-06-04">4</a>
							</td>
							<td>
								<a href="#1542-06-05">5</a>
							</td>
							<td>
								<a href="#1542-06-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-06-07">7</a>
							</td>
							<td>
								<a href="#1542-06-08">8</a>
							</td>
							<td>
								<a href="#1542-06-09">9</a>
							</td>
							<td>
								<a href="#1542-06-10">10</a>
							</td>
							<td>
								<a href="#1542-06-11">11</a>
							</td>
							<td>
								<a href="#1542-06-12">12</a>
							</td>
							<td>
								<a href="#1542-06-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-06-14">14</a>
							</td>
							<td>
								<a href="#1542-06-15">15</a>
							</td>
							<td>
								<a href="#1542-06-16">16</a>
							</td>
							<td>
								<a href="#1542-06-17">17</a>
							</td>
							<td>
								<a href="#1542-06-18">18</a>
							</td>
							<td>
								<a href="#1542-06-19">19</a>
							</td>
							<td>
								<a href="#1542-06-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-06-21">21</a>
							</td>
							<td>
								<a href="#1542-06-22">22</a>
							</td>
							<td>
								<a href="#1542-06-23">23</a>
							</td>
							<td>
								<a href="#1542-06-24">24</a>
							</td>
							<td>
								<a href="#1542-06-25">25</a>
							</td>
							<td>
								<a href="#1542-06-26">26</a>
							</td>
							<td>
								<a href="#1542-06-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-06-28">28</a>
							</td>
							<td>
								<a href="#1542-06-29">29</a>
							</td>
							<td>
								<a href="#1542-06-30">30</a>
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
								<a href="#1542-07">July</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-07-01">1</a>
							</td>
							<td>
								<a href="#1542-07-02">2</a>
							</td>
							<td>
								<a href="#1542-07-03">3</a>
							</td>
							<td>
								<a href="#1542-07-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-07-05">5</a>
							</td>
							<td>
								<a href="#1542-07-06">6</a>
							</td>
							<td>
								<a href="#1542-07-07">7</a>
							</td>
							<td>
								<a href="#1542-07-08">8</a>
							</td>
							<td>
								<a href="#1542-07-09">9</a>
							</td>
							<td>
								<a href="#1542-07-10">10</a>
							</td>
							<td>
								<a href="#1542-07-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-07-12">12</a>
							</td>
							<td>
								<a href="#1542-07-13">13</a>
							</td>
							<td>
								<a href="#1542-07-14">14</a>
							</td>
							<td>
								<a href="#1542-07-15">15</a>
							</td>
							<td>
								<a href="#1542-07-16">16</a>
							</td>
							<td>
								<a href="#1542-07-17">17</a>
							</td>
							<td>
								<a href="#1542-07-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-07-19">19</a>
							</td>
							<td>
								<a href="#1542-07-20">20</a>
							</td>
							<td>
								<a href="#1542-07-21">21</a>
							</td>
							<td>
								<a href="#1542-07-22">22</a>
							</td>
							<td>
								<a href="#1542-07-23">23</a>
							</td>
							<td>
								<a href="#1542-07-24">24</a>
							</td>
							<td>
								<a href="#1542-07-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-07-26">26</a>
							</td>
							<td>
								<a href="#1542-07-27">27</a>
							</td>
							<td>
								<a href="#1542-07-28">28</a>
							</td>
							<td>
								<a href="#1542-07-29">29</a>
							</td>
							<td>
								<a href="#1542-07-30">30</a>
							</td>
							<td>
								<a href="#1542-07-31">31</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-08">August</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-08-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-08-02">2</a>
							</td>
							<td>
								<a href="#1542-08-03">3</a>
							</td>
							<td>
								<a href="#1542-08-04">4</a>
							</td>
							<td>
								<a href="#1542-08-05">5</a>
							</td>
							<td>
								<a href="#1542-08-06">6</a>
							</td>
							<td>
								<a href="#1542-08-07">7</a>
							</td>
							<td>
								<a href="#1542-08-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-08-09">9</a>
							</td>
							<td>
								<a href="#1542-08-10">10</a>
							</td>
							<td>
								<a href="#1542-08-11">11</a>
							</td>
							<td>
								<a href="#1542-08-12">12</a>
							</td>
							<td>
								<a href="#1542-08-13">13</a>
							</td>
							<td>
								<a href="#1542-08-14">14</a>
							</td>
							<td>
								<a href="#1542-08-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-08-16">16</a>
							</td>
							<td>
								<a href="#1542-08-17">17</a>
							</td>
							<td>
								<a href="#1542-08-18">18</a>
							</td>
							<td>
								<a href="#1542-08-19">19</a>
							</td>
							<td>
								<a href="#1542-08-20">20</a>
							</td>
							<td>
								<a href="#1542-08-21">21</a>
							</td>
							<td>
								<a href="#1542-08-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-08-23">23</a>
							</td>
							<td>
								<a href="#1542-08-24">24</a>
							</td>
							<td>
								<a href="#1542-08-25">25</a>
							</td>
							<td>
								<a href="#1542-08-26">26</a>
							</td>
							<td>
								<a href="#1542-08-27">27</a>
							</td>
							<td>
								<a href="#1542-08-28">28</a>
							</td>
							<td>
								<a href="#1542-08-29">29</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-08-30">30</a>
							</td>
							<td>
								<a href="#1542-08-31">31</a>
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
								<a href="#1542-09">September</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-09-01">1</a>
							</td>
							<td>
								<a href="#1542-09-02">2</a>
							</td>
							<td>
								<a href="#1542-09-03">3</a>
							</td>
							<td>
								<a href="#1542-09-04">4</a>
							</td>
							<td>
								<a href="#1542-09-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-09-06">6</a>
							</td>
							<td>
								<a href="#1542-09-07">7</a>
							</td>
							<td>
								<a href="#1542-09-08">8</a>
							</td>
							<td>
								<a href="#1542-09-09">9</a>
							</td>
							<td>
								<a href="#1542-09-10">10</a>
							</td>
							<td>
								<a href="#1542-09-11">11</a>
							</td>
							<td>
								<a href="#1542-09-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-09-13">13</a>
							</td>
							<td>
								<a href="#1542-09-14">14</a>
							</td>
							<td>
								<a href="#1542-09-15">15</a>
							</td>
							<td>
								<a href="#1542-09-16">16</a>
							</td>
							<td>
								<a href="#1542-09-17">17</a>
							</td>
							<td>
								<a href="#1542-09-18">18</a>
							</td>
							<td>
								<a href="#1542-09-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-09-20">20</a>
							</td>
							<td>
								<a href="#1542-09-21">21</a>
							</td>
							<td>
								<a href="#1542-09-22">22</a>
							</td>
							<td>
								<a href="#1542-09-23">23</a>
							</td>
							<td>
								<a href="#1542-09-24">24</a>
							</td>
							<td>
								<a href="#1542-09-25">25</a>
							</td>
							<td>
								<a href="#1542-09-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-09-27">27</a>
							</td>
							<td>
								<a href="#1542-09-28">28</a>
							</td>
							<td>
								<a href="#1542-09-29">29</a>
							</td>
							<td>
								<a href="#1542-09-30">30</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-10">October</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-10-01">1</a>
							</td>
							<td>
								<a href="#1542-10-02">2</a>
							</td>
							<td>
								<a href="#1542-10-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-10-04">4</a>
							</td>
							<td>
								<a href="#1542-10-05">5</a>
							</td>
							<td>
								<a href="#1542-10-06">6</a>
							</td>
							<td>
								<a href="#1542-10-07">7</a>
							</td>
							<td>
								<a href="#1542-10-08">8</a>
							</td>
							<td>
								<a href="#1542-10-09">9</a>
							</td>
							<td>
								<a href="#1542-10-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-10-11">11</a>
							</td>
							<td>
								<a href="#1542-10-12">12</a>
							</td>
							<td>
								<a href="#1542-10-13">13</a>
							</td>
							<td>
								<a href="#1542-10-14">14</a>
							</td>
							<td>
								<a href="#1542-10-15">15</a>
							</td>
							<td>
								<a href="#1542-10-16">16</a>
							</td>
							<td>
								<a href="#1542-10-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-10-18">18</a>
							</td>
							<td>
								<a href="#1542-10-19">19</a>
							</td>
							<td>
								<a href="#1542-10-20">20</a>
							</td>
							<td>
								<a href="#1542-10-21">21</a>
							</td>
							<td>
								<a href="#1542-10-22">22</a>
							</td>
							<td>
								<a href="#1542-10-23">23</a>
							</td>
							<td>
								<a href="#1542-10-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-10-25">25</a>
							</td>
							<td>
								<a href="#1542-10-26">26</a>
							</td>
							<td>
								<a href="#1542-10-27">27</a>
							</td>
							<td>
								<a href="#1542-10-28">28</a>
							</td>
							<td>
								<a href="#1542-10-29">29</a>
							</td>
							<td>
								<a href="#1542-10-30">30</a>
							</td>
							<td>
								<a href="#1542-10-31">31</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1542-11">November</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-11-01">1</a>
							</td>
							<td>
								<a href="#1542-11-02">2</a>
							</td>
							<td>
								<a href="#1542-11-03">3</a>
							</td>
							<td>
								<a href="#1542-11-04">4</a>
							</td>
							<td>
								<a href="#1542-11-05">5</a>
							</td>
							<td>
								<a href="#1542-11-06">6</a>
							</td>
							<td>
								<a href="#1542-11-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-11-08">8</a>
							</td>
							<td>
								<a href="#1542-11-09">9</a>
							</td>
							<td>
								<a href="#1542-11-10">10</a>
							</td>
							<td>
								<a href="#1542-11-11">11</a>
							</td>
							<td>
								<a href="#1542-11-12">12</a>
							</td>
							<td>
								<a href="#1542-11-13">13</a>
							</td>
							<td>
								<a href="#1542-11-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-11-15">15</a>
							</td>
							<td>
								<a href="#1542-11-16">16</a>
							</td>
							<td>
								<a href="#1542-11-17">17</a>
							</td>
							<td>
								<a href="#1542-11-18">18</a>
							</td>
							<td>
								<a href="#1542-11-19">19</a>
							</td>
							<td>
								<a href="#1542-11-20">20</a>
							</td>
							<td>
								<a href="#1542-11-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-11-22">22</a>
							</td>
							<td>
								<a href="#1542-11-23">23</a>
							</td>
							<td>
								<a href="#1542-11-24">24</a>
							</td>
							<td>
								<a href="#1542-11-25">25</a>
							</td>
							<td>
								<a href="#1542-11-26">26</a>
							</td>
							<td>
								<a href="#1542-11-27">27</a>
							</td>
							<td>
								<a href="#1542-11-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-11-29">29</a>
							</td>
							<td>
								<a href="#1542-11-30">30</a>
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
								<a href="#1542-12">December</a>
							</td>
							<td colspan="2">
								<a href="#1542">1542</a>
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
								<a href="#1542-12-01">1</a>
							</td>
							<td>
								<a href="#1542-12-02">2</a>
							</td>
							<td>
								<a href="#1542-12-03">3</a>
							</td>
							<td>
								<a href="#1542-12-04">4</a>
							</td>
							<td>
								<a href="#1542-12-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-12-06">6</a>
							</td>
							<td>
								<a href="#1542-12-07">7</a>
							</td>
							<td>
								<a href="#1542-12-08">8</a>
							</td>
							<td>
								<a href="#1542-12-09">9</a>
							</td>
							<td>
								<a href="#1542-12-10">10</a>
							</td>
							<td>
								<a href="#1542-12-11">11</a>
							</td>
							<td>
								<a href="#1542-12-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-12-13">13</a>
							</td>
							<td>
								<a href="#1542-12-14">14</a>
							</td>
							<td>
								<a href="#1542-12-15">15</a>
							</td>
							<td>
								<a href="#1542-12-16">16</a>
							</td>
							<td>
								<a href="#1542-12-17">17</a>
							</td>
							<td>
								<a href="#1542-12-18">18</a>
							</td>
							<td>
								<a href="#1542-12-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-12-20">20</a>
							</td>
							<td>
								<a href="#1542-12-21">21</a>
							</td>
							<td>
								<a href="#1542-12-22">22</a>
							</td>
							<td>
								<a href="#1542-12-23">23</a>
							</td>
							<td>
								<a href="#1542-12-24">24</a>
							</td>
							<td>
								<a href="#1542-12-25">25</a>
							</td>
							<td>
								<a href="#1542-12-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1542-12-27">27</a>
							</td>
							<td>
								<a href="#1542-12-28">28</a>
							</td>
							<td>
								<a href="#1542-12-29">29</a>
							</td>
							<td>
								<a href="#1542-12-30">30</a>
							</td>
							<td>
								<a href="#1542-12-31">31</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
				</div>
			</div>
			<div id="1543" class="tabs_content">
				<!--<h3>1543</h3>-->
				<div style="display:flex; flex-wrap:wrap; justify-content:space-between;">
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-01">January</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-01-01">1</a>
							</td>
							<td>
								<a href="#1543-01-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-01-03">3</a>
							</td>
							<td>
								<a href="#1543-01-04">4</a>
							</td>
							<td>
								<a href="#1543-01-05">5</a>
							</td>
							<td>
								<a href="#1543-01-06">6</a>
							</td>
							<td>
								<a href="#1543-01-07">7</a>
							</td>
							<td>
								<a href="#1543-01-08">8</a>
							</td>
							<td>
								<a href="#1543-01-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-01-10">10</a>
							</td>
							<td>
								<a href="#1543-01-11">11</a>
							</td>
							<td>
								<a href="#1543-01-12">12</a>
							</td>
							<td>
								<a href="#1543-01-13">13</a>
							</td>
							<td>
								<a href="#1543-01-14">14</a>
							</td>
							<td>
								<a href="#1543-01-15">15</a>
							</td>
							<td>
								<a href="#1543-01-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-01-17">17</a>
							</td>
							<td>
								<a href="#1543-01-18">18</a>
							</td>
							<td>
								<a href="#1543-01-19">19</a>
							</td>
							<td>
								<a href="#1543-01-20">20</a>
							</td>
							<td>
								<a href="#1543-01-21">21</a>
							</td>
							<td>
								<a href="#1543-01-22">22</a>
							</td>
							<td>
								<a href="#1543-01-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-01-24">24</a>
							</td>
							<td>
								<a href="#1543-01-25">25</a>
							</td>
							<td>
								<a href="#1543-01-26">26</a>
							</td>
							<td>
								<a href="#1543-01-27">27</a>
							</td>
							<td>
								<a href="#1543-01-28">28</a>
							</td>
							<td>
								<a href="#1543-01-29">29</a>
							</td>
							<td>
								<a href="#1543-01-30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-01-31">31</a>
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
								<a href="#1543-02">February</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-02-01">1</a>
							</td>
							<td>
								<a href="#1543-02-02">2</a>
							</td>
							<td>
								<a href="#1543-02-03">3</a>
							</td>
							<td>
								<a href="#1543-02-04">4</a>
							</td>
							<td>
								<a href="#1543-02-05">5</a>
							</td>
							<td>
								<a href="#1543-02-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-02-07">7</a>
							</td>
							<td>
								<a href="#1543-02-08">8</a>
							</td>
							<td>
								<a href="#1543-02-09">9</a>
							</td>
							<td>
								<a href="#1543-02-10">10</a>
							</td>
							<td>
								<a href="#1543-02-11">11</a>
							</td>
							<td>
								<a href="#1543-02-12">12</a>
							</td>
							<td>
								<a href="#1543-02-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-02-14">14</a>
							</td>
							<td>
								<a href="#1543-02-15">15</a>
							</td>
							<td>
								<a href="#1543-02-16">16</a>
							</td>
							<td>
								<a href="#1543-02-17">17</a>
							</td>
							<td>
								<a href="#1543-02-18">18</a>
							</td>
							<td>
								<a href="#1543-02-19">19</a>
							</td>
							<td>
								<a href="#1543-02-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-02-21">21</a>
							</td>
							<td>
								<a href="#1543-02-22">22</a>
							</td>
							<td>
								<a href="#1543-02-23">23</a>
							</td>
							<td>
								<a href="#1543-02-24">24</a>
							</td>
							<td>
								<a href="#1543-02-25">25</a>
							</td>
							<td>
								<a href="#1543-02-26">26</a>
							</td>
							<td>
								<a href="#1543-02-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-02-28">28</a>
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
								<a href="#1543-03">March</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-03-01">1</a>
							</td>
							<td>
								<a href="#1543-03-02">2</a>
							</td>
							<td>
								<a href="#1543-03-03">3</a>
							</td>
							<td>
								<a href="#1543-03-04">4</a>
							</td>
							<td>
								<a href="#1543-03-05">5</a>
							</td>
							<td>
								<a href="#1543-03-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-03-07">7</a>
							</td>
							<td>
								<a href="#1543-03-08">8</a>
							</td>
							<td>
								<a href="#1543-03-09">9</a>
							</td>
							<td>
								<a href="#1543-03-10">10</a>
							</td>
							<td>
								<a href="#1543-03-11">11</a>
							</td>
							<td>
								<a href="#1543-03-12">12</a>
							</td>
							<td>
								<a href="#1543-03-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-03-14">14</a>
							</td>
							<td>
								<a href="#1543-03-15">15</a>
							</td>
							<td>
								<a href="#1543-03-16">16</a>
							</td>
							<td>
								<a href="#1543-03-17">17</a>
							</td>
							<td>
								<a href="#1543-03-18">18</a>
							</td>
							<td>
								<a href="#1543-03-19">19</a>
							</td>
							<td>
								<a href="#1543-03-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-03-21">21</a>
							</td>
							<td>
								<a href="#1543-03-22">22</a>
							</td>
							<td>
								<a href="#1543-03-23">23</a>
							</td>
							<td>
								<a href="#1543-03-24">24</a>
							</td>
							<td>
								<a href="#1543-03-25">25</a>
							</td>
							<td>
								<a href="#1543-03-26">26</a>
							</td>
							<td>
								<a href="#1543-03-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-03-28">28</a>
							</td>
							<td>
								<a href="#1543-03-29">29</a>
							</td>
							<td>
								<a href="#1543-03-30">30</a>
							</td>
							<td>
								<a href="#1543-03-31">31</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-04">April</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-04-01">1</a>
							</td>
							<td>
								<a href="#1543-04-02">2</a>
							</td>
							<td>
								<a href="#1543-04-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-04-04">4</a>
							</td>
							<td>
								<a href="#1543-04-05">5</a>
							</td>
							<td>
								<a href="#1543-04-06">6</a>
							</td>
							<td>
								<a href="#1543-04-07">7</a>
							</td>
							<td>
								<a href="#1543-04-08">8</a>
							</td>
							<td>
								<a href="#1543-04-09">9</a>
							</td>
							<td>
								<a href="#1543-04-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-04-11">11</a>
							</td>
							<td>
								<a href="#1543-04-12">12</a>
							</td>
							<td>
								<a href="#1543-04-13">13</a>
							</td>
							<td>
								<a href="#1543-04-14">14</a>
							</td>
							<td>
								<a href="#1543-04-15">15</a>
							</td>
							<td>
								<a href="#1543-04-16">16</a>
							</td>
							<td>
								<a href="#1543-04-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-04-18">18</a>
							</td>
							<td>
								<a href="#1543-04-19">19</a>
							</td>
							<td>
								<a href="#1543-04-20">20</a>
							</td>
							<td>
								<a href="#1543-04-21">21</a>
							</td>
							<td>
								<a href="#1543-04-22">22</a>
							</td>
							<td>
								<a href="#1543-04-23">23</a>
							</td>
							<td>
								<a href="#1543-04-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-04-25">25</a>
							</td>
							<td>
								<a href="#1543-04-26">26</a>
							</td>
							<td>
								<a href="#1543-04-27">27</a>
							</td>
							<td>
								<a href="#1543-04-28">28</a>
							</td>
							<td>
								<a href="#1543-04-29">29</a>
							</td>
							<td>
								<a href="#1543-04-30">30</a>
							</td>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-05">May</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-05-01">1</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-05-02">2</a>
							</td>
							<td>
								<a href="#1543-05-03">3</a>
							</td>
							<td>
								<a href="#1543-05-04">4</a>
							</td>
							<td>
								<a href="#1543-05-05">5</a>
							</td>
							<td>
								<a href="#1543-05-06">6</a>
							</td>
							<td>
								<a href="#1543-05-07">7</a>
							</td>
							<td>
								<a href="#1543-05-08">8</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-05-09">9</a>
							</td>
							<td>
								<a href="#1543-05-10">10</a>
							</td>
							<td>
								<a href="#1543-05-11">11</a>
							</td>
							<td>
								<a href="#1543-05-12">12</a>
							</td>
							<td>
								<a href="#1543-05-13">13</a>
							</td>
							<td>
								<a href="#1543-05-14">14</a>
							</td>
							<td>
								<a href="#1543-05-15">15</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-05-16">16</a>
							</td>
							<td>
								<a href="#1543-05-17">17</a>
							</td>
							<td>
								<a href="#1543-05-18">18</a>
							</td>
							<td>
								<a href="#1543-05-19">19</a>
							</td>
							<td>
								<a href="#1543-05-20">20</a>
							</td>
							<td>
								<a href="#1543-05-21">21</a>
							</td>
							<td>
								<a href="#1543-05-22">22</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-05-23">23</a>
							</td>
							<td>
								<a href="#1543-05-24">24</a>
							</td>
							<td>
								<a href="#1543-05-25">25</a>
							</td>
							<td>
								<a href="#1543-05-26">26</a>
							</td>
							<td>
								<a href="#1543-05-27">27</a>
							</td>
							<td>
								<a href="#1543-05-28">28</a>
							</td>
							<td>
								<a href="#1543-05-29">29</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-05-30">30</a>
							</td>
							<td>
								<a href="#1543-05-31">31</a>
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
								<a href="#1543-06">June</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-06-01">1</a>
							</td>
							<td>
								<a href="#1543-06-02">2</a>
							</td>
							<td>
								<a href="#1543-06-03">3</a>
							</td>
							<td>
								<a href="#1543-06-04">4</a>
							</td>
							<td>
								<a href="#1543-06-05">5</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-06-06">6</a>
							</td>
							<td>
								<a href="#1543-06-07">7</a>
							</td>
							<td>
								<a href="#1543-06-08">8</a>
							</td>
							<td>
								<a href="#1543-06-09">9</a>
							</td>
							<td>
								<a href="#1543-06-10">10</a>
							</td>
							<td>
								<a href="#1543-06-11">11</a>
							</td>
							<td>
								<a href="#1543-06-12">12</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-06-13">13</a>
							</td>
							<td>
								<a href="#1543-06-14">14</a>
							</td>
							<td>
								<a href="#1543-06-15">15</a>
							</td>
							<td>
								<a href="#1543-06-16">16</a>
							</td>
							<td>
								<a href="#1543-06-17">17</a>
							</td>
							<td>
								<a href="#1543-06-18">18</a>
							</td>
							<td>
								<a href="#1543-06-19">19</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-06-20">20</a>
							</td>
							<td>
								<a href="#1543-06-21">21</a>
							</td>
							<td>
								<a href="#1543-06-22">22</a>
							</td>
							<td>
								<a href="#1543-06-23">23</a>
							</td>
							<td>
								<a href="#1543-06-24">24</a>
							</td>
							<td>
								<a href="#1543-06-25">25</a>
							</td>
							<td>
								<a href="#1543-06-26">26</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-06-27">27</a>
							</td>
							<td>
								<a href="#1543-06-28">28</a>
							</td>
							<td>
								<a href="#1543-06-29">29</a>
							</td>
							<td>
								<a href="#1543-06-30">30</a>
							</td>
							<td/>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-07">July</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-07-01">1</a>
							</td>
							<td>
								<a href="#1543-07-02">2</a>
							</td>
							<td>
								<a href="#1543-07-03">3</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-07-04">4</a>
							</td>
							<td>
								<a href="#1543-07-05">5</a>
							</td>
							<td>
								<a href="#1543-07-06">6</a>
							</td>
							<td>
								<a href="#1543-07-07">7</a>
							</td>
							<td>
								<a href="#1543-07-08">8</a>
							</td>
							<td>
								<a href="#1543-07-09">9</a>
							</td>
							<td>
								<a href="#1543-07-10">10</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-07-11">11</a>
							</td>
							<td>
								<a href="#1543-07-12">12</a>
							</td>
							<td>
								<a href="#1543-07-13">13</a>
							</td>
							<td>
								<a href="#1543-07-14">14</a>
							</td>
							<td>
								<a href="#1543-07-15">15</a>
							</td>
							<td>
								<a href="#1543-07-16">16</a>
							</td>
							<td>
								<a href="#1543-07-17">17</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-07-18">18</a>
							</td>
							<td>
								<a href="#1543-07-19">19</a>
							</td>
							<td>
								<a href="#1543-07-20">20</a>
							</td>
							<td>
								<a href="#1543-07-21">21</a>
							</td>
							<td>
								<a href="#1543-07-22">22</a>
							</td>
							<td>
								<a href="#1543-07-23">23</a>
							</td>
							<td>
								<a href="#1543-07-24">24</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-07-25">25</a>
							</td>
							<td>
								<a href="#1543-07-26">26</a>
							</td>
							<td>
								<a href="#1543-07-27">27</a>
							</td>
							<td>
								<a href="#1543-07-28">28</a>
							</td>
							<td>
								<a href="#1543-07-29">29</a>
							</td>
							<td>
								<a href="#1543-07-30">30</a>
							</td>
							<td>
								<a href="#1543-07-31">31</a>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-08">August</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-08-01">1</a>
							</td>
							<td>
								<a href="#1543-08-02">2</a>
							</td>
							<td>
								<a href="#1543-08-03">3</a>
							</td>
							<td>
								<a href="#1543-08-04">4</a>
							</td>
							<td>
								<a href="#1543-08-05">5</a>
							</td>
							<td>
								<a href="#1543-08-06">6</a>
							</td>
							<td>
								<a href="#1543-08-07">7</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-08-08">8</a>
							</td>
							<td>
								<a href="#1543-08-09">9</a>
							</td>
							<td>
								<a href="#1543-08-10">10</a>
							</td>
							<td>
								<a href="#1543-08-11">11</a>
							</td>
							<td>
								<a href="#1543-08-12">12</a>
							</td>
							<td>
								<a href="#1543-08-13">13</a>
							</td>
							<td>
								<a href="#1543-08-14">14</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-08-15">15</a>
							</td>
							<td>
								<a href="#1543-08-16">16</a>
							</td>
							<td>
								<a href="#1543-08-17">17</a>
							</td>
							<td>
								<a href="#1543-08-18">18</a>
							</td>
							<td>
								<a href="#1543-08-19">19</a>
							</td>
							<td>
								<a href="#1543-08-20">20</a>
							</td>
							<td>
								<a href="#1543-08-21">21</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-08-22">22</a>
							</td>
							<td>
								<a href="#1543-08-23">23</a>
							</td>
							<td>
								<a href="#1543-08-24">24</a>
							</td>
							<td>
								<a href="#1543-08-25">25</a>
							</td>
							<td>
								<a href="#1543-08-26">26</a>
							</td>
							<td>
								<a href="#1543-08-27">27</a>
							</td>
							<td>
								<a href="#1543-08-28">28</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-08-29">29</a>
							</td>
							<td>
								<a href="#1543-08-30">30</a>
							</td>
							<td>
								<a href="#1543-08-31">31</a>
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
								<a href="#1543-09">September</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-09-01">1</a>
							</td>
							<td>
								<a href="#1543-09-02">2</a>
							</td>
							<td>
								<a href="#1543-09-03">3</a>
							</td>
							<td>
								<a href="#1543-09-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-09-05">5</a>
							</td>
							<td>
								<a href="#1543-09-06">6</a>
							</td>
							<td>
								<a href="#1543-09-07">7</a>
							</td>
							<td>
								<a href="#1543-09-08">8</a>
							</td>
							<td>
								<a href="#1543-09-09">9</a>
							</td>
							<td>
								<a href="#1543-09-10">10</a>
							</td>
							<td>
								<a href="#1543-09-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-09-12">12</a>
							</td>
							<td>
								<a href="#1543-09-13">13</a>
							</td>
							<td>
								<a href="#1543-09-14">14</a>
							</td>
							<td>
								<a href="#1543-09-15">15</a>
							</td>
							<td>
								<a href="#1543-09-16">16</a>
							</td>
							<td>
								<a href="#1543-09-17">17</a>
							</td>
							<td>
								<a href="#1543-09-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-09-19">19</a>
							</td>
							<td>
								<a href="#1543-09-20">20</a>
							</td>
							<td>
								<a href="#1543-09-21">21</a>
							</td>
							<td>
								<a href="#1543-09-22">22</a>
							</td>
							<td>
								<a href="#1543-09-23">23</a>
							</td>
							<td>
								<a href="#1543-09-24">24</a>
							</td>
							<td>
								<a href="#1543-09-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-09-26">26</a>
							</td>
							<td>
								<a href="#1543-09-27">27</a>
							</td>
							<td>
								<a href="#1543-09-28">28</a>
							</td>
							<td>
								<a href="#1543-09-29">29</a>
							</td>
							<td>
								<a href="#1543-09-30">30</a>
							</td>
							<td/>
							<td/>
						</tr>
					</table>
					<table>
						<tr>
							<td colspan="5">
								<a href="#1543-10">October</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-10-01">1</a>
							</td>
							<td>
								<a href="#1543-10-02">2</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-10-03">3</a>
							</td>
							<td>
								<a href="#1543-10-04">4</a>
							</td>
							<td>
								<a href="#1543-10-05">5</a>
							</td>
							<td>
								<a href="#1543-10-06">6</a>
							</td>
							<td>
								<a href="#1543-10-07">7</a>
							</td>
							<td>
								<a href="#1543-10-08">8</a>
							</td>
							<td>
								<a href="#1543-10-09">9</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-10-10">10</a>
							</td>
							<td>
								<a href="#1543-10-11">11</a>
							</td>
							<td>
								<a href="#1543-10-12">12</a>
							</td>
							<td>
								<a href="#1543-10-13">13</a>
							</td>
							<td>
								<a href="#1543-10-14">14</a>
							</td>
							<td>
								<a href="#1543-10-15">15</a>
							</td>
							<td>
								<a href="#1543-10-16">16</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-10-17">17</a>
							</td>
							<td>
								<a href="#1543-10-18">18</a>
							</td>
							<td>
								<a href="#1543-10-19">19</a>
							</td>
							<td>
								<a href="#1543-10-20">20</a>
							</td>
							<td>
								<a href="#1543-10-21">21</a>
							</td>
							<td>
								<a href="#1543-10-22">22</a>
							</td>
							<td>
								<a href="#1543-10-23">23</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-10-24">24</a>
							</td>
							<td>
								<a href="#1543-10-25">25</a>
							</td>
							<td>
								<a href="#1543-10-26">26</a>
							</td>
							<td>
								<a href="#1543-10-27">27</a>
							</td>
							<td>
								<a href="#1543-10-28">28</a>
							</td>
							<td>
								<a href="#1543-10-29">29</a>
							</td>
							<td>
								<a href="#1543-10-30">30</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-10-31">31</a>
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
								<a href="#1543-11">November</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-11-01">1</a>
							</td>
							<td>
								<a href="#1543-11-02">2</a>
							</td>
							<td>
								<a href="#1543-11-03">3</a>
							</td>
							<td>
								<a href="#1543-11-04">4</a>
							</td>
							<td>
								<a href="#1543-11-05">5</a>
							</td>
							<td>
								<a href="#1543-11-06">6</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-11-07">7</a>
							</td>
							<td>
								<a href="#1543-11-08">8</a>
							</td>
							<td>
								<a href="#1543-11-09">9</a>
							</td>
							<td>
								<a href="#1543-11-10">10</a>
							</td>
							<td>
								<a href="#1543-11-11">11</a>
							</td>
							<td>
								<a href="#1543-11-12">12</a>
							</td>
							<td>
								<a href="#1543-11-13">13</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-11-14">14</a>
							</td>
							<td>
								<a href="#1543-11-15">15</a>
							</td>
							<td>
								<a href="#1543-11-16">16</a>
							</td>
							<td>
								<a href="#1543-11-17">17</a>
							</td>
							<td>
								<a href="#1543-11-18">18</a>
							</td>
							<td>
								<a href="#1543-11-19">19</a>
							</td>
							<td>
								<a href="#1543-11-20">20</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-11-21">21</a>
							</td>
							<td>
								<a href="#1543-11-22">22</a>
							</td>
							<td>
								<a href="#1543-11-23">23</a>
							</td>
							<td>
								<a href="#1543-11-24">24</a>
							</td>
							<td>
								<a href="#1543-11-25">25</a>
							</td>
							<td>
								<a href="#1543-11-26">26</a>
							</td>
							<td>
								<a href="#1543-11-27">27</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-11-28">28</a>
							</td>
							<td>
								<a href="#1543-11-29">29</a>
							</td>
							<td>
								<a href="#1543-11-30">30</a>
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
								<a href="#1543-12">December</a>
							</td>
							<td colspan="2">
								<a href="#1543">1543</a>
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
								<a href="#1543-12-01">1</a>
							</td>
							<td>
								<a href="#1543-12-02">2</a>
							</td>
							<td>
								<a href="#1543-12-03">3</a>
							</td>
							<td>
								<a href="#1543-12-04">4</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-12-05">5</a>
							</td>
							<td>
								<a href="#1543-12-06">6</a>
							</td>
							<td>
								<a href="#1543-12-07">7</a>
							</td>
							<td>
								<a href="#1543-12-08">8</a>
							</td>
							<td>
								<a href="#1543-12-09">9</a>
							</td>
							<td>
								<a href="#1543-12-10">10</a>
							</td>
							<td>
								<a href="#1543-12-11">11</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-12-12">12</a>
							</td>
							<td>
								<a href="#1543-12-13">13</a>
							</td>
							<td>
								<a href="#1543-12-14">14</a>
							</td>
							<td>
								<a href="#1543-12-15">15</a>
							</td>
							<td>
								<a href="#1543-12-16">16</a>
							</td>
							<td>
								<a href="#1543-12-17">17</a>
							</td>
							<td>
								<a href="#1543-12-18">18</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-12-19">19</a>
							</td>
							<td>
								<a href="#1543-12-20">20</a>
							</td>
							<td>
								<a href="#1543-12-21">21</a>
							</td>
							<td>
								<a href="#1543-12-22">22</a>
							</td>
							<td>
								<a href="#1543-12-23">23</a>
							</td>
							<td>
								<a href="#1543-12-24">24</a>
							</td>
							<td>
								<a href="#1543-12-25">25</a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="#1543-12-26">26</a>
							</td>
							<td>
								<a href="#1543-12-27">27</a>
							</td>
							<td>
								<a href="#1543-12-28">28</a>
							</td>
							<td>
								<a href="#1543-12-29">29</a>
							</td>
							<td>
								<a href="#1543-12-30">30</a>
							</td>
							<td>
								<a href="#1543-12-31">31</a>
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
				</h3>
				<ul>
					<xsl:apply-templates select=". | //tei:date[@when = $when]" mode="sub_index"/>
				</ul>
				<a href="#top">
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
</xsl:stylesheet>

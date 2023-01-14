<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs" version="3.0">
	<xsl:output method="html" encoding="UTF-8" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes"/>
	
	<xsl:template match="/" name="interfaxim">
		<xsl:apply-templates select="//tei:TEI"/>
	</xsl:template>
	<!-- VARIABLE POUR MULTIPAGES -->
<!--ATTENTION : les chemins de result document ne fonctionnent qu'en local il faut donc adapter-->
	<!--	déclaration variable pour RESULTS-DOC-->
	<xsl:variable name="basename">reppol</xsl:variable>
	<xsl:variable name="home" select="concat($basename, '_home','.html')"/>
	<xsl:variable name="about" select="concat($basename, '_project','.html')"/>
	<xsl:variable name="legals" select="concat($basename, '_about.html')"/>
	<xsl:variable name="biblio" select="concat($basename,'_biblio.html')"/>
	<xsl:variable name="pedago" select="concat($basename, '_trancriptioninteractive','.html')"/>
	<xsl:variable name="index_characters" select="concat($basename,'_indexcharacters.html')"/>
	<xsl:variable name="index_places" select="concat($basename,'_indexplaces.html')"/>
	<xsl:variable name="index_dates" select="concat($basename,'_indexdates.html')"/>
	<xsl:variable name="transcriptions" select="concat($basename,'_transcription')"/><!-- ATTENTION je n'ai pas de '.html' pour produire page de sélection et page de chacune des transcriptions -->


<!-- Variables pour links -->
	<xsl:variable name="labex" select="'https://comod.universite-lyon.fr/site-francais/'"/>
	<xsl:variable name="isite" select="'http://www.isite-ulne.fr/index.php/fr/page-daccueil/'"/>
	<xsl:variable name="meshs" select="'https://www.meshs.fr/page/accueil'"/>
	<xsl:variable name="cecille" select="'https://cecille.univ-lille.fr/'"/>
	<xsl:variable name="lahra" select="'http://larhra.ish-lyon.cnrs.fr/'"/>
	<!--	template pour HEAD-->
	<xsl:template name="head">
		<xsl:param name="title"/>
		<head>
			<meta charset="UTF-8"/>
			<meta name="author" content="Aude DE MÉZERAC-ZANETI; Olivier SPINA; Victoria LE FOURNER; Felipe GOES SILVA; Adrien MÉVEL;"/>
			<meta name="description" content="transcriptions échantillons de Cambridge, Corpus Christi College, MS 128: Documents Relating to Archbishop Cranmer, manuscrit conservé à la Parker Library"/>
			<meta name="keywords" content="XSLT,XML,TEI"/>
			<link rel="stylesheet" href="https://use.typekit.net/duu3aei.css"/>
			<link rel="icon" type="image/jpg" href="img/logo_rep_or.png"/><!--LINK ICI-->
			<link rel="stylesheet" href="reppol.css" type="text/css"/><!--LINK ICI-->
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
				<a href="files/_reppol_transcription_20221215.xml" download="" style="grid-column:3; grid-row:2"><img src="img/logo_xml.png" alt="xml"/></a>
				<a href="files/reppol_ms128.pdf" download="" style="grid-column-start:1; grid-column-end:3; grid-row:2">
					<img src="img/logo_latex" alt="latex"/>
				</a>
				<a href="https://github.com/Victorialf/RePPOL" target="blanck" style="grid-column:1;">
					<img src="img/GitHub-Mark-32px.png"/>
				</a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck" style="grid-column:2;"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_cc.png"/></a>
				<a rel="license" href="http://creativecommons.org/licenses/by/4.0/" target="blanck" style="grid-column:3;"><img alt="Licence Creative Commons" src="https://creativecommons.org/images/chooser/chooser_by.png"/></a>
				
			</div>
		</header>
	</xsl:template>
	<!--template pour SCRIPT-->
	<xsl:template name="script">
		<script>
			function lang_fr (){
			let tohide = document.getElementsByClassName('lang_en');
			let toshow = document.getElementsByClassName('lang_fr');
			for (let hide of tohide) {
			hide.style.display='none';
			}
			for (let show of toshow) {
			show.style.display='block';
			}
			}
			
			function lang_en (){
			let tohide = document.getElementsByClassName('lang_fr');
			let toshow = document.getElementsByClassName('lang_en');
			for (let hide of tohide) {
			hide.style.display='none';
			}
			for (let show of toshow) {
			show.style.display='block';
			}
			}
			
			
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
	
<!--		template pour MEMBER-->
	<xsl:template name="members">
		<section class="home project_members">
			<div class="project_member" style="grid-row-start:1; grid-column-start:1;">
				<!--<a href="https://pro.univ-lille.fr/aude-de-mezerac/" target="blanck"><img src="img/anne_boleyn.png"/></a>-->
				<p><span class="name"><a href="https://pro.univ-lille.fr/aude-de-mezerac/" target="blanck">Aude de
					Mézerac-Zanetti</a></span><br /><span class="resp">Principal investigator</span></p><!-- Coordinatrice du projet -->
			</div>
			<div class="project_member" style="grid-row-start:1; grid-column-start:2;">
				<!--<a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck"><img src="img/henry8.png"/></a>-->
				<p><span class="name"><a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a></span><br /><span class="resp">Principal investigator</span></p><!-- Coordinateur du projet -->
			</div>
			<div class="project_member">
<!--				<img src="img/elizabeth_princess.png"/>-->
				<p><span class="name">Victoria Le Fourner</span><br /><span class="resp">Digital humanities coordinator</span></p><!-- Responsable technique -->
			</div>
			<div class="project_member">
				<p><span class="name">Florence Perret</span><br /><span class="resp">Designer</span></p>
			</div>
			<div class="project_member">
<!--				<img src="img/cromwell_thomas.png"/>-->
				<p><span class="name">Felipe Goes Silva</span><br /><span class="resp">Graduate student, transcription contributor</span></p><!-- chargé de transcription -->
			</div>
			<div class="project_member">
<!--				<img src="img/gardiner_stephan.png"/>-->
				<p><span class="name">Adrien Mével</span><br /><span class="resp">Graduate student &amp; intern, encoder and digital editor</span></p><!-- chargé d'encodage, digital humanities support -->
			</div>
		</section>
		<section class="home lab">
			
			<xsl:for-each select="//tei:sponsor">
				<p><a href="{@ref}" target="blanck"><xsl:apply-templates/></a></p>
			</xsl:for-each>
		</section>
<!--			<hr/>-->
		<section class="home sponsor">
			<h2>sponsors :</h2>
			<xsl:for-each select="//tei:funder">
				<p><a href="{@ref}" target="blanck"><xsl:apply-templates/></a></p>
			</xsl:for-each>
		</section>
	</xsl:template>
<!--	DÉBUT page home-->
	<xsl:template match="tei:TEI">
		<xsl:result-document href="{$home}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'home'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
					<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
					<article id="home">
						<section class="home">
							<!--<p>Le projet RePPOL est un projet scientifique et pédagogique collaboratif consacré à la transcription, l'édition critique et l'analyse du manuscrit <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 conservé à la bibliothèque de Corpus Christi College, Cambridge</a>.</p>-->
							<h1><span class="ambroise_bold_empty">RETHINKING THE</span> <span class="ambroise_bold_filled"> PREBENDARIES PLOT</span> <span class="ambroise_bold_italic"> ONLINE</span></h1>
							<!--<p>The Rethinking Prebendaries Plot Online (RePPOL) project is a pedagogic, scientific and collaborative project dedicated to the transcription, critical edition and analysis of the <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 manuscript kept in the Parker Library</a>.</p>-->
							<button class="lang_fr" onclick="lang_en()">En</button>
							<button class="lang_en"  onclick="lang_fr()">Fr</button>
							<div class="lang_en">
								<p>Rethinking the Prebendaries Plot On Line (RePPOL) is a digital humanities project led by <a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a> (Lecturer in Early Modern History at Université de Lyon) and <a href="https://pro.univ-lille.fr/aude-de-mezerac" target="blanck">Aude de Mézerac-Zanetti</a> (Lecturer in British studies at Univeristé de Lille) with the support of Victoria Le Fourner (digital humanities co-ordinator at MESHS-Lille). Felipe Goes Silva has contributed to the transcription as part of his Masters’ thesis (Master d’Etudes Anglophones at Université de Lille) and Adrien Mével (Masters student in the Digital Edition programme of Université de Lille) is the digital humanities editor and creator of the website.</p>
								<p>RePPOL is centered on <a target="blanck" href="https://iiif.biblissima.fr/collections/manifest/e3769951f689ba0c9c1f176e56ce198d564ae43a?">MS 128 of Corpus Christi College, Cambridge</a>. The manuscript was compiled in 1543 to document religious practices in Kent and to record evidence related to the attempt by conservative clergy and laity to discredit Archbishop Thomas Cranmer. The manuscript combines testimonies of evangelical beliefs and attitudes, conservative plotting and organising and documents unorthodox practices on all sides.</p>
								<ul>
									<li><a href="{$transcriptions}">Browse the manuscript and read the diplomatic transcription</a>.</li>
									<li><a href="{$pedago}">Discover the selection of interactive pages with transcription and comments.</a></li>
									<li><a href="files/reppol_ms128.pdf" download="">Download the complete semi-diplomatic transcription.</a></li>
									<li>Use the <a href="{$index_places}">index of places</a>, the <a href="{$index_characters}">index of character names</a> and the <a href="{$index_dates}">calendar</a> to explore the MS.</li>
								</ul>
							</div>
							<div class="lang_fr">
								<p>Rethinking the Prebendaries Plot On Line (RePPOL) est un projet dirigé par <a href="https://pro.univ-lille.fr/aude-de-mezerac" target="blanck">Aude de Mézerac-Zanetti</a> (Université de Lille) et <a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a> codirigent le projet RePPOL (Rethinking the Prebendaries Plot On Line), financé par l’I-site Université Lille-Nord-Europe et par le LABEX COMOD (Université de Lyon) et soutenu pour le versant technique par Victoria Le Fourner ( ingénieure d’études à la Maison Européenne des Sciences de l’Homme de Lille). Felipe Goes Silva (étudiant en M2 Master d’Etudes Anglophones à l’Université de Lille) a contribué à la transcription du manuscrit en 2021-2022. Adrien Mével (étudiant en Master Edition Numérique à l’Université de Lille) a conçu le site internet et mis en place l’architecture numérique nécessaire à l’édition numérique du manuscrit 128. </p>
								<p>RePPOL est un projet d’humanités numériques en histoire au croisement de la recherche et de l’enseignement visant à transcrire, éditer sous format numérique puis étudier un manuscrit d’environ 250 folios conservé dans les fonds de la Parker Library (<a target="blanck" href="https://iiif.biblissima.fr/collections/manifest/e3769951f689ba0c9c1f176e56ce198d564ae43a?">Ms 128, Corpus Christi College, Cambridge</a>). Ce manuscrit rassemble des témoignages sur les pratiques religieuses dans le Kent dans les années 1540 et sur le complot monté par des clercs et des laïcs conservateurs visant à discréditer Thomas Cranmer, l’archevêque de Cantorbéry. </p>
								<p>Vous trouverez sur le site :</p>
									<ul>
										<li>La <a href="{$transcriptions}">transcription diplomatique</a> de chaque page du manuscrit.</li>
										<li>Une sélection de pages avec une <a href="{$pedago}">transcription interactive</a>.</li>
										<li><a href="files/reppol_ms128.pdf" download="">La transcription semi-diplomatique complète à télécharger.</a></li>
										<li>Des <a href="{$index_characters}">indices de personnes</a> et de <a href="{$index_places}">lieux cités</a> ainsi qu’un <a href="{$index_dates}">calendrier des dates mentionnées</a> dans le manuscrit.</li>
									</ul>
							</div>
						</section>
						<xsl:call-template name="members"/>
						
						<!--<section class="home_buttons">
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
						</section>-->
						<xsl:call-template name="footer"/>
					</article>
						
						<img class="home_img" src="img/cranmer_bichromie3.png"/>
					
					</div>
					
					<xsl:call-template name="script"/>
					
				</body>
			</html>
		</xsl:result-document>
<!--	FIN page HOME-->
<!--	DÉBUT page LEGALS-->
		<xsl:result-document href="{$legals}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'about'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
						<article id="legals">
							<h2>credits</h2>
								<h3>publisher</h3>
								<p><a href="https://www.meshs.fr/page/accueil" target="blanck">MESHS de Lille</a></p>
								<ul>
									<xsl:for-each select="//tei:addrLine">
										<li><xsl:apply-templates/></li>
									</xsl:for-each>
								</ul>
							
						<!--class="project_right" /version colonne/-->
								<!--		<!-\-<h2>The project</h2>-\->
							<p>Le projet RePPOL est un projet scientifique et pédagogique collaboratif consacré à la transcription, l'édition critique et l'analyse du manuscrit <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 conservé à la bibliothèque de Corpus Christi College, Cambridge</a>.<br />Pour en savoir plus, cliquez <a href="#moreabout">ICI</a>.</p>-->
								<h3>the team</h3>
								<ul>
									<xsl:for-each select="//tei:respStmt">
										<li>
											<xsl:apply-templates/>
										</li>
									</xsl:for-each>
								</ul>
							
		
								<h3>sponsors</h3>
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
							<!--<h3>Host</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, semper congue, euismod non, mi. Proin porttitor, orci nec nonummy molestie, enim est eleifend mi, non fermentum diam nisl sit amet erat. Duis semper. Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim. Pellentesque congue. Ut in risus volutpat libero pharetra tempor. Cras vestibulum bibendum augue. Praesent egestas leo in pede. Praesent blandit odio eu enim. Pellentesque sed dui ut augue blandit sodales. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam nibh. Mauris ac mauris sed pede pellentesque fermentum. Maecenas adipiscing ante non diam sodales hendrerit.</p>-->
							<h3>licence</h3>
							<p>The original manuscrit is stored in at the <a href="https://parker.stanford.edu/parker" target="blanck">Parker Library in Cambridge, UK</a> can be freely accessed <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">here</a></p>
							<div style="display:flex; align-items:center;">
								<p>This site and the transcription produced as part of the RePPOL project are made available under the terms of the <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Licence Creative Commons Attribution 4.0 International</a><a rel="license" href="http://creativecommons.org/licenses/by/4.0/" style="margin-left:10px;"><img alt="Licence Creative Commons" class="links" src="https://creativecommons.org/images/chooser/chooser_cc.png"/><img alt="Licence Creative Commons" class="links" src="https://creativecommons.org/images/chooser/chooser_by.png"/></a>.</p>
								
							</div>
							<!--<p>Les <a href="{$pedago}" target="blanck">transcriptions interactives</a> vous propose une démonstration sur dix pages de transcriptions interactives paléographiques et pédagogiques constituées à l'aide de la transformation <a href="https://github.com/TimotheAlbouy/Interfaxim" target="blanck">Interfaxim</a> développé par <a href="https://github.com/TimotheAlbouy" target="blanck">M. Thimothe Albouy</a>.</p>-->
							<p>The <a href="{$pedago}" target="blanck">interactive transcriptions</a> would not have been possible without the <a href="https://github.com/TimotheAlbouy/Interfaxim" target="blanck">Interfaxim</a> XSL-stylesheet developped by <a href="https://github.com/TimotheAlbouy" target="blanck">Mr Thimothe Albouy</a> and is licensed under <a href="https://choosealicense.com/licenses/mit/" target="blanck">MIT License</a>.</p>
							<!--<h3>citations</h3>
							<p>To cite the website as a whole : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, sempe</p>
							<p>To cite a particular page of the transcription : Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. Maecenas ligula massa, varius a, sempe</p>-->
							<h3>contact</h3>
							<p>To report a bug, a mistake or just to give us a thumbs up, get in touch :</p>
							<ul>
								<li><a href="https://pro.univ-lille.fr/aude-de-mezerac/" target="blanck">Aude de Mézerac-Zanetti</a></li>
								<li><a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a></li>
							</ul>
						</article>
					</div>
				</body>
			</html>
		</xsl:result-document>
<!--	FIN page LEGALS-->
<!--	DÉBUT page BIBLIO-->
		<!--<xsl:result-document href="{$biblio}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'bibliography'"/>
				</xsl:call-template>
				<body>
					<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"></xsl:with-param></xsl:call-template>
						<article id="biblio">
							<section></section>
						</article>
						<img class="home_img" src="img/cranmer_bichromie3.png"/>
					</div>
					<xsl:call-template name="script"/>
				</body>
			</html>
		</xsl:result-document>-->
<!--	FIN page BIBLIO-->
<!--	DÉBUT page ABOUT-->
		<xsl:result-document href="{$about}">
			<html>
				<xsl:call-template name="head">
					<xsl:with-param name="title" select="'project'"/>
				</xsl:call-template>
				<body><!--RIP style="background-color:#f26339;"-->
					<div class="article_container">
					<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
					<article id="about">
						<!--<section><!-\-class="project_right" /version colonne/-\->
							<!-\-		<!-\\-<h2>The project</h2>-\\->
							<p>Le projet RePPOL est un projet scientifique et pédagogique collaboratif consacré à la transcription, l'édition critique et l'analyse du manuscrit <a href="https://parker.stanford.edu/parker/catalog/ps908cx9813" target="blanck">MS 128 conservé à la bibliothèque de Corpus Christi College, Cambridge</a>.<br />Pour en savoir plus, cliquez <a href="#moreabout">ICI</a>.</p>-\->
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
						</section>-->
						<section class="home">
							<!--class="project_left" /version colonne/-->
							<button class="lang_fr" onclick="lang_en()" style="float:right;">En</button>
							<button class="lang_en"  onclick="lang_fr()" style="float:right;">Fr</button>
							<h2 class="lang_en">about the project :</h2>
							<h2 class="lang_fr">présentation générale du projet</h2>
							<!--<xsl:for-each select="//tei:projectDesc/tei:p[@xml:lang='en']">
								<p>
									<xsl:apply-templates/>
								</p>
							</xsl:for-each>-->
							<div class="lang_en">
								<p>Rethinking the Prebendaries Plot On Line (RePPOL) is a digital humanities project led by <a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a> (Lecturer in Early Modern History at Université de Lyon) and <a href="https://pro.univ-lille.fr/aude-de-mezerac" target="blanck">Aude de Mézerac-Zanetti</a> (Lecturer in British studies at Université de Lille) with the support of Victoria Le Fourner (digital humanities co-ordinator at MESHS-Lille). Felipe Goes Silva has contributed to the transcription as part of his Masters’ thesis and Adrien Mevel is the digital humanities editor, encoder and creator of the website.</p>
								<h3>A project combining scholarly and pedagogical aims</h3>
								<p>This project has been designed with two distinct aims in mind: it is both a historical investigation and a teaching tool. RePPOL consists primarily of a collaborative transcription of Corpus Christi College MS 128 which is one the principal sources for what has long been known as the “<span style="font-style:italic;">prebedendaries plot</span>”. This was at attempt by members of the chapter of Christ Church cathedral in Canterbury (the prebendaries) with the support of other clerics and members of the gentry to topple Thomas Cranmer the archbishop of Canterbury and derail his efforts at reforming his diocese. Having gathered evidence of Cranmer’s tolerance for protestant clergy, a group of conservatives wished to present their grievances to the Council and to the king. Henry VIII however charged Cranmer himself with the enquiry. Much of the evidence recorded in the course of the investigation was later gathered into MS 128. The manuscript documents heterodox religious practices by conservative and evangelical clergy and laity as well as the testimonies collected regarding the plot against Cranmer.</p>
								<h3>Transcribing MS 128</h3>
								<p>The first step of RePPOL consisted in transcribing the manuscript. This was carried out by scholars and students working collaboratively. A significant portion of the manuscript was transcribed as part of a Masters’ thesis (Master 2 d’Études Anglophones, Université de Lille). The transcription was then digitally edited by another student as part of an internship for a Masters in digital humanities (Université de Lille). The digital edition was funded by <a href="{$labex}" target="blanck">Labex COMOD (Lyon)</a> and <a href="{$isite}" target="blanck">TRANS_HYB project (Lille)</a>. </p>
								<p>The <a href="{$transcriptions}">full transcription of MS 128 is made available on the website</a> alongside each manuscript page and as a <a href="">downloadable PDF file</a>. A selection of pages with <a href="{$pedago}">interactive transcriptions and comments</a> by the editors has been designed as a teaching tool to introduce students to paleography and this source material.</p>
								<h3>Re-examining Henrician politics and religion through MS 128</h3>
								<p>MS 128 is a remarkably rich source which has been tapped by historians investigating the life of Cranmer as well as the progress of the Reformation in Kent and England. However, it has never been fully transcribed nor has it been examined as an archival entity and a working document. RePPOL intends to fill this gap in the literature and offer a rounded analysis of MS 128. We will seek to understand the way in which the folios were assembled and how this working document was used by Cranmer and his aids as testified by the numerous marginalia and marks on the text.</p>
								<p>In the next stage, we will mobilise a micro-historical perspective to explore the political and religious context of Kent in the early 1540s. The evidence collected in this manuscript showcases the ways in which ordinary subjects engaged in the political debates of the time and how discussing religious beliefs and contesting liturgical practices established rival centers of authority. The ways in which ideas circulated in print, sermons and private conversations will be examined. Although  religious unity was the proclaimed goal of Henrician England, confessional uniformity was already becoming elusive in the early 1540s. Ambiguous and shifting religious policies gave rise to diverging interpretations and heterodox practices were found both in evangelical and traditionalist circles. MS 128 provides a unique insight into the state of flux of religion under Henry VIII and documents numerous instances of ritual non-conformity.  
								</p>
								<h3>Availibility of initial outputs</h3>
								<p>To produce a rounded analysis of MS 128, the team is encoding the text in the view of using the collected data to identify networks, map speech acts and localize conflicts identifying spaces where these micro-events occur (inns, taverns, homes, churches). The first output of this approach is available under the form of an index of places and an index of persons (cross referenced to the <a href="https://theclergydatabase.org.uk/" target="blanck">CCED (Clergy of Church of England Database)</a>. Finally, a chronology of events reported in MS 128 is presented as a calendar.</p>
								<p>This is work in progress and these pages will be updated on a regular basis until March 2023.</p>
								<h3>Textual analysis and visualization</h3>
								<p>The final stage of the project consists in a rounded analysis of the text itself and the creation of visualisations of the rival networks and the flashpoints for conflicts and disputes. We are interested in uncovering and mapping unorthodox practices and the modes of expression of resistance and disagreement.</p>
								<p>RePPOL abides by the standards of open science.</p>
							</div>
							<div class="lang_fr">
								<p>Depuis 2020, <a target="blanck" href="https://pro.univ-lille.fr/aude-de-mezerac">Aude de Mézerac-Zanetti</a> (Université de Lille) et <a href="http://larhra.ish-lyon.cnrs.fr/membre/334" target="blanck">Olivier Spina</a> codirigent le projet RePPOL (Rethinking the Prebendaries Plot On Line), financé par l’<a target="blanck" href="{$isite}">I-site Université Lille-Nord-Europe</a> et par le <a target="blanck" href="{$labex}">LABEX COMOD</a> (Université de Lyon) et soutenu pour le versant technique par la <a target="blanck" href="{$meshs}">Maison Européenne des Sciences de l’Homme de Lille</a> (Victoria Le Fourner, ingénieure d’études).</p>
								<p>RePPOL est un projet d’humanités numériques en histoire au croisement de la recherche et de l’enseignement visant à transcrire, éditer sous format numérique puis étudier un manuscrit d’environ 250 folios conservé dans les fonds de la Parker Library (<a target="blanck" href="https://iiif.biblissima.fr/collections/manifest/e3769951f689ba0c9c1f176e56ce198d564ae43a?">Ms 128, Corpus Christi College, Cambridge</a>). Pour rappel, depuis le début des années 1530, l’Angleterre rompt avec Rome et la monarchie ouvre une période de réformes religieuses marquées par l’évangélisme. En 1543, Thomas Cranmer, archevêque de Cantorbéry a été dénoncé au roi Henri VIII par certains clercs du Kent plus « conservateurs ». Ces derniers, appuyés par une partie de la gentry locale, accusaient le prélat de protéger des prédicateurs hétérodoxes, pour ne pas dire hérétiques, et espéraient sa destitution. Les historiens ont dénommé cette affaire le Prebendaries Plot (le « complot des chanoines »). Cependant, le roi réitère sa confiance à Cranmer et lui confie le soin d’enquêter dans le Kent pour identifier les croyances et les pratiques déviantes (trop conservatrices ou trop réformées).</p>
								<p>Ainsi, le manuscrit Ms 128 est le fruit (incomplet) de cette enquête. Il contient plus d’une centaine d’interrogatoires menés en 1543 par les autorités royales et ecclésiales parmi la population du Kent (des clercs mais aussi de simples paroissiens) quant à leurs pratiques et croyances religieuses. Ce document permet, en tout cas, une plongée inédite dans les croyances et les pratiques liturgiques des gens du peuple dans un Kent en « transition confessionnelle », mais il permet surtout de mettre en évidence le rôle actif que les sujets, y compris les laïcs des couches modestes, jouaient dans les processus de mutations politico-religieuses de l’Angleterre henricienne. Ce manuscrit est bien connu, depuis plus d’un siècle, des historiens. Cependant, il n’a été que très partiellement exploité, et il est souvent mobilisé comme un simple réservoir d’exemples ponctuels de croyances hétérodoxes hautes en couleur. De plus, cette utilisation est indirecte, certains historiens n’utilisant le plus souvent que le calendar (analyse diplomatique) imprimé au début du XXe siècle dans les Letters and papers. </p>
								<h3>Le site REPPOL</h3>
								<p>Le site REPPOL est le fruit du travail collaboratif entre les chercheurs, les ingénieures et le stagiaire encadré par l’équipe. Ce site remplit deux fonctions : l’une est scientifique, l’autre est à visée pédagogique.</p>
								<p>Vous trouverez une <a target="blanck" href="{$transcriptions}">transcription complète</a> avec une édition semi-diplomatique au regard de chaque page du manuscrit. Pour un travail plus exhaustif sur le texte lui-même, il est possible de <a target="blanck" href="">télécharger une version pdf</a> éditée sous LaTeX afin de respecter la disposition du texte sur la page, disposition qui reflète la nature d’un manuscrit outil de travail. Ce site permet également un usage pédagogique, en particulier pour enseigner la paléographie moderne anglaise (secretary hand) :  <a target="blanck" href="{$pedago}">une sélection de pages propose une interaction directe entre le texte et la transcription</a>.</p>
								<p>Enfin le balisage du texte a permis la constitution d’un <a target="blanck" href="{$index_characters}">index des noms de personnes</a> et d’un <a target="blanck" href="{$index_places}">index des noms de lieu</a> ainsi que celle d’un <a target="blanck" href="{$index_dates}">calendrier interactif</a>.</p>
								<h3>Objectif scientifique</h3>
								<p>Le projet RePPOL entend apporter, au travers de l’exemple de l’Angleterre henricienne, un nouvel éclairage sur les processus de réformation que connait l’Europe de la première modernité. En Angleterre, l’absorption de l’Église par l’État royal et la prise en charge par les institutions monarchiques de la réformation religieuse par le biais de la suprématie royale conduisent certains sujets à questionner, à des degrés divers, l’autorité monarchique et ecclésiale, affaiblissant d’autant l’« obéissance naturelle ». En étudiant à l’échelle micro le Ms 128, on perçoit que, dans les années 1530-1540, la prédication, les imprimés, les discussions au sein des familles ou des groupes d’amis ou de voisins, mettent à la portée des Anglais un large éventail d’idées, d’arguments et de croyances plus ou moins réformés qui suscitent ou non l’adhésion. En tout cas, ces simples sujets s’en emparent pour les discuter, les critiquer, les adopter ou les dénoncer en bloc. Cette approche permet donc de réfléchir à nouveaux frais sur la création d’un État confessionnel dans l’Europe du XVIe siècle.</p>
								<p>Le projet RePPOL s’inscrit ainsi dans le renouveau historiographique qui entend déplacer la focale des seules institutions royales vers les individus et les communautés paroissiales, afin de comprendre comment s’articulent les décisions prises par la monarchie et les pratiques/croyances que l’on peut identifier au sein de la société anglaise.</p>
								<h3>Transcription et édition critique</h3>
								<p>Pour ce faire, la première partie du projet visait à transcrire intégralement le manuscrit numérisé par la Corpus Christi College au format IIIF. Dans une logique de formation par la recherche, cette transcription s’est faite de manière collaborative en associant des étudiants de master de Lille et de Lyon dans le cadre de leur cours de paléographie moderne. Ceux-ci étaient initiés à la transcription et au balisage grâce à la création d’un site dédié sur une plateforme interactive de transcription collaborative (<a target="blanck" href="https://tact.demarre-shs.fr/project/31">TACT</a>). Pendant deux ans (2020-2022), un étudiant de master en civilisation britannique, Felipe de Goes, a pris en charge, sous la direction des deux responsables, la transcription d’une centaine de folios. Il a également pu être initié à la maîtrise de l’HTML et de LaTeX.</p>
								<p>Dans une logique de « science ouverte », RePPOL entend mettre à disposition de tous les chercheurs l’édition numérique d’un document exceptionnel pour comprendre la fin du règne d’Henri VIII. Dans cette optique, le <a target="blanck" href="{$labex}">LABEX COMOD</a> a financé la gratification du stage réalisé en 2021-2022 par un autre étudiant, Adrien Mével, masterant en Humanités Numériques à l’Université de Lille. Celui-ci a travaillé, sous la direction de V. Le Fourner, à concevoir et mettre en place l’architecture numérique nécessaire à l’édition numérique du manuscrit 128. Grâce à ce travail collectif, en décembre 2022, l’intégralité du manuscrit sera disponible au téléchargement en format LateX et en consultation interactive en format HTML. Cette édition, accompagnée d’une introduction, d’indices et d’une bibliographie sera accessible à l’ensemble des chercheurs sur la plateforme <a href="https://www.huma-num.fr/" target="blanck">Huma-Num</a>, selon les principes du FAIR.</p>
								<h3>Analyse des données</h3>
								<p>Après avoir achevé l’édition numérique du manuscrit, le chantier suivant vise à <span style="font-style:italic;">traiter qualitativement et quantitativement les données récoltées</span>. À partir du printemps 2022, nous avons commencé à encoder les principales informations que nous avons estimées « utiles » à une analyse globale du texte (lieux, sexes, types de parole…). Les données doivent désormais être versées sur <a target="blanck" href="https://www.nakala.fr/">Nakala</a> (outil développé par Huma-Num) de façon à pouvoir traiter le manuscrit « à 360° » (SIG, logiciels de constitutions de réseaux, lemmatisation…). Pour respecter notre démarche de science ouverte, l’ensemble des données produites dans le cadre de RePPOL seront hébergées avec la transcription sur Huma-Num afin de rendre ces données accessibles, intelligibles, interopérables et réutilisables pour d’autres chercheurs intéressés par l’histoire de l’Angleterre du XVIe siècle ou, plus généralement, par les Réformes.</p>
								<p>Un Système d’Information Géographique (SIG) permettra d’élaborer, à partir des données récoltées, une « cartographie de la parole » à plusieurs échelles. Il s’agit de repérer dans quelles paroisses du comté du Kent les prises de paroles sont les plus fréquentes puis essayer d’expliquer cette répartition en mobilisant différents facteurs (personnalité et action du clergé local, présence d’anciens établissements monastiques, rivalités locales au sein des élites, familles identifiées comme « hérétiques » depuis plusieurs années). L’enquête croisera approche quantitative et étude micro-historique afin de réinscrire les comportements individuels dans le cadre des communautés locales auxquelles ils appartiennent. On entend ainsi saisir le rôle des cadres socio-politiques et culturels dans le choix d’embrasser telle ou telle croyance et, in fine, de comprendre comment se construit, s’enracine ou se conteste socialement une foi nouvelle. À une plus grande échelle, il faudra identifier et localiser les lieux propices aux discussions au sein des villes et villages et s’interroger sur les temporalités de ces prises de paroles.</p>
								<p>De plus, une lemmatisation du texte permettra de saisir plus précisément les croyances et pratiques liturgiques évoquées par les différents protagonistes des interrogatoires. Il s’agira d’étudier le positionnement de ces différentes croyances et pratiques par rapport à l’orthopraxie et orthodoxie henricienne et essayer d’en expliquer la genèse.</p>
								<p>Faire dialoguer deux approches à des échelles différentes permettra de mieux saisir le rôle des paroles comme accélérateurs des fracturations politico-religieuses au sein des familles, des communautés locales et, plus généralement, à l’échelle du royaume. Il faudra comprendre ce qui pousse tel individu à prendre la parole, tourner en ridicule ou s’en prendre physiquement à son voisin, son prêtre à un inconnu rencontré ou à une image installée dans l’église paroissiale depuis des années. Quels arguments mobilise-t-il ? Les comportements individuels résultent de décisions plus ou moins conscientes ou volontaires qui articulent considérations politico-religieuses (obéir ou non au roi et aux institutions), inscription au sein de structures sociales (quels choix ont fait sa famille, sa paroisse, son voisinage ?), et objectifs individuels (faire son salut).</p>
							</div>
						</section>
						<xsl:call-template name="members"/>
						<xsl:call-template name="footer"/>
					</article>
						<img class="home_img" src="img/cranmer_bichromie3.png"/>
					</div>
					<xsl:call-template name="script"/>
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
					<body><!--RIP style="background-color:#f26339;"-->
						<div class="article_container">
						<xsl:call-template name="header"><xsl:with-param name="white" select="'yes'"/></xsl:call-template><!--RIP style="background-color:#f26339;"-->
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
									<!--<div class="comment">
										<details>
											<summary>Commentaires potentiels ici</summary>
											lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet 
										</details>
									</div>-->
									<!--a priori c'est ici qu'on ajoute les commentaires pour chacune des pages dans une div
									ATTENTION conflit avec l'implémentation des zones puisque leur taille est absolue et pas relative + trouver un moyen pour bien générer le bon commentaire en face de la bonne page, dans des balises summary/details 
									peut être en ajoutant des correps aussi au truc dans le xml pour faire comme dans le script plus haut-->
								</div>
							</xsl:for-each>
						</article>
						</div>
						<xsl:call-template name="script"/>
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


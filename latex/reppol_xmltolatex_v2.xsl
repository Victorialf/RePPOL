<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl" xmlns:tei="http://www.tei-c.org/ns/1.0"
	xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs math xd tei"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Jul 21, 2022</xd:p>
			<xd:p><xd:b>Author:</xd:b> Adrien Mével</xd:p>
			<xd:p>XSL permettant le passage de xml:tei à lateX pour le projet RePPOL. S'utilise sur
				les transcriptions produites par le projet RePPOL.</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="text" encoding="UTF-8" indent="0" use-character-maps="chars"/>
<!--	<xsl:strip-space elements="*"/>-->
	<xsl:character-map name="chars">
		<xsl:output-character character="&amp;" string="\&amp;"/>
		<!--<xsl:output-character character="}" string="\}"/>-->
		<xsl:output-character character="_" string="\_"/>
		<xsl:output-character character="^" string="\^"/>
	</xsl:character-map>
	<!--<xsl:template match="text()">
		<xsl:value-of select="replace(., '&amp;', '\\&amp;')" />
<!-\-		<xsl:value-of select="replace(.,'\}','\\}')"/>-\->
<!-\-		<xsl:value-of select="replace(.,'_','\\_')"/>-\->
<!-\-		<xsl:value-of select="replace(.,'','')"/>-\->
	</xsl:template>-->
	<xsl:template match="/">
		<!--		variable pour la création du nom du fichier-->
		<xsl:variable name="doc_name" select="replace(base-uri(.), '.xml', '')"/>


		<!--			variable récupérant le numéro de page, servant également au nom du fichier-->
		
		<!-- création d'une variable pour avoir un titre par fichier -->
		<xsl:result-document href="{concat($doc_name,'.tex')}"
			><!--le nom du fichier de sortie est "nom du fichier d'origine_page_numéro de la page.tex"-->
<xsl:text>\documentclass[12pt, a4paper]{book}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}<!--embelissement-->
\usepackage[top=2cm, bottom=2cm, left=4cm, right=4cm, heightrounded, marginparwidth=3.5cm, marginparsep=0.3cm]{geometry}
\usepackage[dvipsnames]{xcolor}<!--permet l'utilisation de couleur-->
\usepackage{fancyhdr}
\usepackage{enumitem}
\usepackage{parskip} 
\usepackage{reledmac}
\usepackage{graphicx}
\usepackage{multicol}
\usepackage{ifthen}
\usepackage{hyperref}
\setlist{nosep}
\pagestyle{fancy}
\lhead{RePPOL}
\chead{MS 128}
\rhead{}
\fancyfoot[]{}
\rfoot{\thepage}
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0.3pt}
\usepackage[french, english]{babel}
\title{MS128}
\author{RePPOL project}
\date{august 2022}
\begin{document}
<!--pages de titre
avant-propos détaillant choix d'édition etc.-->

\begin{titlepage}
\includegraphics[width=\textwidth]{logo_rep_or.png}
\begin{center}
\textsc{\huge MS 128}

\small 0.7.5.4, last updated on 09/08/2022
\end{center}
\vspace{4cm}{}{}
\textbf{To cite this version :}

CITATION

\textbf{To read the ultra-diplomatic version :}

\href{}{check our website}
\vspace{2cm}{}{}

\begin{center}
This is version 0.7.5.4, last updated on 09/08/2022.
\end{center}
\begin{multicols}{2}
Le projet Rethinking the Pebendaries Plot OnLine consacré à la transcription, l’édition critique et l’analyse du manuscrit MS 128 conservé à la bibliothèque de \href{https://parker.stanford.edu/parker/catalog/ps908cx9813}{Corpus Christi College}, Cambridge est fier de vous présenter cette version pdf des transcriptions réalisées par Mme Aude de Mézerac-Zaneti, M. Olivier Spina et M. Felipe Goes-Silva.
\end{multicols}
\end{titlepage}
\begin{center}
\vspace{3cm}{}{}
\scshape{\large Notes sur la présente édition}
\end{center}
Proposer une édition d'un manuscrit aussi composite que le MS128 et dont les auteurs n'avaient sans doute jamais supposé qu'il serait un jour étudié et même édité, relève du challenge. Outre la difficulté de proposer une transcription des 220 folios qui constituent le document, la présentation elle-même du texte relève de choix/décisions pour lesquel/les des critères tels la fidélité vis-à-vis de la source, le confort de lecture et la clarté à la fois de la structure du manuscrit et de ces choix eux-même entrent en ligne de compte pour produire, autant qu'une édition destinée à la lecture, un outil de travail efficace.
Ainsi l'équipe scientifique du projet a souhaité que les annotations marginales du manuscrit soient reproduites le plus fidèlement possible. Outres des gloses ou interprétations, sans doute de la main de Thomas Cranmer, de nombreux symboles ponctuent les marges du document parmi lesquelles la lettre "n" est à concevoir comme l’abréviation de "notandum" que nous avons choisi de ne pas développer afin de permettre une meilleure lisibilité du texte. Toujours dans un souci de lisibilité, les informations structurantes, titres ou listes de témoins parfois inscrites dans la marge par la particularité d'un scribe sont reproduits dans le corps du document et annotés en bas de page.
Cette édition réalisée dans le cadre du projet RePPOL s'inscrit dans la tradition anglo-saxonne de la transcription diplomatique, ainsi exception faites des "n\textit{otandum}" marginaux les abréviations sont systématiquement développées et signalées par l'emploi de l'italique. Les additions supra- infra- ou intralinéaire sont reproduites dans le corps du texte, une note les signale. De même, les passages raturés sont conservés, une note signalant la rature et son aspect. Les numéros de folios indiqués dans le corps même du texte sont accompagnés des deux paginations présentes sur le manuscrit, reproduites afin de permettre une consultation rapide du document originel si besoin. Les passages illisibles qu'ils soient dus à la particularité d'un scribe, à un défaut de numérisation ou à un dégât du document original sont signalés par des crochets droits et parfois reconstitués par l'équipe scientifique du projet.
Enfin, si l'automatisation de la constitution de cette édition depuis un encodage XML-TEI a l'avantage de permettre un rendu rapide et d'assurer la cohérence du texte tout au long du présent document, elle peut occasionner des appels de notes qui parfois pourraient paraître disjoints, nous prions nos lecteurs de ne pas nous en tenir rigueur.
\tableofcontents
\newpage</xsl:text>
<!--			CONSTITUTION DE LA STRUCTURE DU MANUSCRIT ie chapter/section/subsection non numérottés qui s'afficheront auto dans la table of content-->
			<xsl:for-each select="//div">
				<!-- boucle sur div -->
				<xsl:choose>
					<xsl:when test="@type='collection'"><!--si c'est une collection, boîterouge = chapter-->
<xsl:text> \addcontentsline{toc}{section}{Collection </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text><xsl:text> \section*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='memorandum'">
						<!--section, boîte verte = section-->
						<xsl:text> \addcontentsline{toc}{subsection}{Memorandum </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='question_set'">
						<xsl:text> \addcontentsline{toc}{subsection}{Question set </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='answer_set'">
						<xsl:text> \addcontentsline{toc}{subsection}{Answer set </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='index'">
						<xsl:text> \addcontentsline{toc}{subsection}{Index </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='testimony'">
						<xsl:text> \addcontentsline{toc}{subsection}{Testimony </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='deposition'">
						<xsl:text> \addcontentsline{toc}{subsection}{Deposition </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \subsection*{}</xsl:text>
					</xsl:when>
					<xsl:when test="@type='article'">
						<xsl:variable name="article_n" select="preceding::div[@type='article'][1]/@n"/>
						<xsl:choose>
							<!--<xsl:when test="$article_n != '@n'">
								<xsl:text> \addcontentsline{toc}{subsection}{Article </xsl:text><xsl:value-of select="@n"/><xsl:text> </xsl:text><xsl:value-of select="descendant::head[1]"/><xsl:text>}</xsl:text>
								<xsl:text>TEST : </xsl:text>
								<xsl:text>VALEUR DE N</xsl:text><xsl:value-of select="@n"/>
								<xsl:text>VALEUR DE N PRÉCÉDENT</xsl:text><xsl:value-of select="preceding::div[@type='article']/@n"/>
								<xsl:text>VALEUR DE VARIABLE</xsl:text><xsl:value-of select="$article_n"/>
							</xsl:when>-->
							<xsl:when test="not($article_n eq @n)">
								<xsl:text> \addcontentsline{toc}{subsection}{Article </xsl:text><xsl:value-of select="@n"/><xsl:text> </xsl:text><xsl:value-of select="normalize-space(descendant::head[1])"/><xsl:text>}</xsl:text>
								<xsl:text> \subsection*{}</xsl:text>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>
					</xsl:when>
					<!--les pages lancent les traitements-->
					<xsl:when test="@type='page'">
						<xsl:variable name="page_n" select="descendant::pb[1]/@n"/>
						<xsl:variable name="doc_title" select="concat('MS128, page ', $page_n)"/>
\lfoot{<xsl:value-of select="$doc_title"/>}
<!-- test si la pag est impair pour les notes de marge -->
\ifthenelse{\isodd{\thepage}}
{\reversemarginpar}
{\normalmarginpar}
\textit{folio <xsl:value-of select="descendant::pb[1]/@n"/>}<!--on boucle sur les pages--><xsl:apply-templates/><!--\newpage-->
\dotfill
					</xsl:when>
					<xsl:otherwise/>
				</xsl:choose>
			</xsl:for-each>
			
			
			
			
			
			<!--<xsl:for-each select="//div[@type='question_set'or'answer_set'or'index'or'testimony'or'deposition'or'memorandum']">
				<xsl:text> \addcontentsline{toc}{section}{ </xsl:text><xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
			</xsl:for-each>-->
			
			<!--<xsl:for-each select="//div[@type = 'page']">
				<xsl:variable name="page_n" select="descendant::pb[1]/@n"/>
				<xsl:variable name="doc_title" select="concat('MS128, page ', $page_n)"/>
				
				\lfoot{<xsl:value-of select="$doc_title"/>}
				<!-\- test si la pag est impair pour les notes de marge -\->
				\ifthenelse{\isodd{\thepage}}
				{\reversemarginpar}
				{\normalmarginpar}
			\textit{folio <xsl:value-of select="descendant::pb[1]/@n"/>}<!-\-on boucle sur les pages-\-><xsl:apply-templates/><!-\-\newpage-\->
				\dotfill
				
			</xsl:for-each>-->
<!--			ANNEXES POTENTIELLES
				table des matières
				index personnages, lieux, dates avec page selon @key ou @ref
				index des notes marginales-->
\end{document} </xsl:result-document>
	</xsl:template>


	<!-- TEMPLATE GÉRANT LES NOTES de l'édition indiquant-->
	<xsl:template name="note">
		
		<xsl:param name="desc" as="xs:string"/><!--décrit la modification dont la note rend compte-->
		<xsl:param name="content" select="concat('&quot;' ,replace(., '\}',''), '&quot;')"/><!--récupère le contenu annoté-->
		
		<xsl:variable name="count" select="count(tokenize($content, '\W+')[. != ''])"/><!--compte le nombre de mot dans la string-->
		<xsl:choose>
			<xsl:when test="$count >= 3"><!--s'il y a plus de trois mots alors on on récupère le premier et dernier mot-->
				<xsl:variable name="tokens" select="tokenize($content, '\W+')[. != '']"/>					<xsl:text> \textit{de} </xsl:text><xsl:value-of select="concat('&quot;' ,$tokens[1],'&quot;')"/><xsl:text> \textit{à} </xsl:text><xsl:value-of select="concat('&quot;',$tokens[last()],'&quot;')"/><xsl:text> \textit{:} </xsl:text><xsl:value-of select="$desc"/>
			</xsl:when>
			<xsl:otherwise><!--sinon on imprime le contenu entier-->
				<xsl:text> </xsl:text><xsl:value-of select="$content"/><xsl:text> : </xsl:text><xsl:value-of select="$desc"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="ab">\begin{flushright}<xsl:apply-templates/>\end{flushright}</xsl:template>
	<xsl:template match="num">
		<xsl:choose>
			<xsl:when test="@subtype = 'black'">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@subtype = 'red'">{\color{Mahogany}<xsl:apply-templates/>}</xsl:when>
			<xsl:otherwise>{\color[Gray}<xsl:apply-templates/>}</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="space">
		<xsl:text>\vspace{4cm}</xsl:text>
	</xsl:template>

	<xsl:template match="head">
		<xsl:choose>
			<xsl:when test="ancestor::list[1]"/>
			<xsl:otherwise>
				\begin{center} <xsl:if test="ancestor::div[1][@type]"
					>\begin{large}</xsl:if> {\scshape <xsl:apply-templates/>} <xsl:if
						test="ancestor::div[1][@type]">\end{large}</xsl:if> \end{center}
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="expan">
		<xsl:text>\textit{</xsl:text>
		<xsl:apply-templates/>
		<xsl:text>}</xsl:text>
	</xsl:template>
	

	<!--	note-->
	<xsl:template match="note">
		<xsl:choose>
			<xsl:when test="descendant::list[1]"><xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{dans la marge.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:when test="descendant::hi[@rend=('text-align_bottom-top')or('text-align_top-bottom')]">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:when test="@rend!='margin_left'">
				<xsl:apply-templates/>
			</xsl:when>
			<xsl:otherwise>
				\marginpar[\vspace{0.5cm}{\textcolor{Gray}{<xsl:apply-templates/>}}]{}
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	<!--	p-->
	<xsl:template match="p">
		<xsl:apply-templates/>
	</xsl:template>
	<!--	LISTE-->
	<xsl:template match="list"><!--<xsl:variable name="meta" select="following-sibling::tei:metamark[1]"/>-->
		<xsl:variable name="meta"
			select="following-sibling::tei:metamark[1]"/>
		<xsl:variable name="meta_p"
			select="following-sibling::tei:p[1]/tei:metamark[1]"/>
		<xsl:variable name="meta_n"
			select="following-sibling::tei:note[1]/tei:metamark[1]"/>
		<xsl:for-each select="descendant::head">\begin{center} {\scshape <xsl:apply-templates/>} \end{center}</xsl:for-each>
		<xsl:text>\begin{itemize}</xsl:text><xsl:apply-templates/>
		<xsl:if test="$meta eq '}'"><xsl:text>\footnoteB{\textit{ une accolade fermante relie cet élément au suivant}}</xsl:text></xsl:if>
		<xsl:if test="$meta_p eq '}'"><xsl:text>\footnoteB{\textit{ une accolade fermante relie cet élément au suivant}}</xsl:text></xsl:if>
		<xsl:if test="$meta_n eq '}'"><xsl:text>\footnoteB{\textit{ une accolade fermante relie cet élément au suivant}}</xsl:text></xsl:if>
		<xsl:text>\end{itemize}</xsl:text>
		
	</xsl:template>
	<xsl:template match="item"><xsl:text>\item[]</xsl:text><xsl:apply-templates/></xsl:template>
	<!--	METAMARK-->
	<xsl:template match="metamark">
		<xsl:variable name="meta" select="."/>
		<xsl:choose>
			<xsl:when test="$meta='}'"/>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
<!-- INFRA PARAGRAPH ELEMENTS -->
	
	<xsl:template match="unclear">
		<xsl:variable name="length" select="."/>
		<xsl:choose>
			<xsl:when test="$length=''">
				[...]\footnoteB{\textit{ illisible}}
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>[</xsl:text><xsl:apply-templates/><xsl:text>]</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template match="add">
		<xsl:choose>
			<xsl:when test="@place = 'above'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{insertion supralinéaire.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:when test="@place='below'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{insertion infralinéaire.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{insertion dans le corps du texte.}'"/></xsl:call-template>}
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	
	<xsl:template match="del">
		<xsl:choose>
			<xsl:when test="@rend = 'overstrike'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{barré par une grande croix.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{barré par un trait horizontal.}'"/></xsl:call-template>}
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	
	
	
	<xsl:template match="hi">
		<xsl:choose>
			<xsl:when test="@rend='text-align_bottom-top'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{écrit de bas en haut.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:when test="@rend='text-align_top-bottom'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{écrit de haut en bas.}'"/></xsl:call-template>}
			</xsl:when>
			<xsl:when test="@rend='underline'">
				<xsl:apply-templates/>\footnoteB{<xsl:call-template name="note"><xsl:with-param name="desc" select="'\textit{souligné.}'"/></xsl:call-template>}
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	



	
</xsl:stylesheet>

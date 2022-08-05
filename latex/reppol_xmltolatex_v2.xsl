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
			><!--le nom du fichier de sortie est "nom du fichier d'origine_page_numéro de la page.tex"-->\documentclass[12pt, a4paper]{book}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{lmodern}<!--embelissement-->
\usepackage[top=2cm, bottom=2cm, left=4cm, right=4cm, heightrounded, marginparwidth=3.5cm, marginparsep=0.3cm]{geometry}
\usepackage[dvipsnames]{xcolor}<!--permet l'utilisation de couleur-->
\usepackage{fancyhdr}
\usepackage{enumitem}
\usepackage{parskip} 
\usepackage{reledmac}
%ajout 05/08
\usepackage{hyperref}
\usepackage{graphicx}
\usepackage{multicol}
%
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
<!--\maketitle-->
<!--			pages de titre
			avant-propos détaillant choix d'édition etc.-->
			%ajout 05/08
			\begin{titlepage}
			\includegraphics[width=\textwidth]{logo_rep_or.png}
			\begin{center}
			\textsc{\huge MS 128}
			
			\small 0.7.1, last updated on 05/08/2022
			\end{center}
			\vspace{4cm}{}{}
			\textbf{To cite this version :}
			
			CITATION
			
			\textbf{To read the ultra-diplomatic version :}
			
			\href{}{check our website}
			\vspace{2cm}{}{}
			
			\begin{center}
			This is version 0.7 of the edition, last updated on 05/08/2022.
			\end{center}
			\begin{multicols}{2}
			Le projet Rethinking the Pebendaries Plot OnLine consacré à la transcription, l’édition critique et l’analyse du manuscrit MS 128 conservé à la bibliothèque de \href{https://parker.stanford.edu/parker/catalog/ps908cx9813}{Corpus Christi College}, Cambridge est fier de vous présenter cette version pdf des transcriptions réalisées par Mme Aude de Mézerac-Zaneti, M. Olivier Spina et M. Felipe Goes-Silva.
			\end{multicols}
			\end{titlepage}
			\begin{center}
			\vspace{3cm}{}{}
			\scshape{\large Notes sur la présente édition}
			\end{center}
			\tableofcontents
<!--			CONSTITUTION DE LA STRUCTURE DU MANUSCRIT ie chapter/section/subsection non numérottés qui s'afficheront auto dans la table of content-->
			<!--<xsl:for-each select="//div[@type!='page']">
				<xsl:call-template name="content"/>
			</xsl:for-each>-->
			
			<xsl:for-each select="//div[@type = 'page']">
				<xsl:variable name="page_n" select="descendant::pb[1]/@n"/>
				<xsl:variable name="doc_title" select="concat('MS128, page ', $page_n)"/>
				\lfoot{<xsl:value-of select="$doc_title"/>}
			\textit{folio <xsl:value-of select="descendant::pb[1]/@n"/>}<!--on boucle sur les pages--><xsl:apply-templates/><!--\newpage-->
				\dotfill
			</xsl:for-each>
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
				\marginpar[\vspace{0.5cm}{\textcolor{Gray}{<xsl:apply-templates/>}}]
			</xsl:otherwise>
		</xsl:choose>
		
	</xsl:template>
	<!--	p-->
	<xsl:template match="p">
		<xsl:apply-templates/>
	</xsl:template>
	<!--	LISTE-->
	<xsl:template match="list"><!--<xsl:variable name="meta" select="following-sibling::tei:metamark[1]"/>-->
		<xsl:for-each select="descendant::head">\begin{center} {\scshape <xsl:apply-templates/>} \end{center}</xsl:for-each>
		<xsl:text>\begin{itemize}</xsl:text><xsl:apply-templates/><xsl:text>\end{itemize}</xsl:text>
	</xsl:template>
	<xsl:template match="item"><xsl:text>\item[]</xsl:text><xsl:apply-templates/></xsl:template>
	<!--	METAMARK-->
	<xsl:template match="metamark">
		<xsl:variable name="meta" select="."/>
		<xsl:choose>
			<xsl:when test="$meta='}'"><xsl:text>\footnoteB{\textit{ une accolade fermante relie cet élément au suivant}}</xsl:text></xsl:when>
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
		<!-- teste longueur -->
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
	



	<xsl:template name="content">
		<xsl:choose>
			<xsl:when test="@type='collection'"><!--collection, boîterouge = chapter-->
				<xsl:text> \addcontentsline{toc}{chapter}{Collection </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
				<xsl:text> \chapter*<!--[collection </xsl:text><xsl:value-of select="@n"/><xsl:text>]-->{}</xsl:text>
				<!--<xsl:apply-templates/>-->
			</xsl:when>
			<xsl:when test="@type!='collection'"><!--section, boîte verte = section-->
				<xsl:choose>
					<xsl:when test="@type = 'article'">
						<xsl:variable name="article_n" select="@n"/>
						<xsl:choose>
							<xsl:when test="$article_n = preceding::div[@type = 'article']/@n">
<!--								<xsl:apply-templates/>-->
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> \addcontentsline{toc}{section}{ </xsl:text><xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
								<xsl:text> \section*<!--[</xsl:text><xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@n"/><xsl:text>]-->{}</xsl:text>
								<xsl:apply-templates/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text> \addcontentsline{toc}{section}{ </xsl:text><xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@n"/><xsl:text>}</xsl:text>
						<xsl:text> \section*<!--[</xsl:text><xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@n"/><xsl:text>]-->{}</xsl:text>
						<xsl:apply-templates/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:when>
			<xsl:otherwise>
				<xsl:choose>
					<xsl:when test="(child::tei:head[1]) and (child::tei:div) and (ancestor::tei:div[1][@type = ('article') or ('answer_set')])"><!--sous-section, boîte orange = subsection-->
						<xsl:choose>
							<xsl:when test="@sameAs = ancestor::div[@type = 'article']/@xml:id">
								<xsl:apply-templates/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text> \addcontentsline{toc}{subsection}{ </xsl:text><xsl:value-of select="descendant::head[1]"/><xsl:text>}</xsl:text>
								<xsl:text> \subsection*<!--[</xsl:text><xsl:value-of select="descendant::head[1]"/>]-->{}</xsl:text>
								<xsl:apply-templates/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:when>
					<xsl:otherwise><!--div de plus bas niveau-->
<!--						<xsl:apply-templates/>-->
					</xsl:otherwise>
				</xsl:choose>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>

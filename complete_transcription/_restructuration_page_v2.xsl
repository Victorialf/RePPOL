<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:math="http://www.w3.org/2005/xpath-functions/math"
	xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
	xmlns:tei="http://www.tei-c.org/ns/1.0"
	exclude-result-prefixes="xs math xd"
	version="3.0">
	<xd:doc scope="stylesheet">
		<xd:desc>
			<xd:p><xd:b>Created on:</xd:b> Jul 11, 2022</xd:p>
			<xd:p><xd:b>Author:</xd:b> Adrien Mével</xd:p>
			<xd:p>Feuille xsl pour la transformation des transcriptions du projet RePPOL découpées en sections couvrant plusieurs pages en une version incluant des div représentant les pages.</xd:p>
			<xd:p>S'applique à _textecomplet_collections_sections_n.xml et produit _textecomplet_collections_sections_n_pages.xml</xd:p>
		</xd:desc>
	</xd:doc>
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	
	
	
	<xsl:template match="/">
		<xsl:apply-templates/>
	</xsl:template>
	<!--reproduction de tous les éléments avec leurs attributs, leurs valeurs leur contenus-->
	<xsl:template match="*" >
		<xsl:element name="{local-name()}">
			<xsl:for-each select="attribute()">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
<!--	repérage sous-section à cheval et repro-->
	<xsl:template match="tei:div[not(@type)][descendant::tei:pb]">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="attribute()">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
<!--			génère une id pour les div séléctionées-->
			<xsl:attribute name="xml:id">
				<xsl:value-of select="generate-id()"/>
			</xsl:attribute>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>
	
<!--	génère les ouvertures et fermetures de div, les pages en s'appliquant aux commentaires préalablement placés par script perl liant les transcriptions-->
	<xsl:template match="comment()">
		<xsl:variable name="page" select="substring-after(. ,'DÉBUT')"/>
		<xsl:variable name="page_end" select="substring-after(. ,'FIN ')"/>
		
		<xsl:comment>
			<xsl:value-of select="."/>
			
		</xsl:comment>
		
		<xsl:analyze-string select="." regex="DÉBUT \d\d\d\w?">
			<xsl:matching-substring>
				<xsl:text disable-output-escaping="1">&lt;div type="page"&gt;
</xsl:text>
			</xsl:matching-substring>
		</xsl:analyze-string>
		
		<xsl:analyze-string select="." regex="FIN \d\d\d\w?">
			<xsl:matching-substring>
<!--				
<!-\-				TESTE, comportement égalité-\->
				<xsl:if test="$page_end eq ('010')or('011')">
					<xsl:text>YESYES</xsl:text>
				</xsl:if>
				<xsl:if test="$page_end eq '009'"><xsl:text>YES</xsl:text></xsl:if>
				<xsl:if test="($page_end eq '010')or($page_end eq '011')">
					<xsl:text>OOOOOOOOOOOOOOO</xsl:text>
				</xsl:if>-->
				
				
				
				<xsl:choose>
					<xsl:when test="($page_end eq '009')or($page_end eq '010')or($page_end eq '042')or($page_end eq '043')or($page_end eq '044')or($page_end eq '048')or($page_end eq '049')or($page_end eq '053')or($page_end eq '055')or($page_end eq '056')or($page_end eq '057')or($page_end eq '060')or($page_end eq '063')or($page_end eq '067')or($page_end eq '068')or($page_end eq '069')or($page_end eq '070')or($page_end eq '071')or($page_end eq '072')or($page_end eq '075')or($page_end eq '076')or($page_end eq '077')">
						
						<!--generated via regex-->
						
<!--						génère 3 fin de div
						fin de la sous-section commencée
					soit fin de l'article commencé 
				et fin de la page-->
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text><xsl:comment>3 div refermées</xsl:comment>
					</xsl:when>
					<xsl:when test="($page_end eq '030')or($page_end eq '033')or($page_end eq '039')or($page_end eq '040')or($page_end eq '047')or($page_end eq '052')or($page_end eq '054')or($page_end eq '058')or($page_end eq '059')or($page_end eq '061')or($page_end eq '078')or($page_end eq '079')or($page_end eq '080')or($page_end eq '082')or($page_end eq '083')or($page_end eq '084')or($page_end eq '088')">
						
<!--						génère 2 fin de div, 
						soi fin de l'article commencé
					et fin de la page-->
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text>
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text><xsl:comment>2 div refermées</xsl:comment>
					</xsl:when>
					<xsl:otherwise>
						<xsl:text disable-output-escaping="yes">&lt;/div&gt;
</xsl:text><xsl:comment>1 div refermée</xsl:comment>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:matching-substring>
		</xsl:analyze-string>
	</xsl:template>
	
	
<!--	il faut ferme les div originales avant la fin de la div type=page-->
<!--	génère les nouveaux débuts d'articles et de sous-sections-->
	<xsl:template match="tei:pb">
		
		
		<xsl:for-each select="ancestor::tei:div[@type='article']">
			<xsl:text disable-output-escaping="1">&lt;div type="article" n="</xsl:text><xsl:value-of select="@n"/><xsl:text disable-output-escaping="1">"&gt;</xsl:text>
		</xsl:for-each>
<!--		génère un @sameAs renvoyant à l'id de la div précédente-->
		<xsl:for-each select="ancestor::tei:div[not(@type)]">
			<xsl:text disable-output-escaping="1">&lt;div</xsl:text><xsl:text> sameAs="</xsl:text><xsl:value-of select="generate-id()"/><xsl:text>"</xsl:text><xsl:text disable-output-escaping="1">&gt;</xsl:text>
		</xsl:for-each>
		<xsl:element name="pb">
			<xsl:for-each select="attribute()">
				<xsl:attribute name="{local-name()}"><xsl:value-of select="."/></xsl:attribute>
				
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>
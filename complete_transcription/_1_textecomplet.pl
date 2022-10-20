#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 16/05/2022 pour le projet RePPOL

use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox

#création variables et ouvertures de fichier pour écriture
my $txt = '';
open (TEXTE, ">_textecomplet.xml");#pour le texte complet
binmode(TEXTE, ":utf8");
my $fichier=1;

#OUVERTURE DE PLUSIEURS FICHIERS

	#gère les fichier 1 à 165 (inclus)
for ($fichier=1 ; $fichier<166 ; $fichier=$fichier+1) {
	# ON FAIT ATTENTION AU NOMMAGE DU COMPTEUR POUR TROUVER LES 01 ETC SI BESOIN
	if ($fichier<10) {$fichier="0$fichier";}
	if($fichier<100) {$fichier="0$fichier";}
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<o:p><\/o:p>//;#suppression d'une balise invalide (fin page 82)
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;#substitution pour ajouter une indication du début de page
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/; #substitution pour ajouter une indication de fin de page
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 166
if ($fichier eq "166"){
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 166a
if ($fichier eq "166"){
	open(CORPUS, "transcriptions/128_".$fichier."a"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier a-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier a-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 166b
if ($fichier eq "166"){
	open(CORPUS, "transcriptions/128_".$fichier."b"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier b-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier b-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 166c
if ($fichier eq "166"){
	open(CORPUS, "transcriptions/128_".$fichier."c"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier c-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier c-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 166d
if ($fichier eq "166"){
	open(CORPUS, "transcriptions/128_".$fichier."d"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier d-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier d-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

$fichier=167; #incrémentation manuelle pour lancer la boucle suivante
				#à partir de ce point toutes les boucles etc doivent être précédés d'une incrémentation manuelle écrasant celle-ci

	#gère de 167 à 263 inclus
for (my $fichier=167 ; $fichier<264 ; $fichier=$fichier+1) {
	# ON FAIT ATTENTION AU NOMMAGE DU COMPTEUR POUR TROUVER LES 01 ETC SI BESOIN
	if ($fichier<10) {$fichier="0$fichier";}
	if($fichier<100) {$fichier="0$fichier";}
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

#il manque 264 264a, 265  265a , 324 , 324a , 325 325a

$fichier=264; #need incrementation manuelle car une fois incrémentée manuellement la variable garde la valeur précédente hors boucle for
	#gère 264
if ($fichier eq "264"){
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 264a
if ($fichier eq "264"){
	open(CORPUS, "transcriptions/128_".$fichier."a"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier a-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier a-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

$fichier=265;
	#gère 265
if ($fichier eq "265"){
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 265a
if ($fichier eq "265"){
	open(CORPUS, "transcriptions/128_".$fichier."a"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier a-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier a-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

$fichier=266;
	#gère de 266 à 323 inclus
for (my $fichier=266 ; $fichier<324 ; $fichier=$fichier+1) {
	# ON FAIT ATTENTION AU NOMMAGE DU COMPTEUR POUR TROUVER LES 01 ETC SI BESOIN
	if ($fichier<10) {$fichier="0$fichier";}
	if($fichier<100) {$fichier="0$fichier";}
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

$fichier=324;
	#gère 324
if ($fichier eq "324"){
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 324a
if ($fichier eq "324"){
	open(CORPUS, "transcriptions/128_".$fichier."a"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier a-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier a-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}


$fichier=325;
	#gère 325
if ($fichier eq "325"){
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
	#gère 325a
if ($fichier eq "325"){
	open(CORPUS, "transcriptions/128_".$fichier."a"."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier a-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier a-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}

$fichier=326;
for (my $fichier=326 ; $fichier<=360 ; $fichier=$fichier+1) {
	# ON FAIT ATTENTION AU NOMMAGE DU COMPTEUR POUR TROUVER LES 01 ETC SI BESOIN
	if ($fichier<10) {$fichier="0$fichier";}
	if($fichier<100) {$fichier="0$fichier";}
	open(CORPUS, "transcriptions/128_".$fichier."_TC_46.xml");
	binmode(CORPUS, ":utf8");
	while (my $ligne = <CORPUS>) {
		chop $ligne;#découpage par ligne
		$ligne =~s/<xml><body>/<!--DÉBUT $fichier-->\n/;
		$ligne =~s/<\/body><\/xml/\n<!--FIN $fichier-->\n/;
		$txt = $txt.' '.$ligne."\n";#récupération texte complet, stockage dans une variable
	}
}
#creation de l'élément <facsimile> et ses sous-éléments
#print TEXTE "<TEI>\n";
#print TEXTE "\t<teiHeader>\n";
#print TEXTE "\t</teiHeader>\n";
print TEXTE "\t<facsimile>\n";

my $url1 ="https://stacks.stanford.edu/image/iiif/ps908cx9813/128_";
$fichier="1";
my $url2="_TC_46/full/full/0/default.jpg";


for ($fichier=1 ; $fichier<166 ; $fichier=$fichier+1) {
	if ($fichier<10) {$fichier="0$fichier";}
	if($fichier<100) {$fichier="0$fichier";}
	#will need supression de 003 et 004
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
if($fichier="166"){
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#166a
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."a"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."a"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#166b
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."b"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."b"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#166c
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."c"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."c"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#166d
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."d"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."d"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=167;
for (my $fichier=167 ; $fichier<264 ; $fichier=$fichier+1) {
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=264;
if($fichier eq "264"){
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#264a
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."a"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."a"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=265;
if($fichier eq "265"){
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#265a
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."a"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."a"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=266;
for (my $fichier=266 ; $fichier<324 ; $fichier=$fichier+1) {
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=324;
if ($fichier eq "324"){
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#324a
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."a"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."a"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=325;
if ($fichier eq "325"){
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
	#325a
	print TEXTE "\t<surface xml:id=\"fs_$fichier"."a"."\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."a"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}
$fichier=326;
for (my $fichier=326 ; $fichier<=360 ; $fichier=$fichier+1) {
	print TEXTE "\t<surface xml:id=\"fs_$fichier\">\n";
	print TEXTE "\t\t<graphic url=\"$url1"."$fichier"."$url2\"/>\n";
	print TEXTE "\t</surface>\n";
}

print TEXTE "\t</facsimile>\n";
print TEXTE "\t<text xml:id=\"reppol_trans\">\n";
print TEXTE "\t\t<body>\n";
print TEXTE "$txt\n";
print TEXTE "\t\t</body>\n";
print TEXTE "\t</text>\n";
print TEXTE "\t<text xml:id=\"calendar_trans\">\n";
print TEXTE "\t\t<body>\n";
	#le calendar ici
print TEXTE "\t\t</body>\n";
print TEXTE "\t</text>\n";
print TEXTE "</TEI>";
close (TEXTE);
close (CORPUS);
#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 16/05/2022 pour le projet RePPOL 


use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox



open (TEXTE, "_textecomplet_collections_sections.xml"); #nom à changer sans doute lorsque le script 2 sera fait
binmode(TEXTE, ":utf8");
open (TEXTEOUT, ">_textecomplet_collections_sections_n.xml");
binmode(TEXTEOUT, ":utf8");


#script pour ajouter valeur de l'attribut "n"
		#aux div type collection (version du 16/05)
		#aux div type article (version du 24/06)
		#aux div type index (version du 24/06)
		#aux div type testimony  (version du 24/06)
		#aux div type deposition (version du 24/06)
		#aux div type letter (version du 24/06)
		#aux div type question_set (version du 24/06)
		#aux div type answer_set (version du 24/06)
		#aux div type memorandum (version du 24/06)
	#ajoute <pb> et ses attributs (version du 23/06)

#lecture du fichier précedent
#écriture nouveau fichier
my $txt2='';
my $compteur_collection=0; #initialisation compteur de collection
my $compteur_article=0; #initialisation compteur d'article
my $compteur_index=0; #initialisation compteur d'index
my $compteur_testimony=0; #initialisation compteur de testimony
my $compteur_deposition=0; #initialisation compteur de deposition
my $compteur_letter=0; #initialisation compteur de letter
my $compteur_question_set=0; #initialisation compteur de question_set
my $compteur_answer_set=0; #initialisation compteur de answer_set
my $compteur_memorandum=0; #initialisation compteur de memorandum


while (my $ligne = <TEXTE>) {
	chop $ligne;#découpage par ligne
		#if ($line=~/ <!--DÉBUT 037-->/){$compteur_collection=$compteur_collection-1;}#page 036 le terme "collection" est présent dans le corps du texte, incémentant notre compteur on retire donc 1 dès qu'on sait qu'on a passé cette incrémentation indésirée
		
		#AJOUT VALEUR DE @N pour COLLECTION
	if ($ligne=~/type=\"collection\"/) {$compteur_collection=$compteur_collection+1;}
	$ligne=~s/type=\"collection\" n=\"\"/type=\"collection\" n=\"$compteur_collection\"/;
		
		#AJOUT VALEUR DE @N pour ARTICLE
	if ($ligne=~/type=\"article\"/) {$compteur_article=$compteur_article+1;}
	$ligne=~s/type=\"article\" n=\"\"/type=\"article\" n=\"$compteur_article\"/;
			#si on souhaite compter les articles selon la collection : 
				#if ($ligne=~/type=\"collection\"/) {$compteur_article=0}
				#$ligne=~s/type=\"article\" n=\"\"/type=\"article\" n=\"$compteur_collection $compteur_article\"/;

		#AJOUT VALEUR DE @N pour INDEX
	if ($ligne=~/type=\"index\"/) {$compteur_index=$compteur_index+1;}
	$ligne=~s/type=\"index\" n=\"\"/type=\"index\" n=\"$compteur_index\"/;
		
		#AJOUT VALEUR DE @N pour TESTIMONY
	if ($ligne=~/type=\"testimony\"/) {$compteur_testimony=$compteur_testimony+1;}
	$ligne=~s/type=\"testimony\" n=\"\"/type=\"testimony\" n=\"$compteur_testimony\"/;
		
		#AJOUT VALEUR DE @N pour DEPOSITION
	if ($ligne=~/type=\"deposition\"/) {$compteur_deposition=$compteur_deposition+1;}
	$ligne=~s/type=\"deposition\" n=\"\"/type=\"deposition\" n=\"$compteur_deposition\"/;
		
		#AJOUT VALEUR DE @N pour LETTER
	if ($ligne=~/type=\"letter\"/) {$compteur_letter=$compteur_letter+1;}
	$ligne=~s/type=\"letter\" n=\"\"/type=\"letter\" n=\"$compteur_letter\"/;
		
		#AJOUT VALEUR DE @N pour QUESTION_SET
	if ($ligne=~/type=\"question_set\"/) {$compteur_question_set=$compteur_question_set+1;}
	$ligne=~s/type=\"question_set\" n=\"\"/type=\"question_set\" n=\"$compteur_question_set\"/;
		
		#AJOUT VALEUR DE @N pour ANSWER_SET
	if ($ligne=~/type=\"answer_set\"/) {$compteur_answer_set=$compteur_answer_set+1;}
	$ligne=~s/type=\"answer_set\" n=\"\"/type=\"answer_set\" n=\"$compteur_answer_set\"/;
		
		#AJOUT VALEUR DE @N pour MEMORANDUM
	if ($ligne=~/type=\"memorandum\"/) {$compteur_memorandum=$compteur_memorandum+1;}
	$ligne=~s/type=\"memorandum\" n=\"\"/type=\"index\" n=\"$compteur_memorandum\"/;
	


#AJOUT DU <pb> avec @n et @facs
	$ligne=~s/<!--DÉBUT (\d\d\d\w?)-->/<!--DÉBUT $1-->\n<pb n="$1" facs="#fs_$1"\/>/;

	$txt2 = $txt2."\n".$ligne;#récupération texte complet, stockage dans une variable
	}
	print TEXTEOUT "$txt2".'>';#écriture fichier avec une balise fermante car pour x raison le dernier caractère saute à l'écriture

#fermeture des canaux
close (TEXTE);
close (TEXTEOUT);
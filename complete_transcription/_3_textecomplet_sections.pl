#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 24/06/2022 pour le projet RePPOL 


use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox


#création variables et ouvertures de fichier pour écriture
my $txt = ''; #sert à stocker le texte complet

	#SCRIPT posant les 
		#section = div typées (sauf collection déjà ajoutée et articles)
		#et leurs attributs (valeur de @n laissée vide, car un autre script s'occupe de compter)
			#(version du 24/06)

open (TEXTE, "_textecomplet_collections.xml"); #nom à changer sans doute lorsque le script 2 sera fait
binmode(TEXTE, ":utf8");
open (TEXTEOUT, ">_textecomplet_collections_sections.xml");
binmode(TEXTEOUT, ":utf8");



#creation de variables pour une écriture synthétique
my $end="\n</div>\n"; #chaîne de caractère fermant les balises
my $i="\n<div type=\"index\" n=\"\">\n";
my $m="\n<div type=\"memorandum\" n=\"\">\n";
my $qs="\n<div type=\"question_set\" n=\"\">\n";
my $as="\n<div type=\"answer_set\" n=\"\">\n";
my $l="\n<div type=\"letter\" n=\"\">\n";
my $d="\n<div type=\"deposition\" n=\"\">\n";
my $t="\n<div type=\"testimony\" n=\"\">\n";
my $ar="\n<div type=\"article\" n=\"\">\n";





#OUVERTURE
while (my $ligne = <TEXTE>) {
	chop $ligne;#découpage par ligne




#CRÉATION DES "BOÎTES ROUGES", élément <div> type=collection n =
	$ligne =~s/<!--DÉBUT 002-->/$i<!--DÉBUT 002-->/;
	$ligne =~s/<!--FIN 002-->/<!--FIN 002-->$end/;

	$ligne=~s/<!--DÉBUT 005-->/$qs<!--DÉBUT 005-->/;
	$ligne =~s/<!--FIN 005-->/<!--FIN 005-->$end/;

	$ligne=~s/<!--DÉBUT 007-->/$qs<!--DÉBUT 007-->/;
	$ligne =~s/<!--FIN 008-->/<!--FIN 008-->$end/;

	#$ligne=~s/<!--DÉBUT 009-->/<!--DÉBUT 009-->/;
	#$ligne =~s/<!--FIN 016-->/<!--FIN 016-->$end/;

	$ligne=~s/<!--DÉBUT 017-->/$t<!--DÉBUT 017-->/;
	$ligne =~s/<!--FIN 017-->/<!--FIN 017-->$end/;

	$ligne=~s/<!--DÉBUT 020-->/$m<!--DÉBUT 020-->/;
	$ligne =~s/<!--FIN 020-->/<!--FIN 020-->$end/;

	$ligne=~s/<!--DÉBUT 021-->/$qs<!--DÉBUT 021-->/;
	$ligne =~s/<!--FIN 024-->/<!--FIN 024-->$end/;

	$ligne=~s/<!--DÉBUT 025-->/$qs<!--DÉBUT 025-->/;
	$ligne =~s/<!--FIN 026-->/<!--FIN 026-->$end/;

#	$ligne=~s/<!--DÉBUT 029-->/<!--DÉBUT 029-->/;
#	$ligne =~s/<!--FIN 038-->/<!--FIN 038-->$end/;
#
#	$ligne=~s/<!--DÉBUT 039-->/<!--DÉBUT 039-->/;
#	$ligne =~s/<!--FIN 085-->/<!--FIN 085-->$end/;

#	$ligne=~s/<!--DÉBUT 087-->/<!--DÉBUT 087-->/;
#	$ligne =~s/<!--FIN 094-->/<!--FIN 094-->$end/;

	$ligne=~s/<!--DÉBUT 095-->/$l<!--DÉBUT 095-->/;
	$ligne =~s/<!--FIN 095-->/<!--FIN 095-->$end/;

	$ligne=~s/<!--DÉBUT 097-->/$qs<!--DÉBUT 097-->/;
	$ligne =~s/<!--FIN 097-->/<!--FIN 097-->$end/;

	$ligne=~s/<!--DÉBUT 099-->/$l<!--DÉBUT 099-->/;
	$ligne =~s/<!--FIN 099-->/<!--FIN 099-->$end/;

	$ligne=~s/<!--DÉBUT 101-->/$as<!--DÉBUT 101-->/;
	$ligne =~s/<!--FIN 102-->/<!--FIN 102-->$end/;

	$ligne=~s/<!--DÉBUT 103-->/$qs<!--DÉBUT 103-->/;
	$ligne =~s/<!--FIN 110-->/<!--FIN 110-->$end/;

	$ligne=~s/<!--DÉBUT 119-->/$l<!--DÉBUT 119-->/;
	$ligne =~s/<!--FIN 119-->/<!--FIN 119-->$end/;

	$ligne=~s/<!--DÉBUT 121-->/$as<!--DÉBUT 121-->/;
	$ligne =~s/<!--FIN 121-->/<!--FIN 121-->$end/;

	$ligne=~s/<!--DÉBUT 123-->/$qs<!--DÉBUT 123-->/;
	$ligne =~s/<!--FIN 123-->/<!--FIN 123-->$end/;

	$ligne=~s/<!--DÉBUT 125-->/$d<!--DÉBUT 125-->/;
	$ligne =~s/<!--FIN 127-->/<!--FIN 127-->$end/;

	$ligne=~s/<!--DÉBUT 133-->/$d<!--DÉBUT 133-->/;
	$ligne =~s/<!--FIN 133-->/<!--FIN 133-->$end/;

	$ligne=~s/<!--DÉBUT 135-->/$as<!--DÉBUT 135-->/;
	$ligne =~s/<!--FIN 137-->/<!--FIN 137-->$end/;

	$ligne=~s/<!--DÉBUT 141-->/$d<!--DÉBUT 141-->/;
	$ligne =~s/<!--FIN 144-->/<!--FIN 144-->$end/;

	$ligne=~s/<!--DÉBUT 145-->/$d<!--DÉBUT 145-->/;
	$ligne =~s/<!--FIN 151-->/<!--FIN 151-->$end/;

	$ligne=~s/<!--DÉBUT 153-->/$d<!--DÉBUT 153-->/;
	$ligne =~s/<!--FIN 153-->/<!--FIN 153-->$end/;

	$ligne=~s/<!--DÉBUT 155-->/$d<!--DÉBUT 155-->/;
	$ligne =~s/<!--FIN 155-->/<!--FIN 155-->$end/;

	$ligne=~s/<!--DÉBUT 157-->/$qs<!--DÉBUT 157-->/;
	$ligne =~s/<!--FIN 157-->/<!--FIN 157-->$end/;

	$ligne=~s/<!--DÉBUT 160-->/$as<!--DÉBUT 160-->/;
	$ligne =~s/<!--FIN 161-->/<!--FIN 161-->$end/;

	$ligne=~s/<!--DÉBUT 165-->/$as<!--DÉBUT 165-->/;
	$ligne =~s/<!--FIN 166d-->/<!--FIN 166d-->$end/;

	$ligne=~s/<!--DÉBUT 167-->/$qs<!--DÉBUT 167-->/;
	$ligne =~s/<!--FIN 169-->/<!--FIN 169-->$end/;

	$ligne=~s/<!--DÉBUT 171-->/$as<!--DÉBUT 171-->/;
	$ligne =~s/<!--FIN 172-->/<!--FIN 172-->$end/;

	$ligne=~s/<!--DÉBUT 173-->/$qs<!--DÉBUT 173-->/;
	$ligne =~s/<!--FIN 173-->/<!--FIN 173-->$end/;

	$ligne=~s/<!--DÉBUT 175-->/$as<!--DÉBUT 175-->/;
	$ligne =~s/<!--FIN 175-->/<!--FIN 175-->$end/;

	$ligne=~s/<!--DÉBUT 177-->/$l<!--DÉBUT 177-->/;
	$ligne =~s/<!--FIN 177-->/<!--FIN 177-->$end/;

	$ligne=~s/<!--DÉBUT 183-->/$d<!--DÉBUT 183-->/;
	$ligne =~s/<!--FIN 187-->/<!--FIN 187-->$end/;

	$ligne=~s/<!--DÉBUT 188-->/$l<!--DÉBUT 188-->/;
	$ligne =~s/<!--FIN 188-->/<!--FIN 188-->$end/;

	$ligne=~s/<!--DÉBUT 189-->/$l<!--DÉBUT 189-->/;
	$ligne =~s/<!--FIN 190-->/<!--FIN 190-->$end/;

	$ligne=~s/<!--DÉBUT 193-->/$d<!--DÉBUT 193-->/;
	$ligne =~s/<!--FIN 200-->/<!--FIN 200-->$end/;

	$ligne=~s/<!--DÉBUT 201-->/$l<!--DÉBUT 201-->/;
	$ligne =~s/<!--FIN 201-->/<!--FIN 201-->$end/;

	$ligne=~s/<!--DÉBUT 203-->/$d<!--DÉBUT 203-->/;
	$ligne =~s/<!--FIN 204-->/<!--FIN 204-->$end/;

	$ligne=~s/<!--DÉBUT 205-->/$l<!--DÉBUT 205-->/;
	$ligne =~s/<!--FIN 206-->/<!--FIN 206-->$end/;

	$ligne=~s/<!--DÉBUT 209-->/$m<!--DÉBUT 209-->/;
	$ligne =~s/<!--FIN 209-->/<!--FIN 209-->$end/;

	$ligne=~s/<!--DÉBUT 211-->/$as<!--DÉBUT 211-->/;
	$ligne =~s/<!--FIN 215-->/<!--FIN 215-->$end/;

	$ligne=~s/<!--DÉBUT 217-->/$qs<!--DÉBUT 217-->/;
	$ligne =~s/<!--FIN 218-->/<!--FIN 218-->$end/;

	$ligne=~s/<!--DÉBUT 219-->/$as<!--DÉBUT 219-->/;
	$ligne =~s/<!--FIN 220-->/<!--FIN 220-->$end/;

	$ligne=~s/<!--DÉBUT 221-->/$qs<!--DÉBUT 221-->/;
	$ligne =~s/<!--FIN 222-->/<!--FIN 222-->$end/;

	$ligne=~s/<!--DÉBUT 225-->/$l<!--DÉBUT 225-->/;
	$ligne =~s/<!--FIN 225-->/<!--FIN 225-->$end/;

	$ligne=~s/<!--DÉBUT 227-->/$as<!--DÉBUT 227-->/;
	$ligne =~s/<!--FIN 234-->/<!--FIN 234-->$end/;

	$ligne=~s/<!--DÉBUT 237-->/$d<!--DÉBUT 237-->/;
	$ligne =~s/<!--FIN 237-->/<!--FIN 237-->$end/;

	$ligne=~s/<!--DÉBUT 240-->/$d<!--DÉBUT 240-->/;
	$ligne =~s/<!--FIN 240-->/<!--FIN 240-->$end/;

	$ligne=~s/<!--DÉBUT 241-->/$d<!--DÉBUT 241-->/;
	$ligne =~s/<!--FIN 244-->/<!--FIN 244-->$end/;

	$ligne=~s/<!--DÉBUT 245-->/$l<!--DÉBUT 245-->/;
	$ligne =~s/<!--FIN 245-->/<!--FIN 245-->$end/;

	$ligne=~s/<!--DÉBUT 247-->/$l<!--DÉBUT 247-->/;
	$ligne =~s/<!--FIN 247-->/<!--FIN 247-->$end/;

	$ligne=~s/<!--DÉBUT 251-->/$l<!--DÉBUT 251-->/;
	$ligne =~s/<!--FIN 251-->/<!--FIN 251-->$end/;

	$ligne=~s/<!--DÉBUT 255-->/$as<!--DÉBUT 255-->/;
	$ligne =~s/<!--FIN 256-->/<!--FIN 256-->$end/;

	$ligne=~s/<!--DÉBUT 259-->/$qs<!--DÉBUT 259-->/;
	$ligne =~s/<!--FIN 261-->/<!--FIN 261-->$end/;

	$ligne=~s/<!--DÉBUT 263-->/$qs<!--DÉBUT 263-->/;
	$ligne =~s/<!--FIN 264-->/<!--FIN 264-->$end/;

	$ligne=~s/<!--DÉBUT 264a-->/$as<!--DÉBUT 264a-->/;
	$ligne =~s/<!--FIN 265-->/<!--FIN 265-->$end/;

	$ligne=~s/<!--DÉBUT 267-->/$l<!--DÉBUT 267-->/;
	$ligne =~s/<!--FIN 267-->/<!--FIN 267-->$end/;

	$ligne=~s/<!--DÉBUT 269-->/$qs<!--DÉBUT 269-->/;
	$ligne =~s/<!--FIN 270-->/<!--FIN 270-->$end/;

	$ligne=~s/<!--DÉBUT 273-->/$d<!--DÉBUT 273-->/;
	$ligne =~s/<!--FIN 276-->/<!--FIN 276-->$end/;

	$ligne=~s/<!--DÉBUT 277-->/$as<!--DÉBUT 277-->/;
	$ligne =~s/<!--FIN 279-->/<!--FIN 279-->$end/;

	$ligne=~s/<!--DÉBUT 281-->/$as<!--DÉBUT 281-->/;
	$ligne =~s/<!--FIN 286-->/<!--FIN 286-->$end/;

	$ligne=~s/<!--DÉBUT 289-->/$d<!--DÉBUT 289-->/;
	$ligne =~s/<!--FIN 290-->/<!--FIN 290-->$end/;

	$ligne=~s/<!--DÉBUT 291-->/$d<!--DÉBUT 291-->/;
	$ligne =~s/<!--FIN 291-->/<!--FIN 291-->$end/;

	$ligne=~s/<!--DÉBUT 293-->/$as<!--DÉBUT 293-->/;
	$ligne =~s/<!--FIN 293-->/<!--FIN 293-->$end/;

	$ligne=~s/<!--DÉBUT 295-->/$l<!--DÉBUT 295-->/;
	$ligne =~s/<!--FIN 296-->/<!--FIN 296-->$end/;

	$ligne=~s/<!--DÉBUT 297-->/$as<!--DÉBUT 297-->/;
	$ligne =~s/<!--FIN 299-->/<!--FIN 299-->$end/;

	$ligne=~s/<!--DÉBUT 301-->/$qs<!--DÉBUT 301-->/;
	$ligne =~s/<!--FIN 302-->/<!--FIN 302-->$end/;

	$ligne=~s/<!--DÉBUT 303-->/$as<!--DÉBUT 303-->/;
	$ligne =~s/<!--FIN 303-->/<!--FIN 303-->$end/;

	$ligne=~s/<!--DÉBUT 305-->/$l<!--DÉBUT 305-->/;
	$ligne =~s/<!--FIN 305-->/<!--FIN 305-->$end/;

	$ligne=~s/<!--DÉBUT 309-->/$d<!--DÉBUT 309-->/;
	$ligne =~s/<!--FIN 310-->/<!--FIN 310-->$end/;

	$ligne=~s/<!--DÉBUT 311-->/$d<!--DÉBUT 311-->/;
	$ligne =~s/<!--FIN 312-->/<!--FIN 312-->$end/;

	$ligne=~s/<!--DÉBUT 313-->/$d<!--DÉBUT 313-->/;
	$ligne =~s/<!--FIN 314-->/<!--FIN 314-->$end/;

	$ligne=~s/<!--DÉBUT 315-->/$d<!--DÉBUT 315-->/;
	$ligne =~s/<!--FIN 315-->/<!--FIN 315-->$end/;

#	$ligne=~s/<!--DÉBUT 323-->/<!--DÉBUT 323-->/;
#	$ligne =~s/<!--FIN 323-->/<!--FIN 323-->$end/;

	$ligne=~s/<!--DÉBUT 325-->/$l<!--DÉBUT 325-->/;
	$ligne =~s/<!--FIN 325-->/<!--FIN 325-->$end/;

	$ligne=~s/<!--DÉBUT 327-->/$as<!--DÉBUT 327-->/;
	$ligne =~s/<!--FIN 328-->/<!--FIN 328-->$end/;

	$ligne=~s/<!--DÉBUT 329-->/$l<!--DÉBUT 329-->/;
	$ligne =~s/<!--FIN 329-->/<!--FIN 329-->$end/;

	$ligne=~s/<!--DÉBUT 333-->/$qs<!--DÉBUT 333-->/;
	$ligne =~s/<!--FIN 333-->/<!--FIN 333-->$end/;

	$ligne=~s/<!--DÉBUT 335-->/$qs<!--DÉBUT 335-->/;
	$ligne =~s/<!--FIN 335-->/<!--FIN 335-->$end/;

	$ligne=~s/<!--DÉBUT 337-->/$as<!--DÉBUT 337-->/;
	$ligne =~s/<!--FIN 341-->/<!--FIN 341-->$end/;

	$ligne=~s/<!--DÉBUT 343-->/$l<!--DÉBUT 343-->/;
	$ligne =~s/<!--FIN 345-->/<!--FIN 345-->$end/;

	$ligne=~s/<!--DÉBUT 347-->/$d<!--DÉBUT 347-->/;
	$ligne =~s/<!--FIN 347-->/<!--FIN 347-->$end/;

	$ligne=~s/<!--DÉBUT 348-->/$d<!--DÉBUT 348-->/;
	$ligne =~s/<!--FIN 348-->/<!--FIN 348-->$end/;

	$ligne=~s/<!--DÉBUT 349-->/$l<!--DÉBUT 349-->/;
	$ligne =~s/<!--FIN 349-->/<!--FIN 349-->$end/;

	$ligne=~s/<!--DÉBUT 357-->/$l<!--DÉBUT 357-->/;
	$ligne =~s/<!--FIN 357-->/<!--FIN 357-->$end/;

	$ligne=~s/<!--DÉBUT 359-->/$d<!--DÉBUT 359-->/;
	$ligne =~s/<!--FIN 359-->/<!--FIN 359-->$end/;


	#gestion des articles
		#creation variable qui récupère le numéros de la page en cours
	my $page='';
	if ($ligne=~/<!--DÉBUT (\d+\w?)/){$page=$1;} 
	print $page;#verif
		#en testant la page où l'on est et la chaîne de caractère correspondant au titre/à la fin de la div type "article" on génère les balise ouvrante ($ar) et fermante ($end)

	if ($ligne=~/Serles/ && $page='009'){
		$ligne=~s/Serles/$ar<head>Serles<\/head>/;
	}
	if($ligne=~/Sandwich al<expan>ias<\/expan> Gardin<expan>er <\/expan>in <expan>ser<\/expan>mon in/ && $page='009'){
		$ligne=~s/Sandwich al<expan>ias<\/expan> Gardin<expan>er <\/expan>in <expan>ser<\/expan>mon in/$end<head>Sandwich al<expan>ias<\/expan> Gardin<expan>er <\/expan>in <expan>ser<\/expan>mon in<\/head>/;
	}




	$txt = $txt."\n".$ligne;#récupération texte complet, stockage dans une variable
}


print TEXTEOUT "$txt".'>';
close (TEXTE);
close (TEXTEOUT);
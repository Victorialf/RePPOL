#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 16/05/2022 pour le projet RePPOL 


use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox


#création variables et ouvertures de fichier pour écriture
my $txt = ''; #sert à stocker le texte complet

	#SCRIPT posant les 
		#<space> et attributs (version du 23/06)
		#div de types collection et leurs attributs (valeur de @n laissée vide, car un autre script s'occupe de compter)
			 #(version du 16/05)

open (TEXTE, "_textecomplet_clean.xml"); #nom à changer sans doute lorsque le script 2 sera fait
binmode(TEXTE, ":utf8");
open (TEXTEOUT, ">_textecomplet_collections.xml");
binmode(TEXTEOUT, ":utf8");


#OUVERTURE
while (my $ligne = <TEXTE>) {
	chop $ligne;#découpage par ligne
#AJOUTS des <spaces> avec @unit et @quantity si il est écrit "blank page"
	$ligne=~s/Blank page/<space unit="pages" quantity="1"><\/space>/;
	$ligne=~s/blank page/<space unit="pages" quantity="1"><\/space>/;
	$ligne=~s/blanke page/<space unit="pages" quantity="1"><\/space>/;
	$ligne=~s/page is blank/<space unit="pages" quantity="1"><\/space>/;


#CRÉATION DES "BOÎTES ROUGES", élément <div> type=collection n =
	$ligne =~s/<!--DÉBUT 002-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 002-->\n/;
	$ligne =~s/<!--FIN 002-->/<!--FIN 002-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 005-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 005-->\n/;
	$ligne =~s/<!--FIN 005-->/<!--FIN 005-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 007-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 007-->\n/;
	$ligne =~s/<!--FIN 008-->/<!--FIN 008-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 009-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 009-->\n/;
	$ligne =~s/<!--FIN 016-->/<!--FIN 016-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 017-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 017-->\n/;
	$ligne =~s/<!--FIN 017-->/<!--FIN 017-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 020-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 020-->\n/;
	$ligne =~s/<!--FIN 020-->/<!--FIN 020-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 021-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 021-->\n/;
	$ligne =~s/<!--FIN 024-->/<!--FIN 024-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 025-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 025-->\n/;
	$ligne =~s/<!--FIN 026-->/<!--FIN 026-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 029-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 029-->\n/;
	$ligne =~s/<!--FIN 038-->/<!--FIN 038-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 039-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 039-->\n/;
	$ligne =~s/<!--FIN 085-->/<!--FIN 085-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 087-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 087-->\n/;
	$ligne =~s/<!--FIN 094-->/<!--FIN 094-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 095-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 095-->\n/;
	$ligne =~s/<!--FIN 095-->/<!--FIN 095-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 097-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 097-->\n/;
	$ligne =~s/<!--FIN 097-->/<!--FIN 097-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 099-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 099-->\n/;
	$ligne =~s/<!--FIN 099-->/<!--FIN 099-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 101-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 101-->\n/;
	$ligne =~s/<!--FIN 102-->/<!--FIN 102-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 103-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 103-->\n/;
	$ligne =~s/<!--FIN 110-->/<!--FIN 110-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 119-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 119-->\n/;
	$ligne =~s/<!--FIN 119-->/<!--FIN 119-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 121-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 121-->\n/;
	$ligne =~s/<!--FIN 121-->/<!--FIN 121-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 123-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 123-->\n/;
	$ligne =~s/<!--FIN 123-->/<!--FIN 123-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 125-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 125-->\n/;
	$ligne =~s/<!--FIN 127-->/<!--FIN 127-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 133-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 133-->\n/;
	$ligne =~s/<!--FIN 133-->/<!--FIN 133-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 135-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 135-->\n/;
	$ligne =~s/<!--FIN 137-->/<!--FIN 137-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 141-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 141-->\n/;
	$ligne =~s/<!--FIN 144-->/<!--FIN 144-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 145-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 145-->\n/;
	$ligne =~s/<!--FIN 151-->/<!--FIN 151-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 153-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 153-->\n/;
	$ligne =~s/<!--FIN 153-->/<!--FIN 153-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 155-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 155-->\n/;
	$ligne =~s/<!--FIN 155-->/<!--FIN 155-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 157-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 157-->\n/;
	$ligne =~s/<!--FIN 157-->/<!--FIN 157-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 160-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 160-->\n/;
	$ligne =~s/<!--FIN 161-->/<!--FIN 161-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 165-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 165-->\n/;
	$ligne =~s/<!--FIN 166d-->/<!--FIN 166d-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 167-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 167-->\n/;
	$ligne =~s/<!--FIN 169-->/<!--FIN 169-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 171-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 171-->\n/;
	$ligne =~s/<!--FIN 172-->/<!--FIN 172-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 173-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 173-->\n/;
	$ligne =~s/<!--FIN 173-->/<!--FIN 173-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 175-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 175-->\n/;
	$ligne =~s/<!--FIN 175-->/<!--FIN 175-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 177-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 177-->\n/;
	$ligne =~s/<!--FIN 177-->/<!--FIN 177-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 183-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 183-->\n/;
	$ligne =~s/<!--FIN 187-->/<!--FIN 187-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 188-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 188-->\n/;
	$ligne =~s/<!--FIN 188-->/<!--FIN 188-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 189-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 189-->\n/;
	$ligne =~s/<!--FIN 190-->/<!--FIN 190-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 193-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 193-->\n/;
	$ligne =~s/<!--FIN 200-->/<!--FIN 200-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 201-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 201-->\n/;
	$ligne =~s/<!--FIN 201-->/<!--FIN 201-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 203-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 203-->\n/;
	$ligne =~s/<!--FIN 204-->/<!--FIN 204-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 205-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 205-->\n/;
	$ligne =~s/<!--FIN 206-->/<!--FIN 206-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 209-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 209-->\n/;
	$ligne =~s/<!--FIN 209-->/<!--FIN 209-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 211-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 211-->\n/;
	$ligne =~s/<!--FIN 215-->/<!--FIN 215-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 217-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 217-->\n/;
	$ligne =~s/<!--FIN 218-->/<!--FIN 218-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 219-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 219-->\n/;
	$ligne =~s/<!--FIN 220-->/<!--FIN 220-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 221-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 221-->\n/;
	$ligne =~s/<!--FIN 222-->/<!--FIN 222-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 225-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 225-->\n/;
	$ligne =~s/<!--FIN 225-->/<!--FIN 225-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 227-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 227-->\n/;
	$ligne =~s/<!--FIN 234-->/<!--FIN 234-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 237-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 237-->\n/;
	$ligne =~s/<!--FIN 237-->/<!--FIN 237-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 240-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 240-->\n/;
	$ligne =~s/<!--FIN 240-->/<!--FIN 240-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 241-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 241-->\n/;
	$ligne =~s/<!--FIN 244-->/<!--FIN 244-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 245-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 245-->\n/;
	$ligne =~s/<!--FIN 245-->/<!--FIN 245-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 247-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 247-->\n/;
	$ligne =~s/<!--FIN 247-->/<!--FIN 247-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 251-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 251-->\n/;
	$ligne =~s/<!--FIN 251-->/<!--FIN 251-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 255-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 255-->\n/;
	$ligne =~s/<!--FIN 256-->/<!--FIN 256-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 259-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 259-->\n/;
	$ligne =~s/<!--FIN 261-->/<!--FIN 261-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 263-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 263-->\n/;
	$ligne =~s/<!--FIN 264-->/<!--FIN 264-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 264a-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 264a-->\n/;
	$ligne =~s/<!--FIN 265-->/<!--FIN 265-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 267-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 267-->\n/;
	$ligne =~s/<!--FIN 267-->/<!--FIN 267-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 269-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 269-->\n/;
	$ligne =~s/<!--FIN 270-->/<!--FIN 270-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 273-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 273-->\n/;
	$ligne =~s/<!--FIN 276-->/<!--FIN 276-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 277-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 277-->\n/;
	$ligne =~s/<!--FIN 279-->/<!--FIN 279-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 281-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 281-->\n/;
	$ligne =~s/<!--FIN 286-->/<!--FIN 286-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 289-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 289-->\n/;
	$ligne =~s/<!--FIN 290-->/<!--FIN 290-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 291-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 291-->\n/;
	$ligne =~s/<!--FIN 291-->/<!--FIN 291-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 293-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 293-->\n/;
	$ligne =~s/<!--FIN 293-->/<!--FIN 293-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 295-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 295-->\n/;
	$ligne =~s/<!--FIN 296-->/<!--FIN 296-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 297-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 297-->\n/;
	$ligne =~s/<!--FIN 299-->/<!--FIN 299-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 301-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 301-->\n/;
	$ligne =~s/<!--FIN 302-->/<!--FIN 302-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 303-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 303-->\n/;
	$ligne =~s/<!--FIN 303-->/<!--FIN 303-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 305-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 305-->\n/;
	$ligne =~s/<!--FIN 305-->/<!--FIN 305-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 309-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 309-->\n/;
	$ligne =~s/<!--FIN 310-->/<!--FIN 310-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 311-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 311-->\n/;
	$ligne =~s/<!--FIN 312-->/<!--FIN 312-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 313-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 313-->\n/;
	$ligne =~s/<!--FIN 314-->/<!--FIN 314-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 315-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 315-->\n/;
	$ligne =~s/<!--FIN 315-->/<!--FIN 315-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 323-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 323-->\n/;
	$ligne =~s/<!--FIN 323-->/<!--FIN 323-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 325-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 325-->\n/;
	$ligne =~s/<!--FIN 325-->/<!--FIN 325-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 327-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 327-->\n/;
	$ligne =~s/<!--FIN 328-->/<!--FIN 328-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 329-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 329-->\n/;
	$ligne =~s/<!--FIN 329-->/<!--FIN 329-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 333-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 333-->\n/;
	$ligne =~s/<!--FIN 333-->/<!--FIN 333-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 335-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 335-->\n/;
	$ligne =~s/<!--FIN 335-->/<!--FIN 335-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 337-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 337-->\n/;
	$ligne =~s/<!--FIN 341-->/<!--FIN 341-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 343-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 343-->\n/;
	$ligne =~s/<!--FIN 345-->/<!--FIN 345-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 347-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 347-->\n/;
	$ligne =~s/<!--FIN 347-->/<!--FIN 347-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 348-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 348-->\n/;
	$ligne =~s/<!--FIN 348-->/<!--FIN 348-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 349-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 349-->\n/;
	$ligne =~s/<!--FIN 349-->/<!--FIN 349-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 357-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 357-->\n/;
	$ligne =~s/<!--FIN 357-->/<!--FIN 357-->\n<\/div>/;

	$ligne=~s/<!--DÉBUT 359-->/<div type=\"collection\" n=\"\">\n<!--DÉBUT 359-->\n/;
	$ligne =~s/<!--FIN 359-->/<!--FIN 359-->\n<\/div>/;

	$txt = $txt."\n".$ligne;#récupération texte complet, stockage dans une variable
}


print TEXTEOUT "$txt".'>';
close (TEXTE);
close (TEXTEOUT);
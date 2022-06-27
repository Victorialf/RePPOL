#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 16/05/2022 pour le projet RePPOL 


use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox


open (XML, "_textecomplet.xml");
binmode (XML, ":utf8");
open (XML2, ">_textecomplet_clean.xml");
binmode (XML2, ":utf8");

my $remplacechevron = 0;
my $txt = '';
	while (my $ligne = <XML>) {
		chop $ligne;#découpage par ligne

		#div to
		$ligne=~s/<div>//g;
		$ligne=~s/<\/div>//g;

		#em to expan
		$ligne =~s/<em>/<expan>/g;
		$ligne=~s/<\/em>/<\/expan>/g;

		#<add data-tag="add"> to <add place="">
		$ligne =~s/<add data-tag=\"add\">/<add place=\"\">/g;

		#<del data-tag="del"> to <dell rend="">
		$ligne =~s/<del data-tag=\"del\">/<del rend=\"\">/g;

		#<line data-tag="line"> deleted
		$ligne =~s/<line data-tag=\"line\">//g;
		$ligne=~s/<\/line>//g;

		#<zone data-tag="zone">
		$ligne=~s/<zone data-tag=\"zone\">//g;
		$ligne=~s/<\/zone>//g;

		#<br /> to \s
		$ligne=~s/<br \/>/ /g;
				#check si ça fonctionne sinon essaye avec \s

		#<abbr data-tag="abbr"> to <expan>
		$ligne=~s/<abbr data-tag=\"abbr\">/<expan>/g;
		$ligne=~s/<\/abbr>/<\/expan>/g;

		#<span style="white-space: pre;"> to
		$ligne=~s/<span style=\"white-space: pre;\"> <\/span>//g;

		#correction des numéros de page avec une lettre soit 
			#166 a vers 166a 
		$ligne=~s/<!--DÉBUT 166 a-->/<!--DÉBUT 166a-->/;
			#166 b vers 166b
		$ligne=~s/<!--DÉBUT 166 b-->/<!--DÉBUT 166b-->/;
			#166 c vers 166c
		$ligne=~s/<!--DÉBUT 166 c-->/<!--DÉBUT 166c-->/;
			#166 d vers 166d
		$ligne=~s/<!--DÉBUT 166 d-->/<!--DÉBUT 166d-->/;
			#264 a vers 264a
		$ligne=~s/<!--DÉBUT 264 a-->/<!--DÉBUT 264a-->/;
			#265 a vers 265a
		$ligne=~s/<!--DÉBUT 265 a-->/<!--DÉBUT 265a-->/;
			#324 a vers 324a
		$ligne=~s/<!--DÉBUT 324 a-->/<!--DÉBUT 324a-->/;
			#325 a vers 325a
		$ligne=~s/<!--DÉBUT 325 a-->/<!--DÉBUT 325a-->/;



	#traitement des "&lt;" et "&gt;" ces chevrons vides ne sont pas inscrit "<" et ">" dans la transcription mais "&lt;" et "&gt;" respectivement alors :
#Des pages 002 à 076, les "&lt;(.+?)&gt;" sont à remplacer par "<add place="">(.+?)</add>"
#Page 95 à 109, les "&lt;(.+?)&gt;" sont à remplacer par "<add place=""></add>"
#Des pages 125 à 126, les "&lt;(.+?)&gt;" sont à remplacer par "<add place="">(.+?)</add>"
#Tous les autres sont à remplacer par <unclear></unclear>
		if ($ligne=~/<!--DÉBUT 002-->/){$remplacechevron=1;}
		if ($ligne=~/<!--DÉBUT 077-->/){$remplacechevron=0;}
		if ($ligne=~/<!--DÉBUT 095-->/){$remplacechevron=1;}
		if ($ligne=~/<!--DÉBUT 110-->/){$remplacechevron=0;}
		if ($ligne=~/<!--DÉBUT 125-->/){$remplacechevron=1;}
		if ($ligne=~/<!--DÉBUT 127-->/){$remplacechevron=0;}
		if ($remplacechevron==1){
			$ligne=~s/&lt;/<add place="">/g;
			$ligne=~s/&gt;/<\/add>/g;
		}else{
			$ligne=~s/&lt;/<unclear>/g;
			$ligne=~s/&gt;/<\/unclear>/g;
		}




	#pour la page 26
		#<p dir="ltr" style="line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;"> to \s
		$ligne=~s/<p dir=\"ltr\" style=\"line-height: 1.2; margin-top: 0pt; margin-bottom: 0pt;\">/ /g;
		$ligne=~s/<\/p>/ /g;
		# <span id="docs-internal-guid-345bd0af-7fff-a1c7-802d-683a4a1e9e88"></span> to
		$ligne=~s/<span id=\"docs-internal-guid-345bd0af-7fff-a1c7-802d-683a4a1e9e88\"><\/span>//g;
		#le reste en RegEx voir plus bas
		
		$txt="$txt"."$ligne\n";
	}
	print XML2 "$txt".">";
close (XML);
close (XML2);


# pour la page 26
	#en REGEX oxygen :
			#<span style="font-size: 12pt; font-family: 'Times New Roman'; font-style: italic; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">(.+?)</span>
				#remplacer par :
				#<expan>$1</expan>


		#$ligne=~s/<span style=\"font-size: 12pt; font-family: \'Times New Roman\'; font-style: italic; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">(.*)<\/span>/<expan>$1<\/expan>/g;
	


	#en REGEX oxygen :
			#<span style="font-size: 12pt; font-family: 'Times New Roman'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;">(.+?)</span>
				#remplacer par :
					#\s$1\s
						#\s fonctionne pas dans Oxygen donc on tape juste un espace à la place
		

		#$ligne=~s/<span style=\"font-size: 12pt; font-family: \'Times New Roman\'; font-variant-numeric: normal; font-variant-east-asian: normal; vertical-align: baseline; white-space: pre-wrap;\">//g;
		#$ligne=~s/<\/span>/ /g;

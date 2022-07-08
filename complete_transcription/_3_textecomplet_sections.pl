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

open (TEXTE, "_textecomplet_collections.xml"); 
binmode(TEXTE, ":utf8");
open (TEXTEOUT, ">_textecomplet_collections_sections.xml");
binmode(TEXTEOUT, ":utf8");



#creation de variables pour une écriture synthétique
my $end="\n<\/div>\n"; #chaîne de caractère fermant les balises
my $i="\n<div type=\"index\" n=\"\">\n";
my $m="\n<div type=\"memorandum\" n=\"\">\n";
my $qs="\n<div type=\"question_set\" n=\"\">\n";
my $as="\n<div type=\"answer_set\" n=\"\">\n";
my $l="\n<div type=\"letter\" n=\"\">\n";
my $d="\n<div type=\"deposition\" n=\"\">\n";
my $t="\n<div type=\"testimony\" n=\"\">\n";
my $ar="\n<div type=\"article\" n=\"\">\n";

	my $h="\t<head>";
	my $eh="<\/head>\n";
	my $hs="\t<head rend=\"margin_left\">";
	my $se="\n<div>\n";
	my $da="<date type=\"procedure\" when=\"\">";
	my $de="<\/date>";
	my $page="";





#OUVERTURE
while (my $ligne = <TEXTE>) {
	chop $ligne;#découpage par ligne



#gestion des articles
		#creation variable qui récupère le numéros de la page en cours
	if ($ligne=~/DÉBUT (\d+\w?)/){
		$page=$1;
		#print "$page\n";
#	$ligne=~s/DÉBUT (\d+\w?)/DÉBUT $page/g #debug
	}
#en testant la page où l'on est et la chaîne de caractère correspondant au titre/à la fin de la div type "article" on génère les balise ouvrante ($ar) et fermante ($end)

#CRÉATION DES sections, élément <div> type=$__ n =
	$ligne =~s/<!--DÉBUT 002-->/$i<!--DÉBUT 002-->/;
	$ligne =~s/<!--FIN 002-->/<!--FIN 002-->$end/;

	$ligne=~s/<!--DÉBUT 005-->/$qs<!--DÉBUT 005-->/;
	$ligne =~s/<!--FIN 005-->/<!--FIN 005-->$end/;

	$ligne=~s/<!--DÉBUT 007-->/$qs<!--DÉBUT 007-->/;
	$ligne =~s/<!--FIN 008-->/<!--FIN 008-->$end/;

#pages 9-->16
	if ($page eq "009"){
		$ligne=~s/(Serles)/$ar$h$1$eh/;
		$ligne=~s/(At layname)/$se$h$1$eh/;
		$ligne=~s/(Sandwich al<expan>ias<\/expan> Gardin<expan>er <\/expan>)/$end$end$ar$h$1$eh/;
		$ligne=~s/(in <expan>ser<\/expan>mon in)/$se$h$1/;
		$ligne=~s/(Christes church )(<expan>the<\/expan> iiide sonday aft<expan>er<\/expan> xii day)(\.)/$1$da$2$de$3$eh/;
	}

	if($page eq "010"){
		$ligne=~s/(The next sonday aft<expan>er<\/expan>\.)/$end$se$h$da$1$de$eh/;
		$ligne=~s/(Shether\.)/$end$end$ar$h$1$eh/;
		$ligne=~s/(23 Apriles)( in <expan>the<\/expan> chapt<expan>er<\/expan> howse\.)/$se$h$da$1$de$2$eh/;
		$ligne=~s/(15 Maii)( at saynt Stevyns\.)/$end$se$h$da$1$de$2$eh/;
	}
	if($page eq "011"){
		$ligne=~s/(16 Septembris)( in <expan>the<\/expan> chapt<expan>er<\/expan> howse\.)/$end$se$h$da$1$de$2$eh/;
		$ligne=~s/(Sandwich al<expan>ias<\/expan> Gardin<expan>er<\/expan>)/$end$end$ar$h$1$eh/;
		$ligne=~s/( at wye )(in lent)( was)/$se$h$1$da$2$de$3/;
 		$ligne=~s/(xii month)( in <expan>the<\/expan> faire\.)/$da$1$de$2$eh/;
 		$ligne=~s/(In festo pasche)/$end$se$h$1$eh/;
 		$ligne=~s/(2do septembris)/$end$se$h$da$1$de$eh/;
 		$ligne=~s/(<!--FIN 011-->)/$end$end$1/;
	}
	if($page eq "012"){
		$ligne=~s/(The vicar of ffeversam\.)/$ar$h$1$eh/;
		$ligne=~s/(The <expan>par<\/expan>son of westbere)/$end$ar$h$1$eh/;
		$ligne=~s/(Sir humfray Cotton chantry preist at Te<expan>n<\/expan>terde)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 012-->)/$end$1/;
	}
	if($page eq "013"){
		$ligne=~s/(M<expan>emorandum<\/expan>)/$m$1/;
		$ligne=~s/(Sandwich) (bifore ca<expan>n<\/expan>delmas)( was )(xii month\.)/$end$ar$h$1$eh$se$h$da$2$de$3$da$4$de$eh/;
		if($ligne=~/Milles/){
			if ($ligne=~/Milles./){}
			else{$ligne=~s/(Milles)/$end$end$ar$h$1$eh/;}
		}
		$ligne=~s/(The Co<expan>m<\/expan>missary)/$end$ar$h$1$eh/;
		$ligne=~s/(Sandwich, Milles, Shether &amp; Serles)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 013-->)/$end$1/;
	}
	if($page eq "014"){
		$ligne=~s/(Mr<expan> Par<\/expan>kehurst p<expan>re<\/expan>bendary\.)/$ar$h$1$eh/;
		$ligne=~s/(Henry laurence of Rayname)/$end$ar$h$1$eh/;
		$ligne=~s/(Bartilmewe the surgeon)/$end$ar$h$1$eh/;
		$ligne=~s/(Blande)( <expan>the<\/expan> iiii of ffebruary last)( at Boughton)/$end$ar$h$1$eh$se$h$da$2$de$3$eh/;
		$ligne=~s/(Thomas Gymlot al<expan>ias<\/expan> Barbo<expan>ur<\/expan>)/$end$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 014-->)/$end$1/;
	}
	if($page eq "015"){
		$ligne=~s/(The vicar of Chillam\.)/$ar$h$1$eh/;
		$ligne=~s/(Mr <expan>Par<\/expan>kehurst <expan>pre<\/expan>bendary\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Sir laurence curat of)/$end$ar$h$1/;
		$ligne=~s/( Chalocke)/$1$eh/;
		$ligne=~s/(The vicar of Tenterden)/$end$ar$h$1$eh/;
		$ligne=~s/(The <expan>par<\/expan>son of Riple)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 015-->)/$end$1/;
	}
	if($page eq "016"){
		$ligne=~s/(The viker of Betrisden)/$ar$h$1$eh/;
		$ligne=~s/(John Thatcher the younger\.)/$end$ar$h$1$eh/;
		$ligne=~s/(The vicar of saynt paules in Canturbery)/$end$ar$h$1$eh/;
		$ligne=~s/(Estwell)/$end$ar$h$1$eh/;
		$ligne=~s/(William Quylter of Staple gentilman)/$end$ar$h$1$eh/;
		$ligne=~s/(The parsonne of Milton besides Caunterbury)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 016-->)/$end$1/;
	}

	$ligne=~s/<!--DÉBUT 017-->/$t<!--DÉBUT 017-->/;
	$ligne =~s/<!--FIN 017-->/<!--FIN 017-->$end/;

	$ligne=~s/<!--DÉBUT 020-->/$m<!--DÉBUT 020-->/;
	$ligne =~s/<!--FIN 020-->/<!--FIN 020-->$end/;

	$ligne=~s/<!--DÉBUT 021-->/$qs<!--DÉBUT 021-->/;
	$ligne =~s/<!--FIN 024-->/<!--FIN 024-->$end/;

	$ligne=~s/<!--DÉBUT 025-->/$qs<!--DÉBUT 025-->/;
	$ligne =~s/<!--FIN 026-->/<!--FIN 026-->$end/;

#pages 29-->38
	if($page eq "029"){
		$ligne=~s/(The <expan>par<\/expan>son of pluckley)/$ar$h$1$eh/;
		$ligne=~s/(<expan>Sir<\/expan> hu<expan>m<\/expan>fray Chirden <expan>par<\/expan>son of S<expan>aint<\/expan> Elphyns\.)/$end$ar$h$1/;
		$ligne=~s/(<expan>the<\/expan> first sonday in lent last past)/$da$1$de$eh/;
		$ligne=~s/(Vincent Ingeam\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Thomas Sawier\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Thomas Bleane of north Mongeam\.)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 029-->)/$end$1/;
	}
	if($page eq "030"){
		$ligne=~s/(Edwarde Dyngleden of Rolvynden\.)/$ar$h$1$eh/;
		$ligne=~s/(Sir Edwarde Spon<expan>er<\/expan> vicar of Boughton\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Archdiacon<expan>us<\/expan> Cantuarien<expan>sis<\/expan>)/$end$ar$h$1$eh/;
		$ligne=~s/(<expan>Sir<\/expan> Willi<expan>a<\/expan>m kempe Vicar of Northgate)/$end$ar$h$1$eh/;
	}
	if($page eq "031"){
		$ligne=~s/(Bartilmewe Joye)/$end$ar$h$1$eh/;
		$ligne=~s/(John Toftes\. Christofor levenysh,)/$end$ar$h$1/;
		$ligne=~s/(Bartylmewe Ioy )(17 Nouenbrer Anno 30)/$1$eh$se$h$da$2$de$eh/;
		$ligne=~s/(Johanna Meryweder of saynt Mildredes parish\.)/$end$end$ar$h$1$eh/;
		$ligne=~s/(Raufe the bel rynger of christes church)/$end$ar$h$1$eh/;
	#	$ligne=~s/()//;
	#	$ligne=~s/()//;
	#	$ligne=~s/()//;
		$ligne=~s/(<!--FIN 031-->)/$end$1/;
	}
	if($page eq "032"){
		$ligne=~s/(Mr Shether)/$ar$h$1$eh/;
		$ligne=~s/(Coxson peticanon of christes church)/$end$ar$h$1$eh/;
		$ligne=~s/(The <expan>par<\/expan>son of Alyngton)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 032-->)/$end$1/;
		#$ligne=~s/()//;

	}
	if($page eq "033"){
		$ligne=~s/(Orphewe curate of lyd\.)/$ar$h$1$eh/;
		$ligne=~s/(The curate of Stodm<expan>er<\/expan>sh\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Turno<expan>ur<\/expan>)/$end$ar$h$1$eh/;
	}
	if($page eq "034"){
		$ligne=~s/(<expan>Sir<\/expan> James Newname, &amp; one laurence)/$end$ar$h$1/;
		$ligne=~s/(brother to Mrs\. Mores)/$1$eh/;
		$ligne=~s/(The curate of Chartam <expan>that<\/expan> now is\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Scory\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Serles\. )(d<expan>o<\/expan>m<expan>ini<\/expan>ca 8 post trinit<expan>er<\/expan>\.)/$end$ar$h$1$eh$se$h$da$2$de$eh/;
		$ligne=~s/(<!--FIN 034-->)/$end$1/;	
	}
	if($page eq "035"){
		$ligne=~s/(Sandewiche\. )(Dominica in )(70 Anno Domini 1542)(o)/$end$ar$h$1$eh$se$h$2$da$3$de$4$eh/;
		$ligne=~s/(Dominica\. )(4ta post pascha\. Anno Domini 1543)(o)/$end$se$h$1$da$2$de$3$eh/;
		$ligne=~s/(Dominica )(3a\. Anno Domini 1533\.)/$end$se$h$1$da$2$de$eh/;
		$ligne=~s/(<!--FIN 035-->)/$end$end$1/;
		#$ligne=~s/()//;
	}
	if($page eq "036"){
		$ligne=~s/(Shether)/$ar$h$1$eh/;
		$ligne=~s/(Browne of Charteham)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 036-->)/$end$1/;
	}
	if($page eq "037"){
		$ligne=~s/(The Vicar of Chilham named)/$ar$h$1/;
		$ligne=~s/( Doctour willoughbye)/$1$eh/;
		$ligne=~s/(<!--FIN 037-->)/$end$1/;

	}
	if($page eq "038"){
		$ligne=~s/(Burgrave a bryckeleyer)/$m$1/;
		$ligne=~s/(M<expan>emorandum<\/expan>)/$end$m$1/;
		$ligne=~s/(<!--FIN 038-->)/$end$1/;
	}

#pages 39-->85
	if($page eq "039"){
		$ligne=~s/\$(Serles)\$/$ar$hs$1$eh/;
	}
	if($page eq "041"){
		$ligne=~s/(<!--FIN 041-->)/$end$1/;
	}
	if($page eq "042"){
		$ligne=~s/\$(Scorye)\$ (20 Septembre: 1543,)/$ar$h$da$2$de$eh$se$hs$1$eh/;
	}
	if($page eq "044"){
		$ligne=~s/(20 Septembre Anno 1543)(\.)/$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Shether)\$/$se$hs$1$eh/;
	}
	if($page eq "045"){
		$ligne=~s/(22 Septembris 1543)(\.)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Broke)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 045-->)/$end$end$1/;
	}
	if($page eq "046"){
		$ligne=~s/(24 Septembre Anno 1543)(\.)/$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Thomas Carden)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 046-->)/$end$end$1/;
	}
	if($page eq "047"){
		$ligne=~s/\$(Mr\. Ridley prebendary)\$ (22 Septembris 1543)/$ar$h$da$2$de$eh$se$hs$1$eh/;
		$ligne=~s/(24 Septembre 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Joan frenche)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Henry Tillet)\$/$end$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 047-->)/$end$1/;
	}
	if($page eq "048"){
		$ligne=~s/\$(Nicolas huget)\$/$se$hs$1$eh/;
		$ligne=~s/(26 Septembris Anno 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Drumme)\$/$se$hs$1$eh/;
	}
	if($page eq "050"){
		$ligne=~s/(26 Septembre 1543)(,)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Lancaster)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 050-->)/$end$end$1/;
	}
	if($page eq "051"){
		$ligne=~s/(The curate of muche Mongeham)/$ar$h$1$eh/;
		$ligne=~s/(24 Septembris Anno 1543)/$se$h$da$1$de$eh/;
		$ligne=~s/(Robert Newington )(24 Septembris)/$end$end$ar$h$1$eh$se$h$da$2/;
		$ligne=~s/( 1543)(\.)/$1$de$eh/;
		$ligne=~s/(Thomas makeblythe of Cant<expan>erbury<\/expan> barbo<expan>ur<\/expan>)/$end$end$ar$h$1$eh/;
		$ligne=~s/(26 Septembris Anno 1543)/$se$h$da$1$de$eh/;
		$ligne=~s/(<!--FIN 051-->)/$end$end$1/;
	}
	if($page eq "052"){
		$ligne=~s/(21 Septembris 1543)(\.)/$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Marget Toftes the yongar)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Margaret Toftes senio<expan>ur<\/expan>)\$/$end$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 052-->)/$end$1/;
	}
	if($page eq "053"){
		$ligne=~s/\$(M<expan>ist<\/expan>res\. Starkey)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Marget Toftes thelder)\$/$end$se$hs$1$eh/;
		$ligne=~s/\$(To Hasylden Tlunestede)\$/$end$se$hs$1$eh/;
		$ligne=~s/\$(Bett)\$/$end$se$hs$1$eh/;
	}
	if($page eq "054"){
		$ligne=~s/(22 Septembris 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Humfray Cotton preiste;)/$se$hs$1$eh\$/;
		$ligne=~s/(26 Septembris 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(The <expan>par<\/expan>son of Witchelyng)\$/$se$hs$1$eh/;
		$ligne=~s/(23 Septembris 1543)(\.)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(John Riche;)/$se$hs$1$eh\$/;
		$ligne=~s/(<!--FIN 054-->)/$end$1/;
	}
	if($page eq "055"){
		$ligne=~s/\$(John Castelen)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Wybourne)\$/$end$se$hs$1$eh/;
		$ligne=~s/\$(Chapman of Appuldore)\$/$end$se$hs$1$eh/;
		$ligne=~s/(22 Septembris 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Swan vicar of Sheldewyche)\$/$se$hs$1$eh/;
		$ligne=~s/\$(John Thatcher yonger)\$/$end$se$hs$1$eh/;
		#$ligne=~s/(22 Septembris 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Norton vicarof ffeversham)\$/$se$hs$1$eh/;
	}
	if($page eq "056"){
		$ligne=~s/(22 Septemb<expan>ris<\/expan>)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Mr\. drumme)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Mr\. Scorye)\$/$end$se$hs$1$eh/;
	}
	if($page eq "057"){
		$ligne=~s/( 21 Septembr<expan>is<\/expan> 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Strawghwyn)\$/$se$hs$1$eh/;
		$ligne=~s/(The )(vii daye of novembre A<expan>nno<\/expan> 1541)/$end$end$ar$h$1$da$2$de$eh/;
		$ligne=~s/\$(George of Cant<expan>erbury<\/expan>)\$/$se$hs$1$eh/;
	}
	if($page eq "058"){
		$ligne=~s/(26 Septembris 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Jo Starkey)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 058-->)/$end$1/;
	}
	if($page eq "059"){
		$ligne=~s/\$(Thomas Dalle)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Walmair)\$/$end$se$hs$1$eh/;
		$ligne=~s/(26 Septembr 1543)/$end$end$ar$h$da$1$de$eh/;
	}
	if($page eq "060"){
		$ligne=~s/\$(Vicar of Sttallefeld)\$/$se$hs$1$eh/;
		$ligne=~s/(23 Septembr<expan>is<\/expan>)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Jo Parkehurste)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Battersthe; Salter; Chyrden, Hardes; Nevenson; Wryte)\$/$end$se$hs$1$eh/;
	}
	if($page eq "061"){
		$ligne=~s/\$(Mr\. Commis<expan>ser<\/expan>)\$/$end$se$hs$1$eh/;
		$ligne=~s/\$(George hard<expan>es<\/expan>)\$/$end$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 061-->)/$end$1/;
	}
	if($page eq "062"){
		$ligne=~s/\$(Raynold Buckem<expan>er<\/expan>)\$/$se$hs$1$eh/;
		$ligne=~s/(21 Septembris)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Johne Benson)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Joys Benson)\$/$end$se$hs$1$eh/;
		$ligne=~s/(21 Septemb<expan>ris<\/expan> 1543)(\.)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Ric<expan>hard<\/expan>  Turner)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 062-->)/$end$end$1/;
	}
	if($page eq "063"){
		$ligne=~s/(21 Septembr<expan>is<\/expan>)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Hugh Coop<expan>er<\/expan> of Tenterden)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Archebolde of faversham)\$ (21 Septembris 1543)(\.)/$end$end$ar$h$da$2$de$3$eh$se$hs$1$eh/;
	}
	if($page eq "064"){
		$ligne=~s/(23 Septembr)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Hedcrone, Thomas Baker; john Tonge; Nicolas Tery)\$/$se$hs$1$eh/;
		$ligne=~s/\$(john ffishcocke)\$/$end$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 064-->)/$end$end$1/;
	}
	if($page eq "065"){
		$ligne=~s/(24 Septembr 1543)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Antony Ager; Simon Castlyn)\$/$se$hs$1$eh/;
		$ligne=~s/(26 Septembr<expan>is<\/expan> 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(<expan>The<\/expan> vicar of Newingto<expan>n<\/expan>)\$/$se$hs$1$eh/;
		$ligne=~s/(26 Septembr<expan>is<\/expan> 1543)(\.)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(the vicar of s\. mary)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 065-->)/$end$end$1/;
	}
	if($page eq "066"){
		$ligne=~s/(<!--DÉBUT 066-->)/$1$ar/;
		$ligne=~s/(<!--FIN 066-->)/$end$1/;
	}
	if($page eq "067"){
		$ligne=~s/(24 Septembris)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Holy)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Bland)\$ (21 Septembr<expan>is<\/expan> 1543)/$end$end$ar$h$da$2$de$eh$se$hs$1$eh/;
	}
	if($page eq "071"){
		$ligne=~s/(26 Septembr<expan>is<\/expan> 1543)(\.)/$end$end$ar$h$da$1$de$2$eh/;
		$ligne=~s/\$(Boucher)\$/$se$hs$1$eh/;
		$ligne=~s/(21 Septembr<expan>is<\/expan> 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Jo\. Toftes)\$/$se$hs$1$eh/;
	}
	if($page eq "073"){
		$ligne=~s/(<!--FIN 073-->)/$end$end$1/;
	}
	if($page eq "074"){
		$ligne=~s/(24 Septembr<expan>is<\/expan> 1543)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Christofor levenysh)\$/$se$hs$1$eh/;
		$ligne=~s/(26 Sept<expan>embris<\/expan> 1543)/$end$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Nicolas ffitzwill<expan>ia<\/expan>ms)\$/$se$hs$1$eh/;
		$ligne=~s/(<!--FIN 074-->)/$end$end$1/;
	}
	if($page eq "075"){
		$ligne=~s/(Turno<expan>ur<\/expan>)/$ar$h$1$eh/;
		$ligne=~s/(21 Septembr<expan>is<\/expan> 1543)/$end$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Nevenson)\$/$se$hs$1$eh/;
	}
	if($page eq "078"){
		$ligne=~s/(\$Concernyng )/$end$end$ar$1/;
	}
	if($page eq "081"){
		$ligne=~s/(<!--FIN 081-->)/$end$1/;
	}
	if($page eq "082"){
		$ligne=~s/(Thomas Dawby nowe <expan>par<\/expan>son of wycheling)/$ar$h$1/;
		$ligne=~s/(sumtyme Curate of Leneham)/$1$eh/;
	}
	if($page eq "084"){
		$ligne=~s/(Sir Rauf\.)/$end$ar$h$1$eh/;
		$ligne=~s/(Sir Robert a Stotte curate)/$end$ar$h$1/;
		$ligne=~s/(of Davyngton)/$1$eh/;
	}
	if($page eq "085"){
		$ligne=~s/(<!--FIN 085-->)/$end$1/;
	}
	#pages 87-->94
	if($page eq "087"){
		$ligne=~s/\$(Raynold buckmer)\$/$ar$hs$1$eh/;
		$ligne=~s/(<!--FIN 087-->)/$end$1/;
	}
	if($page eq "088"){
		$ligne=~s/\$(Visitac<expan>i<\/expan>on Nevenson)\$/$ar$hs$1$eh/;
		$ligne=~s/(To the Right honorable and o<expan>ur<\/expan> especially)/$end$ar$1/;
	}
	if($page eq "089"){
		$ligne=~s/(<!--FIN 089-->)/$end$1/;
	}
	if($page eq "090"){
		$ligne=~s/(25 Septemb<expan>ris<\/expan> 1543)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Serles)\$/$se$hs$1$eh/;
		$ligne=~s/\$(Scory)\$ (Die Ascentionis D<expan>omi<\/expan>ni 1541)/$end$end$ar$hs$1$eh$se$h$da$2$de$eh/;
		$ligne=~s/(In )(Lent 1541)/$se$h$1$da$2$de$eh/;
		$ligne=~s/\$(Drumme)\$ (In )(die penthecostes ultimo)(\.)/$end$end$ar$hs$1$eh$se$h$2$da$3$de$4$eh/;
		$ligne=~s/(<!--FIN 090-->)/$end$end$1/;
	}
	if($page eq "091"){
		$ligne=~s/(29 July Anno d<expan>omini<\/expan> R<expan>egis<\/expan>)/$ar$h$da$1$de$eh/;
		$ligne=~s/\$(Shether)\$/$se$hs$1$eh/;
		$ligne=~s/(Hugh Coo<expan>per<\/expan>\.)/$end$end$ar$h$1$eh/;
		$ligne=~s/(George Hardes\.)/$end$ar$h$1$eh/;
		$ligne=~s/(<!--FIN 091-->)/$end$1/;
	}
	if($page eq "092"){
		$ligne=~s/\$(Strawyn)\$/$ar$hs$1$eh/;
		$ligne=~s/\$(Swan vicar of Sheldewiche)\$/$end$ar$hs$1$eh/;
		$ligne=~s/\$(John Benson)\$/$end$ar$hs$1$eh/;
		$ligne=~s/\$(Joyce Benson)\$/$end$ar$hs$1$eh/;
		$ligne=~s/(<!--FIN 092-->)/$end$1/;
	}
	if($page eq "093"){
		$ligne=~s/\$(Turno<expan>ur<\/expan>)\$/$ar$hs$1$eh/;
		$ligne=~s/\$(Humphrey Cotton preest)\$/$end$ar$hs$1$eh/;
		$ligne=~s/\$(Nicolas ffitzwilliam)\$/$end$ar$hs$1$eh/;
		$ligne=~s/(<!--FIN 093-->)/$end$1/;
	}
	if($page eq "094"){
		$ligne=~s/\$(Hasilden)\$/$ar$hs$1$eh/;
		$ligne=~s/\$(John Thatcher Junior)\$/$end$ar$hs$1$eh/;
		$ligne=~s/(<!--FIN 094-->)/$end$1/;
	}

	$ligne=~s/<!--DÉBUT 095-->/$l<!--DÉBUT 095-->/;
	$ligne=~s/<!--FIN 095-->/<!--FIN 095-->$end/;

	$ligne=~s/<!--DÉBUT 097-->/$qs<!--DÉBUT 097-->/;
	$ligne=~s/<!--FIN 097-->/<!--FIN 097-->$end/;

	$ligne=~s/<!--DÉBUT 099-->/$l<!--DÉBUT 099-->/;
	$ligne=~s/<!--FIN 099-->/<!--FIN 099-->$end/;

	$ligne=~s/<!--DÉBUT 101-->/$as<!--DÉBUT 101-->/;
	$ligne=~s/<!--FIN 102-->/<!--FIN 102-->$end/;

	$ligne=~s/<!--DÉBUT 103-->/$qs<!--DÉBUT 103-->/;
	$ligne=~s/<!--FIN 110-->/<!--FIN 110-->$end/;

	$ligne=~s/<!--DÉBUT 119-->/$l<!--DÉBUT 119-->/;
	$ligne=~s/<!--FIN 119-->/<!--FIN 119-->$end/;

	$ligne=~s/<!--DÉBUT 121-->/$as<!--DÉBUT 121-->/;
	$ligne=~s/<!--FIN 121-->/<!--FIN 121-->$end/;

	$ligne=~s/<!--DÉBUT 123-->/$qs<!--DÉBUT 123-->/;
	$ligne=~s/<!--FIN 123-->/<!--FIN 123-->$end/;

	$ligne=~s/<!--DÉBUT 125-->/$d<!--DÉBUT 125-->/;
	$ligne=~s/<!--FIN 127-->/<!--FIN 127-->$end/;

	$ligne=~s/<!--DÉBUT 133-->/$d<!--DÉBUT 133-->/;
	$ligne=~s/<!--FIN 133-->/<!--FIN 133-->$end/;

	$ligne=~s/<!--DÉBUT 135-->/$as<!--DÉBUT 135-->/;
	$ligne=~s/<!--FIN 137-->/<!--FIN 137-->$end/;

	$ligne=~s/<!--DÉBUT 141-->/$d<!--DÉBUT 141-->/;
	$ligne=~s/<!--FIN 144-->/<!--FIN 144-->$end/;

	$ligne=~s/<!--DÉBUT 145-->/$d<!--DÉBUT 145-->/;
	$ligne=~s/<!--FIN 151-->/<!--FIN 151-->$end/;

	$ligne=~s/<!--DÉBUT 153-->/$d<!--DÉBUT 153-->/;
	$ligne=~s/<!--FIN 153-->/<!--FIN 153-->$end/;

	$ligne=~s/<!--DÉBUT 155-->/$d<!--DÉBUT 155-->/;
	$ligne=~s/<!--FIN 155-->/<!--FIN 155-->$end/;

	$ligne=~s/<!--DÉBUT 157-->/$qs<!--DÉBUT 157-->/;
	$ligne=~s/<!--FIN 157-->/<!--FIN 157-->$end/;

	$ligne=~s/<!--DÉBUT 160-->/$as<!--DÉBUT 160-->/;
	$ligne=~s/<!--FIN 161-->/<!--FIN 161-->$end/;

	$ligne=~s/<!--DÉBUT 165-->/$as<!--DÉBUT 165-->/;
	$ligne=~s/<!--FIN 166d-->/<!--FIN 166d-->$end/;

	$ligne=~s/<!--DÉBUT 167-->/$qs<!--DÉBUT 167-->/;
	$ligne=~s/<!--FIN 169-->/<!--FIN 169-->$end/;

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

	
	$txt = $txt."\n".$ligne;#récupération texte complet, stockage dans une variable
}


print TEXTEOUT "$txt".'>';
close (TEXTE);
close (TEXTEOUT);

#pense-bête, gestion des articles pages à pages
#	if($page eq "014"){
#		$ligne=~s/()//;
#		$ligne=~s/()//;
#		$ligne=~s/()//;
#		$ligne=~s/\$()\$//;
#		$ligne=~s/\$()\$//;
#		$ligne=~s/()//;
#	}

#Adrien Mével M1 EdNitl 2022 RePPOL
use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox


#CE SCRIPT SERT À NUMÉROTER LES ZONES ET SEG DES SECTION PALÉO, NOUS ÉVITE D'AVOIR À LE FAIRE À LA MAIN
	#repère la page
	#compte les <zone>
	#leur attribue une id : numerozone_numeropage
	#créé élément <seg> (nesté dans <zone>) et lui attribue un renvoi

	#il nécessite de copier les éléments zone établis via teizoner dans un fichier nommé "_number_me.xml".
open (XML, "_number_me.xml"); 
binmode(XML, ":utf8");
open (XMLOUT, ">_numbered.xml"); #on récupère le résultat ici
binmode(XMLOUT, ":utf8");

#CRÉATION DE VARIABLES
my $page = ''; #variable générant la puce de la page
my $compteur = 0; #variable comptant les zones
my $zoneid = ''; #variable générant l'id de la zone et son renvoi dans l'élément <seg>
my $xml=' '; #contient le fichier xml pour réécriture


while (my $line = <XML>) {#lecture
	if($line=~/128_(\d\d\d)_TC_46/){$page=$1; $compteur=0;} #on récupère la puce pour la page et on remet le compteur de zone à 0
	if($line=~/<zone/)	{$compteur=$compteur+1;} #incrémentation du numéros de zone
	$zoneid="$compteur".'_'."$page"; #création de l'id en concaténant les précédentes variables
	$line=~s/<zone/<zone xml:id=\"seg$zoneid\"/g; #substitution pour inscrire l'id
	$line=~s/\" \/>/\"><seg facs=\"#seg$zoneid\"><\/seg><\/zone>/g;#substitution pour inscrire le renvoi de l'id
	$xml = $xml.$line;#récupération texte complet, stockage dans une variable
}
print XMLOUT "$xml"; #écriture

close (XMLOUT);
close (XML);


#Process : 
	#exporter les jpg des pages, réduire leur taille via windows viewer on choisit "4mb"
	#on utilise ces versions "_resized" pour dessiner nos zones dans TEIzoner (annotate an image\basic)
	#on copie colle l'encodage TEI produit par zone dans un fichier nommé "number_me.xml"
	#on lance ce script
	#on copie colle l'encodage du texte dans les éléments <seg> concerné
		#pour cela on execute la transformation "_interfaxim_reppol.xsl"
		#dans la feuille css associée on décommente la fonction qui permet d'afficher les zones afin de bien voir chaque zone et s'y retrouver
	#une fois toutes ces étapes terminées on remplace les liens des facsimilé vers leurs versions IIIF resizées (resize nécessaire peut varier d'une page à l'autre : se situe entre 40 et 50%)
	#quand on est content on execute la transformation une dernière fois et on profite du résultat




#première version du script qui ne compte que les zones et nécessite de changer manuellement la page
#while (my $line = <XML>) {
#	if($line=~/<zone/)	{$compteur=$compteur+1;}
#	$compteur="$compteur".'_011';#changer la puce _011 par le numéros de la page que l'on traite (si c'est la page 5 ce sera "005").
#	$line=~s/<zone/<zone xml:id=\"seg$compteur\"/g;
#	$line=~s/<seg/<seg facs=\"#seg$compteur\"/g;
#	$xml = $xml.$line;#récupération texte complet, stockage dans une variable
#}
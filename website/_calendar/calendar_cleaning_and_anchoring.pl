#Adrien Mével, M1 EdNitl à l'université de Lille, réalisé le 16/05/2022 pour le projet RePPOL 


use strict;
use warnings;
use utf8;
use open ':std', ':locale'; #debug UTF8 voir bookmark firefox
use open ':encoding(UTF-8)'; #debug UTF8 voir bookmark firefox


open (HTMLIN, "calendar_generated.html");
binmode (HTMLIN, ":utf8");
open (HTMLOUT, ">calender_clean.html");
binmode(HTMLOUT, ":utf8");


my $y='';#creation variable year
my $m='';#creation variable month

my $html='';#creation variable getting string


while (my $line=<HTMLIN>){
	chop $line;
		#cleaning
		$line=~s/ class=\"hcm-table\"//g;
		$line=~s/ class=\"hcm-year-head\"//g;
		$line=~s/ class=\"hcm-month-head\"//g;
		#$line=~s/ class=\"hcm-day-head\"//g;
		$line=~s/<td class="hcm-day-head">(\w)\w\w<\/td>/<td>$1<\/td>/g;
		#getting the year
			#an anchoring
		if ($line=~/(\d\d\d\d)/) {$y=$1; $line=~s/(\d\d\d\d)/<a href="#$1">$1<\/a>/;}
				#print "$y\n";#check
		#getting the month
			#and anchoring
		if ($line=~/January/){$m='01'; $line=~s/(January)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/February/){$m='02'; $line=~s/(February)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/March/){$m='03'; $line=~s/(March)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/April/){$m='04'; $line=~s/(April)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/May/){$m='05'; $line=~s/(May)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/June/){$m='06'; $line=~s/(June)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/July/){$m='07'; $line=~s/(July)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/August/){$m='08'; $line=~s/(August)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/September/){$m='09'; $line=~s/(September)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/October/){$m='10'; $line=~s/(October)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/November/){$m='11'; $line=~s/(November)/<a href="#$y-$m">$1<\/a>/;}
		if ($line=~/December/){$m='12'; $line=~s/(December)/<a href="#$y-$m">$1<\/a>/;}
				#print "$m\n";#check
		#anchoring the day
		if ($line=~/<td>\d\d?/) {
			if($line=~/<td>\d<\/td>/){#if day < 10
				$line=~s/<td>(\d)<\/td>/<td><a href=\"#$y-$m-0$1\">$1<\/a><\/td>/g;
			}
			if($line=~/<td>\d\d/){#if day > 10
				$line=~s/<td>(\d\d?)<\/td>/<td><a href=\"#$y-$m-$1\">$1<\/a><\/td>/g;	
			}
		}
$html = "$html"."\n"."$line";
}
						
			print HTMLOUT $html;
close (HTMLIN);
close (HTMLOUT);
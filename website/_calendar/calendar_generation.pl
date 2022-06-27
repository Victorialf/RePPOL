
#ai forcé la constitution des tableaux en mettant 0 comme valeur à l'appel de la sub "historic"
#les dates sont donc calendrier grégorien, ce qui nous arrange puisque nous les utilisons pour les attributs
use HTML::CalendarMonth;
use DATE::Calc;
open (HTML, ">calendar_generated.html");
binmode (HTML, ":utf8");

for (my $i = 1; $i <= 12; $i++) {
	$c = HTML::CalendarMonth->new( month => $i, year => 1540 );
	print HTML $c->as_HTML;
	print HTML "\n";
	
}
for (my $i = 1; $i <= 12; $i++) {
	$c = HTML::CalendarMonth->new( month => $i, year => 1541 );
	print HTML $c->as_HTML;
	print HTML "\n";

}
for (my $i = 1; $i <= 12; $i++) {
	$c = HTML::CalendarMonth->new( month => $i, year => 1542 );
	print HTML $c->as_HTML;
	print HTML "\n";

}
for (my $i = 1; $i <= 12; $i++) {
	$c = HTML::CalendarMonth->new( month => $i, year => 1543 );
	print HTML $c->as_HTML;
	print HTML "\n";
}


close (HTML);
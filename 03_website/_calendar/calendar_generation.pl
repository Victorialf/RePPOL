

use HTML::CalendarMonth; #https://metacpan.org/pod/HTML::CalendarMonth
use DATE::Calc; #https://metacpan.org/dist/Date-Calc/view/lib/Date/Calc.pod
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
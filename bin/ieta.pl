#!perl
use Moose;
use 5.10.0;
use FindBin;
use lib "$FindBin::Bin/../lib/";
use IETA;

my $IETA = IETA->new;
$IETA->run;

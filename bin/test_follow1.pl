#!perl
use POE;
use FindBin;
use lib "$FindBin::Bin/../lib/";
use IETA::Receiver::LogFile;

my $test = IETA::Receiver::LogFile->new();

POE::Kernel->run();
exit;
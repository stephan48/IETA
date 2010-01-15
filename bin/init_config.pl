#!/usr/bin/perl
use Moose;

use FindBin;
use lib "$FindBin::Bin/../lib";

use IETA::Config;

my $config = IETA::Config->new();

$config->save_config();
IETA::Config->load_config();

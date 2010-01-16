#!/usr/bin/perl
use Moose;

use FindBin;
use lib "$FindBin::Bin/../lib";

use IETA::Config;
use IETA::Config::Log;

my $config = IETA::Config->new(log => IETA::Config::Log->new());

$config->save_config();
IETA::Config->load_config();

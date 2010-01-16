package IETA::Config::Log;

use Moose;
use MooseX::Storage;
use FindBin;

our $VERSION = '0.01';

with Storage('format' => 'YAML', 'io' => 'File');

has 'configfile' => (
	is  => "rw",
	isa => "Str",
	required => 1,
	default  => "$FindBin::Bin/../etc/log4perl.cfg",
);

has 'checktime' => (
    is  => "rw",
    isa => "Str",
    required => 1,
	default  => "10",
);

has 'namespace' => (
    is  => "rw",
    isa => "Str",
    required => 1,
	default  => "IETA",
);

1;

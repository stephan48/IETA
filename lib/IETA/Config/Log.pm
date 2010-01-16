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
    isa => "Int",
    required => 1,
	default  => 10,
);

has 'namespace' => (
    is  => "rw",
    isa => "Str",
    required => 1,
	default  => "IETA",
);

1;

__END__

=head1 NAME

IETA::Config::Log - Improved Enemy Territory Admin Mod Logger Config

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA::Config;
    my $IETA_config = IETA::Config->load_config();	
	
=head1 DESCRIPTION

The IETA::Config::Log class implants an Enemy Territory Admin Mod Logger Config.

=head1 ATTRIBUTES

=head2 configfile (String)

Helds an absolute part to the Log::Log4perl Config file.

=head2 checktime (Int)

Each x seconds log4perl will check for changed logger config.

=head2 namespace (String)

Default Namespace

=head1 DEPENDENCIES

L<Moose>,L<MooseX::Storage>

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Stephan Jauernick (stephanj@cpan.org)

=head1 LICENCE

Copyright 2010 by stephan Jauernick.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
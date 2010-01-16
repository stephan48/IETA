package IETA::Config;

use 5.10.0;
use Moose;
use MooseX::Storage;
use FindBin;
use Carp;

use IETA::Config::Log;

with Storage('format' => 'YAML', 'io' => 'File');

our $VERSION = '0.01';

has 'log' => (
    is  => "rw",
    isa => "IETA::Config::Log",
    required => 1,
);

sub load_config {
	my $self     = shift;
	my $filename = shift || "$FindBin::Bin/../etc/config.yaml";
	croak "Config file not Found! run bin/init_config.pl first!\n" if !(-e $filename);
	return $self->load($filename);
}

sub save_config {
	my $self = shift;
	my $filename = shift || "$FindBin::Bin/../etc/config.yaml";
	$self->store($filename);
}

1;

__END__

=head1 NAME

IETA::Config - Improved Enemy Territory Admin Mod Config

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA::Config;
    my $IETA_config = IETA::Config->load_config();

=head1 DESCRIPTION

The IETA Config class implants an Enemy Territory Admin Mod Config.

=head1 ATTRIBUTES

=head2 log (IETA::Config::Log)

Helds the IETA::Log Config.

=head1 METHODS

=head2 save_config ()
Save the config from filesystem. Takes an optional argument which specifices a absolute path to the yaml config file.
When no arg is given it uses the etc dir in the dir where the bin dir is.

=head2 load_config ()
Loads the config from filesystem. Takes an optional argument which specifices a absolute path to the yaml config file.
When no arg is given it uses the etc dir in the dir where the bin dir is.

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

package IETA::Config;

use 5.10.0;
use Moose;
use MooseX::Storage;
use FindBin;

with Storage('format' => 'YAML', 'io' => 'File');

=head1 NAME

IETA::Config - Improved Enemy Territory Admin Mod Config

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module provides a Config for the IETA.

    use IETA::Config;
    my $IETA = IETA::Config->load_config();

=head1 METHODS

=over 4

=item load_config()
Loads the config from filesystem. Takes an optional argument which specifices a absolute path to the yaml config file.
When no arg is given it uses the etc dir in the dir where the bin dir is.

=cut

sub load_config {
	my $self     = shift;
	my $filename = shift || "$FindBin::Bin/../etc/config.yaml";
	return $self->load($filename);
}

=item save_config()
Save the config from filesystem. Takes an optional argument which specifices a absolute path to the yaml config file.
When no arg is given it uses the etc dir in the dir where the bin dir is.

=cut

sub save_config {
	my $self = shift;
	my $filename = shift || "$FindBin::Bin/../etc/config.yaml";
	$self->store($filename);
}

=back

=head1 AUTHOR

Stephan Jauernick, C<< <stephan at stejau.de> >>

=head1 SUPPORT

Simply ask stephan48 in irc.perl.org. 

=head1 ACKNOWLEDGEMENTS

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Stephan Jauernick.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1;

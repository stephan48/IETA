package IETA;

use 5.10.0;
use Moose;

=head1 NAME

IETA - Improved Enemy Territory Admin Mod

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module is a rewrite of the famous Enemy Territory Admin Mod.

    use IETA;

    my $IETA = IETA->new();
    $IETA->run

=head1 METHODS

=over 4

=item run
With this method you run the IETA and force it to start the various submodules!

=back

=cut

sub run {
	return;
}

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

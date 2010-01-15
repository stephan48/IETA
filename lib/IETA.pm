package IETA;

use 5.10.0;
use Moose;

use IETA::Config;

has 'config' => (
	isa     => "IETA::Config",
	is      => "rw",
	builder => "_build_config",
);

sub _build_config {
	return IETA::Config->load_config;
}

sub run {
	return;
}

1;

__END__

=head1 NAME

IETA - Improved Enemy Territory Admin Mod

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA;
	my $IETA = IETA->new;
	$IETA->run;

=head1 DESCRIPTION

The IETA class implants an Enemy Territory Admin Mod which helps the Admins and provides more functionality to Server Admins and the players.

=head1 ATTRIBUTES

=head2 config (IETA::Config)

Helds the IETA Config.

=head1 METHODS

=head2 run ()

Runs the IETA

=head1 DEPENDENCIES

L<Moose>

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Stephan Jauernick (stephanj@cpan.org)

=head1 LICENCE

Copyright 2010 by stephan Jauernick.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
package IETA::Receiver;

use MooseX::POE::SweetArgs;
use IETA::Receiver::LogFile;

has app => (
    isa      => 'IETA',
    is       => 'ro',
    required => 1,
);

has _reader => (
	accessor => "reader",
	builder  => "_build__reader",
);

sub _build__reader {
	my ($self) = @_;
	return IETA::Receiver::LogFile->new(app => $self->app);
}

sub START {
    my ($self) = @_;
}

event line => sub {
    my ($self, $line) = @_;
    print $line;
};

no MooseX::POE::SweetArgs;

1;
__END__

=head1 NAME

IETA::Receiver - Improved Enemy Territory Admin Mod Receiver

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA;
    my $IETA = IETA->new;

=head1 DESCRIPTION

The IETA::Receiver class implants an Enemy Territory Admin Mod Receiver to get the log lines from the Server.

=head1 ATTRIBUTES

=head2 app (IETA)

Helds the IETA app Object.

=head1 METHODS

Look for Log4perl for a list!

=head1 DEPENDENCIES

L<Moose>,L<MooseX::POE>

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Stephan Jauernick (stephanj@cpan.org)

=head1 LICENCE

Copyright 2010 by stephan Jauernick.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
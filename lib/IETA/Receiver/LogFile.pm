package IETA::Receiver::LogFile;

use 5.10.0;
use MooseX::POE::SweetArgs;
use POE::Wheel::FollowTail;

has app => (
    isa      => 'IETA',
    is       => 'ro',
    required => 0,
);

has _log_file_tailer => (
    isa      => 'POE::Wheel::FollowTail',
    accessor => 'log_file',
	is 		 => 'rw',
    builder  => '_build__log_file_tailer'
);

sub _build__log_file_tailer {
	my ($self) = @_;
	return POE::Wheel::FollowTail->new(
        Filename   => "Q:\\GameServer\\WolfensteinEnemyTerritory\\nq\\etconsole.log",
        InputEvent => sub { $self->got_line(@_[ARG0..$#_]); },
        ErrorEvent => sub { $self->got_error(@_[ARG0..$#_]); },
    );
}


sub START {
    my ($self) = @_;
}

sub got_line {
	my ($self, $line) = @_;
	say($line);
};

sub got_error {
	my ($self, $line) = @_;
	say $line;
};

no MooseX::POE::SweetArgs;

1;
__END__

=head1 NAME

IETA::Receiver::LogFile - Improved Enemy Territory Admin Mod Receiver from LogFile

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA;
    my $IETA = IETA->new;

=head1 DESCRIPTION

The IETA::Receiver::LogFile class implants an Enemy Territory Admin Mod Receiver from LogFile to get the log lines from the Server.

=head1 ATTRIBUTES

=head2 app (IETA)

Helds the IETA app Object.

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
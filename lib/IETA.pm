package IETA;

use 5.10.0;
use Moose;

sub POE::Kernel::ASSERT_EVENTS  () { 1 }
sub POE::Kernel::TRACE_EVENTS  () { 0 }
use POE::Kernel;

use IETA::Config;
use IETA::Log;
use IETA::Receiver;

use Data::Dumper;

has 'config' => (
	isa      => "IETA::Config",
	is       => "rw",
	builder  => "_build_config",
	lazy_build => 1,
);

has 'log' => (
	isa      => "IETA::Log",
	is       => "rw",
	builder  => "_build_log",
	required => 1,
);

has 'receiver' => (
	isa      => "IETA::Receiver",
	is       => "rw",
	builder  => "_build_receiver",
	required => 1,
);

sub _build_config {
	return IETA::Config->load_config;
}

sub _build_log {
	my ($self) = shift;
	return IETA::Log->new(app => $self);
}

sub _build_receiver {
	my ($self) = shift;
	return IETA::Receiver->new(app => $self);
}

sub run {
	my ($self) = @_;
	$self->log->info("Starting IETA");
	$self->_install_sig_handler;
	$self->_poe_start;
	$self->log->info("Stopping IETA");
	return;
}

sub _install_sig_handler {
	my ($self) = @_;
	$self->log->info("Installing SIG Handles");
	$SIG{'INT'} = sub { $self->handle_sig };
	$SIG{'TERM'} = sub { $self->handle_sig };
	$self->log->info("SIG Handles Installed");
}

sub _poe_start {
	my ($self) = @_;
	$self->log->info("Starting POE Event Handler");
	POE::Kernel->run();
	$self->log->info("POE Event Handler Finished");
}

sub _poe_shutdown {
	my ($self) = @_;
	POE::Kernel->post($self->receiver->get_session_id, "shutdown");
	POE::Kernel->run();
	$self->log->info("POE Event Handler Finished");
}


sub handle_sig {
	my ($self, $sig) = @_;
	$self->log->info("Got Shutdown Signal");
	exit(0);
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
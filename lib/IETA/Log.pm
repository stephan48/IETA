package IETA::Log;

use Moose;
use Log::Log4perl;
use FindBin;

has app => (
    isa      => 'IETA',
    is       => 'ro',
    required => 1,
);

has _logger => (
    isa        => 'Log::Log4perl::Logger',
    accessor   => 'logger',
    lazy_build => 1,
	handles => {
		alert     => 'fatal',
		critical  => 'fatal',
		debug     => 'debug',
        emergency => 'fatal',
		error     => 'error',
        info      => 'info',
        notice    => 'info',
        warning   => 'warn',
    	lod		  => 'info',
		warn      => 'warn',
		fatal     => 'fatal',
	}
);

sub _build__logger {
	my $self = shift;
	Log::Log4perl::init_and_watch($self->app->config->log->configfile, $self->app->config->log->checktime);
	return Log::Log4perl->get_logger($self->app->config->log->namespace);
}

sub BUILD {
	my $self = shift;
	$self->logger();
}

sub get_logger {
	my $self      = shift;
	my $namespace = shift;
	return Log::Log4perl->get_logger($namespace || $self);
}

sub get_path_to_var {
	return "$FindBin::Bin/../var/";
}

1;
__END__

=head1 NAME

IETA::Log - Improved Enemy Territory Admin Mod Logger

=head1 VERSION

This documentation refers to version 0.01.

=head1 SYNOPSIS

	use IETA;
    my $IETA = IETA->new;

=head1 DESCRIPTION

The IETA::Log class implants an Enemy Territory Admin Mod Logger.

=head1 ATTRIBUTES

=head2 app (IETA)

Helds the IETA app Object.

=head2 logger (IETA)

Helds the Logger Object.

=head1 METHODS

Look for Log4perl for a list!

=head1 DEPENDENCIES

L<Moose>,L<Log::Log4perl>

=head1 BUGS AND LIMITATIONS

None known currently, please email the author if you find any.

=head1 AUTHOR

Stephan Jauernick (stephanj@cpan.org)

=head1 LICENCE

Copyright 2010 by stephan Jauernick.

This software is free.  It is licensed under the same terms as Perl itself.

=cut
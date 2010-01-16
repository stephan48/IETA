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

sub alert {
	shift->logger->fatal(@_);
}

sub critical {
    shift->logger->fatal(@_);
}

sub debug {
    shift->logger->debug(@_);
}

sub emergency {
    shift->logger->fatal(@_);
}

sub error {
    shift->logger->error(@_);
}

sub info {
    shift->logger->info(@_);
}

sub notice {
    shift->logger->info(@_);
}

sub warning {
    shift->logger->warn(@_);
}

sub log {
    shift->logger->log(@_);
}

sub get_path_to_var {
	return "$FindBin::Bin/../var/";
}

1;
__END__

#!perl

use warnings;
use strict;

use POE;
use POE qw(Component::Server::TCP);

use 5.10.0;

use Data::Dumper;
use MIME::Base64;

my $token = "Test123456576";

POE::Component::Server::TCP->new(
	Port => 12345,
	ClientConnected => sub {
		print "[IETA:SERVER:TCP] Connection from $_[HEAP]{remote_ip}!\n";
	},
	ClientInput => sub {
		my ($heap, $input ) =  @_[HEAP, ARG0];
		my ($cmd, $args);
		
		
		
		if($input =~/(.+):(.+)(?:\n|\r|\r\n)?/)
		{
			$cmd  = $1;
			$args = $2;
		}
		else
		{
			return;
		}
		
		if($cmd eq "Auth")
		{
			my $token_in = decode_base64($args);

			if($token eq $token_in)
			{
				$heap->{client}->put("Auth:OK\n");
			}
			else
			{
				delete $heap->{client};
			}
		}
		elsif($cmd eq "InitGame")
		{
			my $reason = decode_base64($args);
			say "Game Init Because of: $reason";
		}
		elsif($cmd eq "ShutdownGame")
		{
			my $reason = decode_base64($args);
			say "Game Shutdown Because of: $reason";
		}
		elsif($cmd eq "Print")
		{
			my $text = decode_base64($args);
			chomp($text);
			say "$text";
		}
		
		
	},
  );

  POE::Kernel->run;
  exit;
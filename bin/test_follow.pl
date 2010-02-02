#!perl

use POE qw(Wheel::FollowTail);

POE::Session->create(
	inline_states => {
		_start => sub {
			$_[HEAP]{tailor} = POE::Wheel::FollowTail->new(
				Filename => "Q:\\GameServer\\WolfensteinEnemyTerritory\\nq\\etconsole.log",
				InputEvent => "got_log_line",
				ResetEvent => "got_log_rollover",
			);
		},
		got_log_line => sub {
			print "Log: $_[ARG0]\n";
		},
		got_log_rollover => sub {
			print "Log rolled over.\n";
		},
    }
);

POE::Kernel->run();
exit;
package Catalyst::Plugin::TimeNow;

use strict;
use warnings;

use POSIX qw(strftime);

sub setup {
    my $c     = shift;
	$c->log->debug('Now we have: '.time_now($c));
    $c->NEXT::setup( @_ );
}

sub time_now {
    my $c   = shift;
	my $time_format = $c->config->{'TimeNow'}->{'format'} || '%a %b %e %H:%M:%S %Y';
    return strftime $time_format, localtime;
}

1;

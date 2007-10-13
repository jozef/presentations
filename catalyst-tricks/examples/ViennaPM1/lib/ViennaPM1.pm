package ViennaPM1;

use strict;
use warnings;

use Catalyst::Runtime '5.70';

my @plugins;
BEGIN {
	push(@plugins, '-Debug') if $ENV{'IN_DEBUG_MODE'};
	push(@plugins, qw(
		ConfigLoader
		DefaultEnd	
		Static::Simple
		TimeNow
	));
}

use Catalyst @plugins;

#our $VERSION = '0.01';

__PACKAGE__->setup;

die 'failed to load configuration file' if not defined __PACKAGE__->config->{'name'};

1;

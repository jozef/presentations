package ViennaPM1::Controller::Root;

use strict;
use warnings;
use base 'Catalyst::Controller';

__PACKAGE__->config->{namespace} = '';

sub auto {
	die;
}

sub index : Private {
	my ( $self, $c ) = @_;

	$c->stash->{'message'} =
		$c->model('Constants')->names.', generated at: '.$c->time_now;
	$c->stash->{'template'} = 'index.tt2';

	# default view is called to handle the template
}
sub dump : Local {
	my ( $self, $c, $name ) = @_;

	$c->stash->{'template'} = $name;
	$c->forward('View::Dump');
}

1;

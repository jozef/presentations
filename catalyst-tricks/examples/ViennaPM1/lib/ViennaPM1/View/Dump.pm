package ViennaPM1::View::Dump;

use strict;

use base 'Catalyst::View';
use File::Slurp;

sub render {
    my ($self, $c, $dump_name) = @_;
	$dump_name = $c->config->{'View::Dump'}->{'path'}.'/'.$dump_name;

    return read_file($c->path_to($dump_name).'');
}
sub process {
    my ($self, $c) = @_;
	$c->response->content_type('text/plain');
    $c->response->body(
        $self->render($c, $c->stash->{'template'})
    );
}
1;

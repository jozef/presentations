package ViennaPM1::Model::Constants;

use strict;
use warnings;
use base 'Catalyst::Model';
my %constants = ( 'p' => 'perl', 'm' => 'mongers' );
sub named {
    my ($self, $name) = @_;
    die 'no such constatnt' if not exists $constants{$name}; 
    return $constants{$name};
}
sub names {
	return join ', ', keys %constants;
}
1;

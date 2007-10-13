package ViennaPM1::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    CATALYST_VAR => 'Catalyst',
    INCLUDE_PATH => [
        ViennaPM1->path_to( 'root', 'tt' ),
    ],
#    PRE_PROCESS  => 'config/main',
    WRAPPER      => '_wrapper.tt2',
    ERROR        => 'error.tt2',
    TIMER        => 0
});

=head1 NAME

ViennaPM1::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<ViennaPM1>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

Jozef Kutej,,,

=head1 LICENSE

This library is free software, you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;


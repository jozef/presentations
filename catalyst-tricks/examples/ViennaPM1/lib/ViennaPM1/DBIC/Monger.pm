package ViennaPM1::DBIC::Monger;

=head1 NAME

ViennaPM1::DBIC::Monger - DBIx:Class module representing Vienna Perl Monger

=cut

use strict;
use warnings;

use base 'DBIx::Class';

=head1 DESCRIPTION

DBIx::Class representation of the Monger table.

=head2 table

	mongers

=head2 columns

	monger_id - PK
	name
	cpan_id
	status

=cut

__PACKAGE__->load_components(qw{PK::Auto ResultSetManager Core});
__PACKAGE__->table('mongers');
__PACKAGE__->add_columns(qw{
	monger_id
	name
	cpan_id
	status
	life_style_id
});
__PACKAGE__->set_primary_key('monger_id');
__PACKAGE__->sequence('mongers_monger_id_seq');

=head2 relationships

	__PACKAGE__->might_have( 'personal_life' => 'ViennaPM1::PersonalLife', 'monger_id');
	__PACKAGE__->has_many  ( 'presentations' => 'ViennaPM1::Presentation', 'monger_id');
	__PACKAGE__->belongs_to( 'life_style'    => 'ViennaPM1::LifeStyle',    'life_style_id');

=cut

__PACKAGE__->might_have( 'personal_life' => 'ViennaPM1::PersonalLife', 'monger_id');
__PACKAGE__->has_many  ( 'presentations' => 'ViennaPM1::Presentation', 'monger_id');
__PACKAGE__->belongs_to( 'life_style'    => 'ViennaPM1::LifeStyle',    'life_style_id');

=head2 unique constraints

	uniq_cpan_id => [ qw{cpan_id} ]

=cut

__PACKAGE__->add_unique_constraint(
	uniq_cpan_id => [ qw{cpan_id} ]
);


=head1 RESULTSETS

=head2 with_cpan_id($cpan_id) : ResultSet

Returns monger whose cpan id equals to $cpan_id

=cut

sub with_cpan_id : ResultSet {
    my $self    = shift;
    my $cpan_id = shift;

    return = $self->find({
    	cpan_id => $cpan_id
    }, {
    	key  => 'uniq_cpan_id'
    });
}


=head1 METHODS

=head2 status()

Set or get current monger status.

=cut

sub promote_to_guru {
	my $self = shift;
	
	$self->status('GURU');
	$self->update;

	return $self;
}


=head2 is_active()

Returns false if the monger is disabled otherwise true.

=cut

sub is_active {
	my $self = shift;
	
	return 1 if $self->status ne 'DISABLED';
	return 0;
}

1;


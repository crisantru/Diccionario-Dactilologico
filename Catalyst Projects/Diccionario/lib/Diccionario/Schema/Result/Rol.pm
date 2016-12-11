use utf8;
package Diccionario::Schema::Result::Rol;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Diccionario::Schema::Result::Rol

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=item * L<DBIx::Class::TimeStamp>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime", "TimeStamp");

=head1 TABLE: C<rol>

=cut

__PACKAGE__->table("rol");

=head1 ACCESSORS

=head2 idrol

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 rol

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "idrol",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "rol",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</idrol>

=back

=cut

__PACKAGE__->set_primary_key("idrol");

=head1 RELATIONS

=head2 usuario_rols

Type: has_many

Related object: L<Diccionario::Schema::Result::UsuarioRol>

=cut

__PACKAGE__->has_many(
  "usuario_rols",
  "Diccionario::Schema::Result::UsuarioRol",
  { "foreign.rolidrol" => "self.idrol" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 usuariocorreos

Type: many_to_many

Composing rels: L</usuario_rols> -> usuariocorreo

=cut

__PACKAGE__->many_to_many("usuariocorreos", "usuario_rols", "usuariocorreo");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-12-09 00:53:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k7hpU638ACI1uasZeT3rFA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

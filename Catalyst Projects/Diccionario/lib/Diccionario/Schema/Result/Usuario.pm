use utf8;
package Diccionario::Schema::Result::Usuario;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Diccionario::Schema::Result::Usuario

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

=head1 TABLE: C<usuario>

=cut

__PACKAGE__->table("usuario");

=head1 ACCESSORS

=head2 nombre

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 apellidopaterno

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 apellidomaterno

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 correo

  data_type: 'varchar'
  is_nullable: 0
  size: 40

=head2 telefono

  data_type: 'integer'
  is_nullable: 1

=head2 fechanacimiento

  data_type: 'date'
  is_nullable: 1

=head2 username

  data_type: 'text'
  is_nullable: 1

=head2 password

  data_type: 'text'
  is_nullable: 1

=head2 active

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "nombre",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "apellidopaterno",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "apellidomaterno",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "correo",
  { data_type => "varchar", is_nullable => 0, size => 40 },
  "telefono",
  { data_type => "integer", is_nullable => 1 },
  "fechanacimiento",
  { data_type => "date", is_nullable => 1 },
  "username",
  { data_type => "text", is_nullable => 1 },
  "password",
  { data_type => "text", is_nullable => 1 },
  "active",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</correo>

=back

=cut

__PACKAGE__->set_primary_key("correo");

=head1 RELATIONS

=head2 busquedas

Type: has_many

Related object: L<Diccionario::Schema::Result::Busqueda>

=cut

__PACKAGE__->has_many(
  "busquedas",
  "Diccionario::Schema::Result::Busqueda",
  { "foreign.correo" => "self.correo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 usuario_rols

Type: has_many

Related object: L<Diccionario::Schema::Result::UsuarioRol>

=cut

__PACKAGE__->has_many(
  "usuario_rols",
  "Diccionario::Schema::Result::UsuarioRol",
  { "foreign.usuariocorreo" => "self.correo" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 rolidrols

Type: many_to_many

Composing rels: L</usuario_rols> -> rolidrol

=cut

__PACKAGE__->many_to_many("rolidrols", "usuario_rols", "rolidrol");


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-12-09 00:53:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:q1FTVLCS02tVrKQzAa2GiQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

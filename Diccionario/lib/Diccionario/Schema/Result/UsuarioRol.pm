use utf8;
package Diccionario::Schema::Result::UsuarioRol;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Diccionario::Schema::Result::UsuarioRol

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

=head1 TABLE: C<usuario_rol>

=cut

__PACKAGE__->table("usuario_rol");

=head1 ACCESSORS

=head2 usuariocorreo

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0

=head2 rolidrol

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "usuariocorreo",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 0 },
  "rolidrol",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</usuariocorreo>

=item * L</rolidrol>

=back

=cut

__PACKAGE__->set_primary_key("usuariocorreo", "rolidrol");

=head1 RELATIONS

=head2 rolidrol

Type: belongs_to

Related object: L<Diccionario::Schema::Result::Rol>

=cut

__PACKAGE__->belongs_to(
  "rolidrol",
  "Diccionario::Schema::Result::Rol",
  { idrol => "rolidrol" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 usuariocorreo

Type: belongs_to

Related object: L<Diccionario::Schema::Result::Usuario>

=cut

__PACKAGE__->belongs_to(
  "usuariocorreo",
  "Diccionario::Schema::Result::Usuario",
  { correo => "usuariocorreo" },
  { is_deferrable => 0, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-12-09 00:53:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:DWvxZ3QTRQq1SDu0Y7F2NA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

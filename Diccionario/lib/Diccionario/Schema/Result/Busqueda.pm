use utf8;
package Diccionario::Schema::Result::Busqueda;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Diccionario::Schema::Result::Busqueda

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

=head1 TABLE: C<busqueda>

=cut

__PACKAGE__->table("busqueda");

=head1 ACCESSORS

=head2 idbusqueda

  data_type: 'int'
  is_nullable: 0

=head2 palabra

  data_type: 'varchar'
  is_nullable: 1
  size: 40

=head2 fechabusqueda

  data_type: 'date'
  is_nullable: 1

=head2 correo

  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "idbusqueda",
  { data_type => "int" },
  "palabra",
  { data_type => "varchar", is_nullable => 1, size => 40 },
  "fechabusqueda",
  { data_type => "date", is_nullable => 1 },
  "correo",
  { data_type => "varchar", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</idbusqueda>

=back

=cut

__PACKAGE__->set_primary_key("idbusqueda");

=head1 RELATIONS

=head2 correo

Type: belongs_to

Related object: L<Diccionario::Schema::Result::Usuario>

=cut

__PACKAGE__->belongs_to(
  "correo",
  "Diccionario::Schema::Result::Usuario",
  { correo => "correo" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2016-12-09 00:53:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T69SOa7FJgKioPxSQ0uhIA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;

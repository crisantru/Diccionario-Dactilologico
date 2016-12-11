package Diccionario::Controller::Busquedas;
use Moose;
use utf8;
use namespace::autoclean;


BEGIN { extends 'Catalyst::Controller'; }



sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'search.tt');
}

sub dactiEspa :Path('dactilologicoEspañol'){
    my ( $self, $c ) = @_;

    $c->stash(template => 'searchDacti.tt');
}

sub espaDacti :Path('EspaDactilologico'){
    my ( $self, $c ) = @_;

    $c->stash(template => 'searchEspa.tt');
}


sub listBusquedas :Local{
    my ( $self, $c ) = @_;

    $c->stash(busquedas => [$c->model('DB::Busqueda')->all]);

    $c->stash(template => 'busqueda/busquedas.tt');

}

sub palabra :Path('palabra') :Args(0){
  my ($self, $c,) = @_;

  my $palabra = $c->request->params->{palabra} || 'N/A';  #recibe parametro del form
  my $i = 0;
  my $palabraToken;
  my $extension = ".jpg";
  $palabra = "\U$palabra";    #uppcase variable
  $palabra = reverse($palabra);   #orden inverso
  my $longitud = length($palabra);  #longitud de la palabra
  my @palabraArray = ($longitud);   #inicia arreglo con longitud

  for($i; $i < $longitud; $i++)
  {
    $palabraToken = chop($palabra);       #quita la ultima letra de la palabra y la guarda
    @palabraArray[$i] = "$palabraToken$extension";  #le asigna la letra de palabraToken mas la variable extension

  }

  $c->stash->{palabra} = \@palabraArray;  #envia el arreglo se usa \ para guardar la referencia
  $c->stash(template => 'searchEspa.tt');

}

=encoding utf8

=head1 AUTHOR

 Cristian Alberto Sánchez Trujillo,,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

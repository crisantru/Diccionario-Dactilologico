package Diccionario::Controller::Root;
use Moose;
use namespace::autoclean;
use utf8;


BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->stash(template => 'index.tt');
}

sub entrar :Path('acceder'){
  my ( $self, $c ) = @_;

  $c->stash(template => 'entrar.tt');
}


sub lenguajeDactilo :Path('lenguajeDactilologico'){
  my ( $self, $c ) = @_;

  $c->stash(template => 'defineLenguaje.tt');
}

sub diccionary :Path('diccionary'){
  my ( $self, $c ) = @_;

  $c->stash(template => 'diccionary.tt');
}

sub newUser :Path('newUser'){
  my ( $self, $c ) = @_;

  $c->stash(template => 'newUser.tt');
}


sub acercaDe :Path('acercaDe'){
  my ( $self, $c ) = @_;

  $c->stash(template => 'acerca.tt');
}


sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

 Cristian Alberto Sánchez Trujillo,,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;

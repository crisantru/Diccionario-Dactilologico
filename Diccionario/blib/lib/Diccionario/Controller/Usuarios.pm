package Diccionario::Controller::Usuarios;
use Moose;
use namespace::autoclean;
use utf8;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched MyApp::Controller::Books in Books.');
}

sub insertar_busqueda :Chained('base') :PathPart('insertar_busqueda') :Args(0) {
    my ($self, $c) = @_;

    my $id = 1;
    my $fechabusqueda = '2016-12-09';
    my $correo = 'crisantru@gmail.com';
    # Retrieve the values from the form
    my $palabra = $c->request->params->{guardar} || 'N/A';
    # Create the Busqueda
    my $busqueda = $c->model('DB::Busqueda')->create({
          idbusqueda => $id,
          palabra => $palabra,
          fechabusqueda => $fechabusqueda,
          correo => $correo,
        });

    #desactivar cache para esta pagina
    $c->response->header('Cache-Control' => 'no-cache');
    #$c->response->body('Usuario Agregado con exito');

    # Store new model object in stash and set template
    $c->stash(busqueda  => $busqueda, template => 'crearBusqueda.tt');
}


#recibe parametros para guardar a la base de datos
sub url_create :Chained('base') :PathPart('url_create') :Args(6){
    # In addition to self & context, get the title, rating, &
    # author_id args from the URL.  Note that Catalyst automatically
    # puts extra information after the "/<controller_name>/<action_name/"
    # into @_.  The args are separated  by the '/' char on the URL.
    my ($self, $c, $nombre, $apellidomaterno, $apellidopaterno,  $correo, $telefono, $fechanacimiento) = @_;

    # Call create() on the usuario model object. Pass the table
    # columns/field values we want to set as hash values
    my $usuario = $c->model('DB::usuario')->create({
            nombre => $nombre,
            apellidomaterno => $apellidomaterno,
            apellidopaterno => $apellidopaterno,
            correo => $correo,
            telefono => $telefono,
            fechanacimiento => $fechanacimiento,
        });

    # Assign the usuario object to the stash for display and set template
    $c->stash(usuario     => $usuario,
              template => 'usuario/crearUsuario.tt'); #confirmacion del usuario creado

    # Disable caching for this page
    $c->response->header('Cache-Control' => 'no-cache');
}

sub base :Chained('/') :PathPart('usuarios') :CaptureArgs(0) {
    my ($self, $c) = @_;

    # Store the ResultSet in stash so it's available for other methods
    $c->stash(resultset => $c->model('DB::Usuario'));

    # Print a message to the debug log
    $c->log->debug('*** Se guardo con exito el registro en la base de datos: Usuario ***');
}

sub form_create_do :Chained('base') :PathPart('form_create_do') :Args(0) {
    my ($self, $c) = @_;

    # Retrieve the values from the form
    my $nombre = $c->request->params->{nombre} || 'N/A';
    my $apellidopaterno = $c->request->params->{apellidopaterno} || 'N/A';
    my $apellidomaterno = $c->request->params->{apellidomaterno} || '1';
    my $correo = $c->request->params->{correo} || '1';
    my $telefono = $c->request->params->{telefono} || '1';
    my $fechanacimiento = $c->request->params->{fechanacimiento} || '1';
    my $username = $c->request->params->{username} || '1';
    my $password = $c->request->params->{password} || 'N/A';

    # Create the Usuario
    my $usuario = $c->model('DB::Usuario')->create({
          nombre => $nombre,
          apellidomaterno => $apellidomaterno,
          apellidopaterno => $apellidopaterno,
          correo => $correo,
          telefono => $telefono,
          fechanacimiento => $fechanacimiento,
          username => $username,
          password => $password
        });

    #desactivar cache para esta pagina
    $c->response->header('Cache-Control' => 'no-cache');
    #$c->response->body('Usuario Agregado con exito');

    # Store new model object in stash and set template
    $c->stash(usuario    => $usuario, template => 'index.tt');
}

sub listUsuarios :Local{
    my ( $self, $c ) = @_;

    $c->stash(usuarios => [$c->model('DB::Usuario')->all]);

    $c->stash(template => 'usuario/consultas.tt');

}

#Fetch the specified usuario object based on the usuario ID (correo) and store
#it in the stash
sub object :Chained('base') :PathPart('correo') :CaptureArgs(1) {
    # $id = primary key of book to delete
    #my ($self, $c, $idusuario) = @_;
    my ($self, $c, $correo) = @_;

    # Find the book object and store it in the stash
    $c->stash(object => $c->stash->{resultset}->find($correo));


    # Make sure the lookup was successful.  You would probably
    # want to do something like this in a real app:
    #   $c->detach('/error_404') if !$c->stash->{object};
    die "Usuario $correo no encontrado!" if !$c->stash->{object};

    # Print a message to the debug log
    $c->log->debug("***Metodo Objeto interior para correo = $correo***");
}

sub delete :Chained('object') :PathPart('delete') :Args(0) {
    my ($self, $c) = @_;

    # Use the book object saved by 'object' and delete it along
    $c->stash->{object}->delete;

    # Set a status message to be displayed at the top of the view
    $c->stash->{status_msg} = "Usuario Eliminado";

    # Forward to the list action/method in this controller
    $c->forward('listUsuarios');
}

sub usuarioFinal :Chained('base') :PathPart('home/usuarioEs') :Args(0){
  my ($self, $c, $correo) = @_;

  $c->stash(template => 'roles/usuarioFinal.tt');

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

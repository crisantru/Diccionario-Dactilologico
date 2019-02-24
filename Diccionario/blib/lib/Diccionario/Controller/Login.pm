package Diccionario::Controller::Login;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ($self, $c) = @_;

    # Obtine usuario y contraseña del form (template)
    my $username = $c->request->params->{username};
    my $password = $c->request->params->{password};

    #si los valores del usuario y contraseña se encuentran en el form
    if ($username && $password) {
        # intento de registro
        if ($c->authenticate({ username => $username,
                               password => $password  } )) {
            # si es correcto redirecciona a:
            $c->response->redirect($c->uri_for(
                $c->controller('Usuarios')->action_for('usuarioFinal')));
            return;
        } else {
            # establece erro de mensaje
            $c->stash(error_msg => "Bad username or password.");
        }
    } else {
        # error de mensaje
        $c->stash(error_msg => "Empty username or password.")
            unless ($c->user_exists);
    }



    # manda al template por default
    $c->stash(template => 'login.tt');
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

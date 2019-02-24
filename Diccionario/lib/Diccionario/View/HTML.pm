package Diccionario::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

__PACKAGE__->config(
    # Change default TT extension
    TEMPLATE_EXTENSION => '.tt',
    # Set the location for TT files
    INCLUDE_PATH => [
            Diccionario->path_to( 'root', 'src' ),
        ],


    # Set to 1 for detailed timer stats in your HTML as comments
    TIMER              => 0,
    # This is your wrapper template located in the 'root/src'
    #WRAPPER => 'wrapper.tt2',

    ENCODING => 'utf-8',
);

=head1 NAME

Diccionario::View::HTML - TT View for Diccionario

=head1 DESCRIPTION

TT View for Diccionario.

=head1 SEE ALSO

L<Diccionario>

=head1 AUTHOR

 Cristian Alberto Sánchez Trujillo,,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

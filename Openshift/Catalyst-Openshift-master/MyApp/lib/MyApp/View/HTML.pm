package MyApp::View::HTML;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';

#__PACKAGE__->config(
#    TEMPLATE_EXTENSION => '.tt2',
#    render_die => 1,
#);
#
#
#__PACKAGE__->config(
## Configure the view
#    'View::HTML' => {
#        #Set the location for TT files
#        INCLUDE_PATH => [
#            MyApp->path_to( 'root', 'tt' ),
#        ],
#    },
#);


__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt2',
    render_die => 1,

    INCLUDE_PATH => [
        MyApp->path_to( 'root', 'tt' ),
        MyApp->path_to( 'root', 'static' ),
    ],
);

=head1 NAME

MyApp::View::HTML - TT View for MyApp

=head1 DESCRIPTION

TT View for MyApp.

=head1 SEE ALSO

L<MyApp>

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

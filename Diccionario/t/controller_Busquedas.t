use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Diccionario';
use Diccionario::Controller::Busquedas;

ok( request('/busquedas')->is_success, 'Request should succeed' );
done_testing();

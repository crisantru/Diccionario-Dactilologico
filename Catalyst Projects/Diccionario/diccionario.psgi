use strict;
use warnings;

use Diccionario;

my $app = Diccionario->apply_default_middlewares(Diccionario->psgi_app);
$app;


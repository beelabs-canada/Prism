# -*- perl -*-

# t/002_http.t - check module loading and executing HTTP requests

use Test::More qw( no_plan );
use File::Basename;

BEGIN { use_ok( 'Prism' ); }

my $object = Prism->new( file=> basename($0,'.t').'.yml' );

ok ( $object->message('example@example.com', 'an example email', '****'), -1 );



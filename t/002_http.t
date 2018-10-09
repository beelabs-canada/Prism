# -*- perl -*-

# t/002_http.t - check module loading and executing HTTP requests

use Test::More qw( no_plan );
use Path::Tiny;
use Digest::SHA qw(sha256_hex);
use File::Basename;

BEGIN { use_ok( 'Prism' ); }

my $object = Prism->new( file=> basename($0,'.t').'.yml' );

ok ( $object->get('https://jsonplaceholder.typicode.com/todos/1'), qr/"userId"\s*:\s"1"/ );

my $tempfile = path($0)->parent(2)->child('_002_http_test.json')->touch;
my $sha =  sha256_hex ( path($0)->sibling( basename($0,'.t').'.json')->slurp_utf8 );
my $file = $object->download('https://jsonplaceholder.typicode.com/todos/1', $tempfile );

ok ( sha256_hex( $file->slurp_utf8 ) , $sha );
$file->remove;


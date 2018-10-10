# -*- perl -*-

# t/002_http.t - check module loading and executing HTTP requests

use Test::More qw( no_plan );
use File::Basename;
use Path::Tiny qw/path/;

BEGIN { use_ok( 'Prism' ); }

my $object = Prism->new( file=> basename($0,'.t').'.yml' );

while ( my $resource  = $object->next )
{
    my $mapping = delete $resource->{'map'};
    ok ( $object->transform( $mapping, $resource ), -1 );
}

path($0)->sibling('latest.en.json')->remove;




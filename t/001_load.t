# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More qw( no_plan );
use File::Basename;

BEGIN { use_ok( 'Prism' ); }

my $object = Prism->new( file=> basename($0,'.t').'.yml' );

isa_ok ($object, 'Prism' );



#!/usr/bin/env perl

use common::sense;

use lib 'lib';
use Prism;

my $prism = Prism->new( file => 'basic.yml' );

$prism->download('https://jsonplaceholder.typicode.com/todos/1', 'output.json');
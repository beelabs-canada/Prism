#!/usr/bin/env perl

use common::sense;

use lib 'lib';
use Prism;
use Data::Dmp;
use JSON::MaybeXS;

my $prism = Prism->new( file => 'example.yml' );


while ( my $resource  = $prism->next )
{
    my $uri = delete $resource->{'uri'};
    
    my $overrides = $resource;
    my $dataset = decode_json( $prism->get( $uri)->{content} );
    

    foreach my $data ( @{ $dataset->{data} } )
    {
        dd $prism->transform( $data, $overrides );
    }
    
}
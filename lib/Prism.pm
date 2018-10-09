package Prism;

use common::sense;
use Path::Tiny qw(path);
use YAML::Tiny;

use Class::Tiny qw(http config file catalog basedir), {
    mail => { host => 'local' },
    index => 0,
    total => 0 
};



#################### subroutine header begin ####################

=head2 sample_function

 Usage     : How to use this function/method
 Purpose   : What it does
 Returns   : What it returns
 Argument  : What it wants to know
 Throws    : Exceptions and other anomolies
 Comment   : This is a sample subroutine header.
           : It is polite to include more pod and fewer comments.

See Also   :

=cut

#################### subroutine header end ####################


sub BUILD
{
    my ($self, $args) = @_;
        
    # set the basedir
    $self->basedir( path($0)->absolute->parent );
    
    # set the config
    $self->config( YAML::Tiny->read( $self->basedir->child( $self->file )->stringify )->[0] );
    
    if ( $self->config->{'catalog'} )
    {
        $self->catalog( $self->config->{'catalog'} );
        $self->total( scalar @{ $self->config->{'catalog'} } );
        
        # The will need to init a crawler
        require Prism::HttpClient;
        
        $self->http( Prism::HttpClient->new ( basedir => $self->basedir, %{ $self->config->{'http'} } ) );
    }
    
    # override default mail settings
    $self->mail( $self->config->{'mail'} ) if ( $self->config->{'mail'} );

    
    return $self;
}


#################### main pod documentation begin ###################
## Below is the stub of documentation for your module.
## You better edit it!


=head1 NAME

Prism - A simplistic YAML based IO system

=head1 SYNOPSIS

  use Prism;
  blah blah blah


=head1 DESCRIPTION

Stub documentation for this module was created by ExtUtils::ModuleMaker.
It looks like the author of the extension was negligent enough
to leave the stub unedited.

Blah blah blah.


=head1 USAGE



=head1 BUGS



=head1 SUPPORT



=head1 AUTHOR

    Mario Bonito
    Beelabs Canada
    mario@beelabs.ca
    https://beelabs.ca

=head1 COPYRIGHT

This program is free software licensed under the...

	The MIT License

The full text of the license can be found in the
LICENSE file included with this module.


=head1 SEE ALSO

perl(1).

=cut

#################### main pod documentation end ###################

sub diag
{
    require Data::Dmp;
    return Data::Dmp::dmp shift;
}

sub download
{
    return shift->http->download( @_ );
}

sub get
{
    return shift->http->get( @_ );
}

1;
# The preceding line will help the module return a true value

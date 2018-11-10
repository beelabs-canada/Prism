use ExtUtils::MakeMaker;
use strict;
use warnings;

# Call 'perldoc ExtUtils::MakeMaker' for details of how to influence
# the contents of the Makefile that is written.

my %WriteMakefileArgs = (
    NAME                => 'Prism',
    VERSION_FROM        => 'lib/Prism.pm',
    AUTHOR              => 'Mario Bonito (mario@beelabs.ca)',
    ABSTRACT            => 'A simplistic YAML based IO system',
    INSTALLDIRS         => ($] < 5.011 ? 'perl' : 'site'),
    PREREQ_PM           => {
        'common::sense' => 3.74,
        'Test::Simple' => 0.44,
        'Class::Tiny' => 1.006,
        'HTTP::Tiny' => 0.076,
        'Mustache::Simple' => 1.36,
        'Path::Tiny' => 0.108,
        'YAML::Tiny' => 1.73,
        'Date::Manip' => 6.73,
        'IO::Uncompress::Gunzip' => 0.01,
        'Mail::Sendmail' => 0.78,
        'HTML::Strip'   => 2.10,
        'IO::Socket::SSL' =>  2.060
    },
    ( eval { ExtUtils::MakeMaker->VERSION(6.46) } ? () : ( META_MERGE => {
        'meta-spec' => { version => 2 },
        dynamic_config => 1,
        #resources => {
        #    homepage    => undef,
        #    repository  => {
        #        url         => undef,
        #        web         => undef,
        #        type        => undef,
        #    },
        #    bugtracker => {
        #        web         => undef,
        #    },
        #},
    })),
);

WriteMakefile(%WriteMakefileArgs);

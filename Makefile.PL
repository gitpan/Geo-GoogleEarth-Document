

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Geo::GoogleEarth::Document',
    VERSION_FROM => 'lib/Geo/GoogleEarth/Document.pm', # finds \$VERSION
    AUTHOR       => 'Michael R. Davis (domain=>stopllc,tld=>com,account=>mdavis)',
    ABSTRACT     => 'Creates a Geo::GoogleEarth::Document',
    PREREQ_PM    => {
                     'Test::More'   => 0,
                     'strict'       => 0,
                     'base'         => 0,
                     'XML::Simple'  => 2.14,
                    },
);

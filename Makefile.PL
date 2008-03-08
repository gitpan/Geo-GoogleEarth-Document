use ExtUtils::MakeMaker;
WriteMakefile(
    NAME         => 'Geo::GoogleEarth::Document',
    VERSION_FROM => 'lib/Geo/GoogleEarth/Document.pm', # finds \$VERSION
    AUTHOR       => 'Michael R. Davis (domain=>michaelrdavis,tld=>com,account=>perl)',
    ABSTRACT     => 'Creates a Geo::GoogleEarth::Document',
    PREREQ_PM    => {
                     'Test::More'   => 0,
                     'strict'       => 0,
                     'base'         => 0,
                     'XML::Simple'  => 2.14,
                     'Archive::Zip' => 0,
                     'IO::Scalar'   => 0,     #from IO-stringy
                    },
);

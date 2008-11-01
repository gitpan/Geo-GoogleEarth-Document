# -*- perl -*-

use Test::More tests => 6;

BEGIN { use_ok( 'Geo::GoogleEarth::Document' ); }
BEGIN { use_ok( 'Archive::Zip' ); }
BEGIN { use_ok( 'IO::Scalar' ); }

my $document = Geo::GoogleEarth::Document->new(name=>"d0");
isa_ok ($document, 'Geo::GoogleEarth::Document');

my $output=q{<?xml version='1.0' standalone='yes'?>
<kml xmlns="http://earth.google.com/kml/2.2">
  <Document>
    <name>d0</name>
  </Document>
</kml>
};
is($document->render, $output, '$document->render');
my $file=$document->archive;
$file=~m/^(..)/;
is($1,  "PK", 'Start of zip file');

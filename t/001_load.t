# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 18;

BEGIN { use_ok( 'Geo::GoogleEarth::Document' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::Folder' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::NetworkLink' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::Placemark' ); }

my $document = Geo::GoogleEarth::Document->new(name=>"d1");
isa_ok ($document, 'Geo::GoogleEarth::Document');
isa_ok ($document->structure, 'HASH');
is($document->name, "d1", '$document->name');

my $folder=$document->Folder(name=>"f1");
isa_ok ($folder, 'Geo::GoogleEarth::Document::Folder');
isa_ok ($folder->structure, 'HASH');
is($folder->name, "f1", '$folder->name');

my $placemark = $document->Placemark(name=>"p1", lon=>1, lat=>2, alt=>3);
isa_ok ($placemark, 'Geo::GoogleEarth::Document::Placemark');
isa_ok ($placemark->structure, 'HASH');
is($placemark->name, "p1", '$placemark->name');

my $networklink = $document->NetworkLink(name=>"n1", url=>"u1");
isa_ok ($networklink, 'Geo::GoogleEarth::Document::NetworkLink');
isa_ok ($networklink->structure, 'HASH');
is($networklink->name, "n1", '$networklink->name');
is($networklink->url, "u1", '$networklink->url');

my $output=q{<?xml version='1.0' standalone='yes'?>
<Document>
  <name>d1</name>
  <Folder>
    <name>f1</name>
  </Folder>
  <NetworkLink>
    <name>n1</name>
    <url>
      <href>u1</href>
    </url>
  </NetworkLink>
  <Placemark>
    <name>p1</name>
    <Point>
      <coordinates>1,2,3</coordinates>
    </Point>
    <description>&lt;html&gt;&lt;p&gt;p1&lt;/p&gt;&lt;/html&gt;</description>
  </Placemark>
</Document>
};

is($document->render, $output, '$document->render');

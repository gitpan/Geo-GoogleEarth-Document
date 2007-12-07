# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 35;
#use lib qw{./lib};

BEGIN { use_ok( 'Geo::GoogleEarth::Document' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::Folder' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::NetworkLink' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::Placemark' ); }
BEGIN { use_ok( 'Geo::GoogleEarth::Document::Style' ); }

my $document = Geo::GoogleEarth::Document->new(name=>"d0");
isa_ok ($document, 'Geo::GoogleEarth::Document');
isa_ok ($document->structure, 'HASH');
is($document->name, "d0", '$document->name');
$document->name("d1");
is($document->name, "d1", '$document->name');

my $folder=$document->Folder(name=>"f1");
isa_ok ($folder, 'Geo::GoogleEarth::Document::Folder');
isa_ok ($folder->structure, 'HASH');
is($folder->name, "f1", '$folder->name');
is($folder->type, "Folder", '$folder->type');

my $placemark = $document->Placemark(name=>"p0",
                                     lon=>1,
                                     lat=>2,
                                     alt=>3,
                                     description=>'<html><p>d0</p></html>');
isa_ok ($placemark, 'Geo::GoogleEarth::Document::Placemark');
isa_ok ($placemark->structure, 'HASH');
is($placemark->name, "p0", '$placemark->name');
is($placemark->description, '<html><p>d0</p></html>', '$placemark->description');
$placemark->description("<html><p>p0</p></html>");
is($placemark->description, '<html><p>p0</p></html>', '$placemark->description');
my $desc=q{<html><p>p1</p></html>};
$placemark->description($desc);
is($placemark->description, $desc, '$placemark->description');
is($placemark->type, "Placemark", '$placemark->type');

$placemark->name("p1");
is($placemark->name, "p1", '$placemark->name');

my $address="1600 Pennsylvania Ave NW, Washington, DC";
my $pmark=$document->Placemark(
                   name=>"pmark",
                   styleUrl=>"myicon1",
                   address=>$address);
isa_ok ($pmark, 'Geo::GoogleEarth::Document::Placemark');
isa_ok ($pmark->structure, 'HASH');
is($pmark->address, $address, '$pmark->address');
$address.=" 20006";
$pmark->address($address);
is($pmark->address, $address, '$pmark->address');
#$pmark->lat(39);
#$pmark->lon(-77);
$pmark->snippet('s0', {maxLines=>"0"});
is($pmark->snippet, 's0', '$pmark->snippet');

my $networklink = $document->NetworkLink(name=>"n1", url=>"u0", visibility=>0);
isa_ok ($networklink, 'Geo::GoogleEarth::Document::NetworkLink');
isa_ok ($networklink->structure, 'HASH');
is($networklink->name, "n1", '$networklink->name');
is($networklink->url, "u0", '$networklink->url');
$networklink->url("u1");
is($networklink->url, "u1", '$networklink->url');
is($networklink->type, "NetworkLink", '$networklink->type');

my $icon="http://maps.google.com/mapfiles/kml/paddle/L.png";
my $style=$document->Style(id       => "myicon1",
                           iconHref => $icon);
is($style->id, "myicon1", '$style->id');
is($style->iconHref, $icon, '$style->iconHref');

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
    <visibility>0</visibility>
  </NetworkLink>
  <Placemark>
    <name>p1</name>
    <Point>
      <coordinates>1,2,3</coordinates>
    </Point>
    <description>&lt;html&gt;&lt;p&gt;p1&lt;/p&gt;&lt;/html&gt;</description>
  </Placemark>
  <Placemark>
    <name>pmark</name>
    <Snippet maxLines="0">s0</Snippet>
    <address>1600 Pennsylvania Ave NW, Washington, DC 20006</address>
    <styleUrl>myicon1</styleUrl>
  </Placemark>
  <Style id="myicon1">
    <IconStyle>
      <Icon>
        <href>http://maps.google.com/mapfiles/kml/paddle/L.png</href>
      </Icon>
    </IconStyle>
  </Style>
</Document>
};

is($document->render, $output, '$document->render');
#use Data::Dumper qw{};
#print Data::Dumper->Dump([$document->structure]);
#print Data::Dumper->Dump([$document]);

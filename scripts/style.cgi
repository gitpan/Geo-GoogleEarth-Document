#!/usr/bin/perl -w

=head1 NAME

style.cgi - Geo::GoogleEarth::Document example

=cut

use strict;
use CGI qw{};
use Geo::GoogleEarth::Document;

my $cgi=CGI->new();
my $document=Geo::GoogleEarth::Document->new(name=>"My Document Name");

my $index=0;
my @icon=map {sprintf("http://maps.google.com/mapfiles/kml/paddle/%s.png", $_)} ("A".."Z");
foreach my $lon (qw{-77.1 -77.2 -77.3 -77.4}) {
  my $folder=$document->Folder(name=>$lon);
  foreach my $lat (qw{39.1 39.2 39.3 39.4}) {
    my $icon=$icon[$index];
    my $id=sprintf "style%s", $index;
    my $point=$folder->Placemark(name     => "$lat $lon",
                                 lat      => $lat,
                                 lon      => $lon,
                                 styleUrl => "#$id",
                                 description => $cgi->html(
                                                  $cgi->p("$lat $lon"),
                                                  $cgi->img({-src=>$icon}),
                                                ),
                                );
    my $style=$document->Style(id=>$id, iconHref=>$icon);
    $index++;
  }
}

print $cgi->header('text/xml'),
      $document->render;

=head1 SAMPLE OUTPUT

  Content-Type: text/xml; charset=ISO-8859-1
  
  <?xml version='1.0' standalone='yes'?>
  <Document>
    <name>My Document Name</name>
    <Folder>
      <name>-77</name>
      <Placemark>
        <name>39 -77</name>
        <Point>
          <coordinates>-77,39,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39 -77&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>40 -77</name>
        <Point>
          <coordinates>-77,40,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;40 -77&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>41 -77</name>
        <Point>
          <coordinates>-77,41,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;41 -77&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
    </Folder>
    <Folder>
      <name>-78</name>
      <Placemark>
        <name>39 -78</name>
        <Point>
          <coordinates>-78,39,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39 -78&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>40 -78</name>
        <Point>
          <coordinates>-78,40,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;40 -78&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>41 -78</name>
        <Point>
          <coordinates>-78,41,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;41 -78&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
    </Folder>
    <Folder>
      <name>-79</name>
      <Placemark>
        <name>39 -79</name>
        <Point>
          <coordinates>-79,39,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39 -79&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>40 -79</name>
        <Point>
          <coordinates>-79,40,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;40 -79&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>41 -79</name>
        <Point>
          <coordinates>-79,41,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;41 -79&lt;/p&gt;&lt;/html&gt;</description>
      </Placemark>
    </Folder>
  </Document>

=cut

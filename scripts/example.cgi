#!/usr/bin/perl -w

=head1 NAME

example.cgi - Geo::GoogleEarth::Document example

=cut

use strict;
use CGI qw{};
use Geo::GoogleEarth::Document;

my $query=CGI->new();
my $document=Geo::GoogleEarth::Document->new(name=>"My Document Name");

foreach my $lon (qw{-77 -78 -79}) {
  my $folder=$document->Folder(name=>$lon);
  foreach my $lat (qw{39 40 41}) {
    my $point=$folder->Placemark(name    => "$lat $lon",
                                 lat     => $lat,
                                 lon     => $lon,
                                 Snippet => ["" => {maxLines=> 0} ],
                                 MyTag   => [X  => {opt1    => 1} ],
                                 MyTag2  => [Y  => {opt2    => 2} ],
                                 MyTag3  => {Z  => {opt2    => 2} }
                                );
  }
}

print $query->header('text/xml'),
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

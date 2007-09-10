#!/usr/bin/perl -w

=head1 NAME

simple.cgi - Geo::GoogleEarth::Document simple example

=cut

use strict;
use CGI qw{};
use Geo::GoogleEarth::Document;

my $query=CGI->new();
my $document=Geo::GoogleEarth::Document->new(name=>"DC Tour");
my $folder=$document->Folder(name=>"Government Folder");
$folder->Placemark(name=>"White House",
                   description=>q{<html>
                                   <p>White House</p>
                                   <p><a href="http://www.whitehouse.gov/">http://www.whitehouse.gov/</a></p>
                                  </html>},
                   lat=>38.8976,
                   lon=>-77.0366);
$folder->Placemark(name=>"United States Capitol",
                   description=>q{<html>
                                   <p>United States Capitol</p>
                                   <p><a href="http://www.aoc.gov/">http://www.aoc.gov/</a></p>
                                  </html>},
                   lat=>38.8899,
                   lon=>-77.0090);

print $query->header('text/xml'),
      $document->render;

__END__

=head1 SAMPLE OUTPUT

  Content-Type: text/xml; charset=ISO-8859-1
  
  <?xml version='1.0' standalone='yes'?>
  <Document>
    <name>DC Tour</name>
    <Folder>
      <name>Government Folder</name>
      <Placemark>
        <name>White House</name>
        <Point>
          <coordinates>-77.0366,38.8976,0</coordinates>
        </Point>
        <description>&lt;html&gt;
                                     &lt;p&gt;White House&lt;/p&gt;
                                     &lt;p&gt;&lt;a href=&quot;http://www.whitehouse.gov/&quot;&gt;http://www.whitehouse.gov/&lt;/a&gt;&lt;/p&gt;
                                    &lt;/html&gt;</description>
      </Placemark>
      <Placemark>
        <name>United States Capitol</name>
        <Point>
          <coordinates>-77.009,38.8899,0</coordinates>
        </Point>
        <description>&lt;html&gt;
                                     &lt;p&gt;United States Capitol&lt;/p&gt;
                                     &lt;p&gt;&lt;a href=&quot;http://www.aoc.gov/&quot;&gt;http://www.aoc.gov/&lt;/a&gt;&lt;/p&gt;
                                    &lt;/html&gt;</description>
      </Placemark>
    </Folder>
  </Document>

=cut

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
      <name>-77.1</name>
      <Placemark>
        <name>39.1 -77.1</name>
        <Point>
          <coordinates>-77.1,39.1,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.1 -77.1&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/A.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style0</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.2 -77.1</name>
        <Point>
          <coordinates>-77.1,39.2,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.2 -77.1&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/B.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style1</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.3 -77.1</name>
        <Point>
          <coordinates>-77.1,39.3,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.3 -77.1&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/C.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style2</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.4 -77.1</name>
        <Point>
          <coordinates>-77.1,39.4,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.4 -77.1&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/D.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style3</styleUrl>
      </Placemark>
    </Folder>
    <Folder>
      <name>-77.2</name>
      <Placemark>
        <name>39.1 -77.2</name>
        <Point>
          <coordinates>-77.2,39.1,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.1 -77.2&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/E.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style4</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.2 -77.2</name>
        <Point>
          <coordinates>-77.2,39.2,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.2 -77.2&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/F.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style5</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.3 -77.2</name>
        <Point>
          <coordinates>-77.2,39.3,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.3 -77.2&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/G.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style6</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.4 -77.2</name>
        <Point>
          <coordinates>-77.2,39.4,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.4 -77.2&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/H.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style7</styleUrl>
      </Placemark>
    </Folder>
    <Folder>
      <name>-77.3</name>
      <Placemark>
        <name>39.1 -77.3</name>
        <Point>
          <coordinates>-77.3,39.1,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.1 -77.3&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/I.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style8</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.2 -77.3</name>
        <Point>
          <coordinates>-77.3,39.2,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.2 -77.3&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/J.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style9</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.3 -77.3</name>
        <Point>
          <coordinates>-77.3,39.3,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.3 -77.3&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/K.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style10</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.4 -77.3</name>
        <Point>
          <coordinates>-77.3,39.4,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.4 -77.3&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/L.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style11</styleUrl>
      </Placemark>
    </Folder>
    <Folder>
      <name>-77.4</name>
      <Placemark>
        <name>39.1 -77.4</name>
        <Point>
          <coordinates>-77.4,39.1,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.1 -77.4&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/M.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style12</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.2 -77.4</name>
        <Point>
          <coordinates>-77.4,39.2,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.2 -77.4&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/N.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style13</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.3 -77.4</name>
        <Point>
          <coordinates>-77.4,39.3,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.3 -77.4&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/O.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style14</styleUrl>
      </Placemark>
      <Placemark>
        <name>39.4 -77.4</name>
        <Point>
          <coordinates>-77.4,39.4,0</coordinates>
        </Point>
        <description>&lt;html&gt;&lt;p&gt;39.4 -77.4&lt;/p&gt; &lt;img src=&quot;http://maps.google.com/mapfiles/kml/paddle/P.png&quot; /&gt;&lt;/html&gt;</description>
        <styleUrl>#style15</styleUrl>
      </Placemark>
    </Folder>
    <Style id="style0">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/A.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style1">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/B.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style2">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/C.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style3">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/D.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style4">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/E.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style5">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/F.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style6">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/G.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style7">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/H.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style8">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/I.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style9">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/J.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style10">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/K.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style11">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/L.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style12">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/M.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style13">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/N.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style14">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/O.png</href>
        </Icon>
      </IconStyle>
    </Style>
    <Style id="style15">
      <IconStyle>
        <Icon>
          <href>http://maps.google.com/mapfiles/kml/paddle/P.png</href>
        </Icon>
      </IconStyle>
    </Style>
  </Document>

=cut

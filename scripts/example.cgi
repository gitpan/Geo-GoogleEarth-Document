#!/usr/bin/perl -w
use strict;
use CGI qw{};
use Geo::GoogleEarth::Document;

my $query=CGI->new();
my $document=Geo::GoogleEarth::Document->new(name=>"My Document Name");

foreach my $lon (qw{-77 -78 -79}) {
  my $folder=$document->Folder(name=>$lon);
  foreach my $lat (qw{39 40 41}) {
    my $point=$folder->Placemark(name=>"$lat $lon",
                                 lat=>$lat,
                                 lon=>$lon);
  }
}

print $query->header('text/xml'),
      $document->render;

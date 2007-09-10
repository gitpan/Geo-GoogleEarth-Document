#!/usr/bin/perl -w
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

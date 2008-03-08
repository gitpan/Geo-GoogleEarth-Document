#!/usr/bin/perl -w

=head1 NAME

archive.pl - Geo::GoogleEarth::Document example to generate a KMZ file

=cut

use strict;
use Geo::GoogleEarth::Document qw{};
my $doc=Geo::GoogleEarth::Document->new();
foreach (0..99) {
  $doc->Placemark(lat=>$_, lon=>$_);
}
print $doc->archive;

=head1 Example Output

  $ zipinfo test.zip 
  Archive:  test.zip   693 bytes   1 file
  -rw-rw-rw-  2.0 unx    11358 bl defN  8-Mar-08 02:40 doc.kml
  1 file, 11358 bytes uncompressed, 565 bytes compressed:  95.0%

=cut

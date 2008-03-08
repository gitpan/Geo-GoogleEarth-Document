package Geo::GoogleEarth::Document;
use strict;
use base qw{Geo::GoogleEarth::Document::Folder}; 
use Geo::GoogleEarth::Document::Style;
use XML::Simple qw{};
use Archive::Zip qw{COMPRESSION_DEFLATED};
use IO::Scalar qw{};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.10';
}

=head1 NAME

Geo::GoogleEarth::Document - Generates GoogleEarth KML Documents

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document;
  my $document    = Geo::GoogleEarth::Document->new();  #is a special Folder...
  my $folder      = $document->Folder();                #Geo::GoogleEarth::Document::Folder object
  my $placemark   = $document->Placemark();             #Geo::GoogleEarth::Document::Placemark object
  my $networklink = $document->NetworkLink();           #Geo::GoogleEarth::Document::NetworkLink object
  my $style = $document->Style();                       #Geo::GoogleEarth::Document::Style object
  print $document->render();

=head1 DESCRIPTION

Geo::GoogleEarth::Document is a Perl object oriented interface that allows for the creation of XML documents that can be used with Google Earth.

Geo::GoogleEarth::Document is a L<Geo::GoogleEarth::Document::Folder> with a render method.

=head1 USAGE

This is all of the code you need to generate a complete Google Earth document.

  use Geo::GoogleEarth::Document;
  my $document=Geo::GoogleEarth::Document->new();
  $document->Placemark(address=>"1600 Pennsylvania Ave NW, Washington, DC");
  print $document->render;

=head2 render

Returns an XML document with an XML declaration and a root name of "Document"

  print $document->render;

=cut

sub render {
  my $self=shift();

  my $xs=XML::Simple->new(XMLDecl=>1, RootName=>q{Document}, ForceArray=>1);
  return $xs->XMLout($self->structure);
}

=head2 archive

Returns a KMZ formatted Zipped archive of the XML document

  print $document->archive;

=cut

sub archive {
  my $self=shift;
  my $azip=Archive::Zip->new;
  my $member=$azip->addString($self->render, "doc.kml");
  $member->desiredCompressionMethod(COMPRESSION_DEFLATED);
  $member->desiredCompressionLevel(9);

  my $archive=q{};
  my $iosh=IO::Scalar->new( \$archive );
  $azip->writeToFileHandle($iosh);
  $iosh->close;

  return $archive;
}

=head2 Style

Constructs a new Style object and appends it to the document object.  Returns the object reference.

  my $style=$document->Style(id=>"myicon1",
                 iconHref=>"http://maps.google.com/mapfiles/kml/paddle/L.png");

=cut

sub Style {
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::Style->new(@_);
  $self->data($obj);
  return $obj;
}

=head1 BUGS

=head1 SUPPORT

Try geo-perl email list.

=head1 AUTHOR

    Michael R. Davis (mrdvt92)
    CPAN ID: MRDVT

=head1 COPYRIGHT

This program is free software licensed under the...

	The BSD License

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

L<Geo::GoogleEarth::Document> creates a GoogleEarth KML Document.

L<Geo::GoogleEarth::Document::Base> is the base for Geo::GoogleEarth::Document::* packages.

L<Geo::GoogleEarth::Document::Folder> is a Geo::GoogleEarth::Document folder object.

L<Geo::GoogleEarth::Document::NetworkLink> is a Geo::GoogleEarth::Document  NetworkLink object.

L<Geo::GoogleEarth::Document::Placemark> is a Geo::GoogleEarth::Document Placemark object.

L<Geo::GoogleEarth::Document::Style> is a Geo::GoogleEarth::Document Style object.

L<XML::Simple> is used by this package to generate XML from a data structure.

=cut

1;

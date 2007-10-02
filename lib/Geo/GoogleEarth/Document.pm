package Geo::GoogleEarth::Document;
use strict;
use base qw{Geo::GoogleEarth::Document::Folder}; 
use XML::Simple qw{};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.07';
}

=head1 NAME

Geo::GoogleEarth::Document - Creates a GoogleEarth KML Document

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document;
  my $document    = Geo::GoogleEarth::Document->new();  #is a special Folder...
  my $folder      = $document->Folder();                #Geo::GoogleEarth::Document::Folder object
  my $placemark   = $document->Placemark();             #Geo::GoogleEarth::Document::Placemark object
  my $networklink = $document->NetworkLink();           #Geo::GoogleEarth::Document::NetworkLink object
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

L<XML::Simple> is used by this package to generate XML from a data structure.

=cut

1;

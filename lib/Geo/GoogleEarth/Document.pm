package Geo::GoogleEarth::Document;
use strict;
use base qw{Geo::GoogleEarth::Document::Folder}; 
use XML::Simple qw{};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.02';
}

=head1 NAME

Geo::GoogleEarth::Document - Creates a GoogleEarth KML Document

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document;
  my $document    = Geo::GoogleEarth::Document->new();  #is a special Folder...
  my $folder      = $document->Folder();      #Geo::GoogleEarth::Document::Folder object
  my $placemark   = $document->Placemark();   #Geo::GoogleEarth::Document::Placemark object
  my $networklink = $document->NetworkLink(); #Geo::GoogleEarth::Document::NetworkLink object
  print $document->render();

=head1 DESCRIPTION

=head1 USAGE

=head2 render

=cut

sub render {
  my $self=shift();

  my $xs=XML::Simple->new(XMLDecl=>1, RootName=>q{Document}, ForceArray=>1);
  return $xs->XMLout($self->structure);
}

=head1 BUGS

=head1 SUPPORT

=head1 AUTHOR

    Michael R. Davis
    CPAN ID: MRDVT
    STOP, LLC
    domain=>stopllc,tld=>com,account=>mdavis
    http://www.stopllc.com/

=head1 COPYRIGHT

This program is free software licensed under the...

	The BSD License

The full text of the license can be found in the
LICENSE file included with this module.

=head1 SEE ALSO

perl(1).

=cut

1;

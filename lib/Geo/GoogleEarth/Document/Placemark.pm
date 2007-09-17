package Geo::GoogleEarth::Document::Placemark;
use strict;
use base qw{Geo::GoogleEarth::Document::Base};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.04';
}

=head1 NAME

Geo::GoogleEarth::Document::Placemark - Geo::GoogleEarth::Document::Placemark

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document;
  my $document=Geo::GoogleEarth::Document->new();
  $document->Placemark();

=head1 DESCRIPTION

Geo::GoogleEarth::Document::Placemark is a L<Geo::GoogleEarth::Document::Base> with a few other methods.

=head1 USAGE

  my $placemark=$document->Placemark(name=>"Placemark Name",
                                     lat=>$lat,
                                     lon=>$lon,
                                     alt=>$alt);

=head1 CONSTRUCTOR

=head2 new

  my $obj = Geo::GoogleEarth::Document::Placemark->new(
              name       => "White House",
              lat        => 38.89769,       #WGS-84
              lon        => -77.036549,     #WGS-84
              alt        => 30,             #meters above ellipsoid (opt)
            );

  my $obj = Geo::GoogleEarth::Document::Placemark->new(
              name       => "White House",
              address    => "1600 Pennsylvania Ave NW, Washington, DC 20006",
            );

=head1 METHODS

=head2 type

Returns the object type.

=cut

sub type {
  my $self=shift();
  return "Placemark";
}

=head2 structure

Returns a hash reference for feeding directly into L<XML::Simple>.

=cut

sub structure {
  my $self=shift();
  my $structure={name => [$self->name]};
  if (defined($self->lat) and defined($self->lon)) {
    $structure->{'Point'} = [{coordinates => [join(",", $self->lon,
                                                        $self->lat,
                                                        $self->alt || 0)]}]
  }
  $structure->{'description'} = [$self->description]
                                    if defined $self->{'description'};
  $structure->{'visibility'}  = [$self->{'visibility'}]
                                    if defined $self->{'visibility'};
  $structure->{'address'}     = [$self->{'address'}]
                                    if defined $self->{'address'};
  return $structure;
}

=head2 description

Set or returns the description.  Google Earth uses this as the HTML description in the Placemark popup window.

=cut

sub description {
  my $self=shift();
  $self->{'description'}=join("", @_) if (@_);
  return $self->{'description'};
}

=head2 lat

Sets or returns lat. The format is signed decimal degrees WGS-84.

=cut

sub lat {
  my $self=shift();
  $self->{'lat'}=shift() if (@_);
  return $self->{'lat'};
}

=head2 lon

Sets or returns lon. The format is signed decimal degrees WGS-84.

=cut

sub lon {
  my $self=shift();
  $self->{'lon'}=shift() if (@_);
  return $self->{'lon'};
}

=head2 alt

Sets or returns alt. The units are meters above the ellipsoid WGS-84.

Typically, Google Earth "snaps" Placemarks to the surface.

=cut

sub alt {
  my $self=shift();
  $self->{'alt'}=shift() if (@_);
  return $self->{'alt'};
}

=head2 adddress

Sets or returns adddress

=cut

sub adddress {
  my $self=shift();
  $self->{'adddress'}=shift() if (@_);
  return $self->{'adddress'};
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

=cut

1;

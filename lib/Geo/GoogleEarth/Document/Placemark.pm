package Geo::GoogleEarth::Document::Placemark;
use strict;
use base qw{Geo::GoogleEarth::Document::Base};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.01';
}

=head1 NAME

Geo::GoogleEarth::Document::Placemark - Geo::GoogleEarth::Document::Placemark

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document::Placemark;
  my $obj = Geo::GoogleEarth::Document::Placemark->new();

=head1 DESCRIPTION

=head1 USAGE

=head1 CONSTRUCTOR

=head2 new

  my $obj = Geo::GoogleEarth::Document::Placemark->new(
              name       => "White House",
              description=> "<html><p>White House</p></html>",
              address    => "1600 Pennsylvania Ave NW, Washington, DC 20006", #(opt)
              lat        => 38.89769,       #WGS-84
              lon        => -77.036549,     #WGS-84
              alt        => 30,             #meters above ellipsoid (opt)
              visibility => 0,              #(opt)
            );

=head1 METHODS

=head2 structure

=cut

sub structure {
  my $self=shift();
  my @list=$self->data;
  my $structure={
       name       => [$self->{'name'}        || "Name Goes Here!"],
       description=> [$self->{'description'} ||
                      "<html><p>". $self->name. "</p></html>" ||
                      "<html><p>Description Goes Here!</p></html>"],
       Point      => [{coordinates => [join(",", $self->{'lon'} || 0,
                                                 $self->{'lat'} || 0,
                                                 $self->{'alt'} || 0)]}]};
  $structure->{'visibility'} = [$self->{'visibility'}] if defined $self->{'visibility'};
  $structure->{'address'}    = [$self->{'address'}] if defined $self->{'address'};
  return $structure;
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

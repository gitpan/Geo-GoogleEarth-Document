package Geo::GoogleEarth::Document::Style;
use strict;
use base qw{Geo::GoogleEarth::Document::Base};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.01';
}

=head1 NAME

Geo::GoogleEarth::Document::Style - Geo::GoogleEarth::Document::Style

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document;
  my $document=Geo::GoogleEarth::Document->new();
  $document->Style();

=head1 DESCRIPTION

Geo::GoogleEarth::Document::Style is a L<Geo::GoogleEarth::Document::Base> with a few other methods.

=head1 USAGE

  my $style=$document->Style(id=>"Style_Internal_HREF",
                             iconHref=>"http://.../path/image.png");

=head1 CONSTRUCTOR

=head2 new

  my $style=$document->Style(id=>"Style_Internal_HREF",
                             iconHref=>"http://.../path/image.png");

=head1 METHODS

=head2 type

Returns the object type.

  my $type=$style->type;

=cut

sub type {
  my $self=shift();
  return "Style";
}

=head2 structure

Returns a hash reference for feeding directly into L<XML::Simple>.

  my $structure=$style->structure;

=cut

sub structure {
  my $self=shift();
#{
#          'Style' => {
#                     'IconStyle' => {
#                                    'Icon' => {
#                                              'href' => 'http://maps.google.com/mapfiles/kml/paddle/L.png'
#                                            }
#                                  },
#                     'id' => 'http://maps.google.com/mapfiles/kml/paddle/L.png'
#                   }
#        };
  my $structure={id=>$self->id};
  my %skip=map {$_=>1} (qw{id iconHref});
  if (defined($self->iconHref)) {
    $structure->{'IconStyle'} = [{Icon=> [{href=>[$self->iconHref]}]}];
  }
  foreach my $key (keys %$self) {
    next if exists $skip{$key};
    $structure->{$key} = {content=>$self->function($key)};
  }
  my %options=$self->options;
  foreach my $key (keys %options) {
    my $hash=$structure->{$key}||{};
    my @hash=%$hash;
    push @hash, %{$self->options->{$key}};
    $structure->{$key}={@hash};
  }
  return $structure;
}

=head2 id

=cut

sub id {
  my $self=shift();
  $self->{'id'}=shift() if (@_);
  return $self->{'id'};
}

=head2 iconHref

=cut

sub iconHref {
  my $self=shift();
  $self->{'iconHref'}=shift() if (@_);
  return $self->{'iconHref'};
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

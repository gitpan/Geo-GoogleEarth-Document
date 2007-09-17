package Geo::GoogleEarth::Document::Folder;
use strict;
use base qw{Geo::GoogleEarth::Document::Base}; 
use Geo::GoogleEarth::Document::Folder;
use Geo::GoogleEarth::Document::Placemark;
use Geo::GoogleEarth::Document::NetworkLink;

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.04';
}

=head1 NAME

Geo::GoogleEarth::Document::Folder - Geo::GoogleEarth::Document::Folder object

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document::Folder;

=head1 DESCRIPTION

Geo::GoogleEarth::Document::Folder is a L<Geo::GoogleEarth::Document::Base> with a few other methods.

=head1 USAGE

  $document->Folder();
  $folder->Folder();

=head2 Folder

Creates a new folder object in the current parent folder object.  Returns the object reference if you need to make any setting changes after construction.

=cut

sub Folder {
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::Folder->new(@_);
  $self->data($obj);
  return $obj;
}

=head2 Placemark

Creates a Placemark in the current parent folder object.  Returns the object reference if you need to make any setting changes after construction.

=cut

sub Placemark{
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::Placemark->new(@_);
  $self->data($obj);
  return $obj;
}

=head2 NetworkLink

Creates a NetworkLink in the current parent folder object.  Returns the object reference if you need to make any setting changes after construction.

=cut

sub NetworkLink {
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::NetworkLink->new(@_);
  $self->data($obj);
  return $obj;
}

=head2 type

Returns the object type.

=cut

sub type {
  my $self=shift();
  return "Folder";
}

=head2 structure

Returns a hash reference for feeding directly into L<XML::Simple>.

Unfortunately, this package cannot guarantee how Folders, Placemarks, or NetworkLinks are ordered when in the same folder.  Because it's a hash reference!  But, order is perserved within a group of Folders, NetworkLink, and Placemarks.

=cut

sub structure {
  my $self=shift();
  my $structure={name=>[$self->name]}; #{Placemark=>[], Folder=>[], ...}
  foreach my $obj ($self->data) {
    #$obj->type should be one of Placemark, Folder, NetworkLink
    $structure->{$obj->type}=[] unless ref($structure->{$obj->type}) eq 'ARRAY';
    #$obj->structure should be a HASH structure to feed into XML::Simple
    push @{$structure->{$obj->type}}, $obj->structure;
  }
  return $structure;
}

=head2 data

Pushes arguments onto data array and returns an array or reference that holds folder object content.  This is a list of objects that supports a type and structure method.

=cut

sub data {
  my $self=shift();
  $self->{'data'} = [] unless ref($self->{'data'}) eq ref([]);
  my $data=$self->{'data'};
  if (@_) {
    push @$data, @_;
  }
  return wantarray ? @$data : $data;
}

=head1 BUGS

Due to a limitation in L<XML::Simple> and the fact that we feed it a hash, it is not possible to specify the order of Folders, Placemarks and NetworkLinks.  However, this package does preserve the order of creation within Folders, Placemarks, and NetworkLinks.  A good work around is to put unique types of objects in folders.  

=head1 TODO

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

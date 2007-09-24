package Geo::GoogleEarth::Document::Base;
use strict;

=head1 NAME

Geo::GoogleEarth::Document::Base - Base for Geo::GoogleEarth::Document::* packages

=head1 SYNOPSIS

  use base qw{Geo::GoogleEarth::Document::Base};

=head1 DESCRIPTION

The is the base of all Geo::GoogleEarth::Document packages.

=head1 USAGE

=head1 CONSTRUCTOR

=head2 new

  my $document = Geo::GoogleEarth::Document->new();

=cut

sub new {
  my $this = shift();
  my $class = ref($this) || $this;
  my $self = {};
  bless $self, $class;
  $self->initialize(@_);
  return $self;
}

=head1 METHODS

=cut

sub initialize {
  my $self = shift();
  %$self=@_;
}

=head2 function

=cut

sub function {
  my $self=shift();
  my $function=shift();
  if (@_) {
    $self->{$function} = shift();
    if (@_) {
      my $hash=shift();
      $self->{'options'}->{$function}=ref($hash) eq 'HASH' ? $hash : {};
    }
  }
  return $self->{$function};
}

=head2 name

Sets or returns the name property.

  my $name=$folder->name;
  $placemark->name("New Name");
  $document->name("New Name");

=cut

sub name {
  my $self=shift();
  return $self->function('name', @_);
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

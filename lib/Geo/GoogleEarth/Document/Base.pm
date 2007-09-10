package Geo::GoogleEarth::Document::Base;
use Geo::GoogleEarth::Document::Folder;
use Geo::GoogleEarth::Document::Placemark;
use Geo::GoogleEarth::Document::NetworkLink;

use strict;

=head1 NAME

Geo::GoogleEarth::Document::Base - Base for Geo::GoogleEarth::Document::* packages

=head1 SYNOPSIS

  use base qw{Geo::GoogleEarth::Document::Base};

=head1 DESCRIPTION

=head1 USAGE

=head1 CONSTRUCTOR

=head2 new

  my $obj = Geo::GoogleEarth::Document::Base->new();

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

=head2 data

=cut

sub data {
  my $self=shift();
  $self->{'data'} = [] unless defined($self->{'data'});
  my $data=$self->{'data'};
  if (@_) {
    push @$data, @_;
  }
  return wantarray ? @$data : $data;
}

=head2 name

=cut

sub name {
  my $self=shift();
  return $self->{'name'} || 'name not defined';
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

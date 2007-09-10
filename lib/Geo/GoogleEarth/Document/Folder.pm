package Geo::GoogleEarth::Document::Folder;
use strict;
use base qw{Geo::GoogleEarth::Document::Base}; 
use Data::Dumper qw{};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.01';
}

=head1 NAME

Geo::GoogleEarth::Document::Folder - Geo::GoogleEarth::Document::Folder object

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document::Folder;

=head1 DESCRIPTION

=head1 USAGE

=head2 structure

=cut

sub structure {
  my $self=shift();
  my @Folder=();
  my @Placemark=();
  my @NetworkLink=();
  foreach ($self->data) {
    push @Folder,
          $_->structure if ref($_) eq 'Geo::GoogleEarth::Document::Folder';
    push @Placemark,
          $_->structure if ref($_) eq 'Geo::GoogleEarth::Document::Placemark';
    push @NetworkLink,
          $_->structure if ref($_) eq 'Geo::GoogleEarth::Document::NetworkLink';
  }

  my $hash={name=>[$self->name]};
  $hash->{'Folder'}     = \@Folder      if scalar(@Folder);
  $hash->{'Placemark'}  = \@Placemark   if scalar(@Placemark);
  $hash->{'NetworkLink'}= \@NetworkLink if scalar(@NetworkLink);
  return $hash;
}

=head2 Folder

=cut

sub Folder {
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::Folder->new(@_);
  $self->data($obj);
  return $obj;
}

=head2 Placemark

=cut

sub Placemark{
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::Placemark->new(@_);
  $self->data($obj);
  return $obj;
}

=head2 NetworkLink

=cut

sub NetworkLink {
  my $self=shift();
  my $obj=Geo::GoogleEarth::Document::NetworkLink->new(@_);
  $self->data($obj);
  return $obj;
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

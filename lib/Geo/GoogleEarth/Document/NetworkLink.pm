package Geo::GoogleEarth::Document::NetworkLink;
use strict;
use base qw{Geo::GoogleEarth::Document::Base};

BEGIN {
    use vars qw($VERSION);
    $VERSION     = '0.01';
}

=head1 NAME

Geo::GoogleEarth::Document::NetworkLink - Geo::GoogleEarth::Document::NetworkLink

=head1 SYNOPSIS

  use Geo::GoogleEarth::Document::NetworkLink;

=head1 DESCRIPTION

=head1 USAGE

=head2 structure

=cut

sub structure {
  my $self=shift();
  return {name=>[$self->name],
          url=>{href=>[$self->url]}};
}

=head2 url

=cut

sub url {
  my $self=shift();
  return $self->{'url'} or die("Error: url must de defined.");
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

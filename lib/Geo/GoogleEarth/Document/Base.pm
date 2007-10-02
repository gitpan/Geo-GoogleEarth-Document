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

  my $document = Geo::GoogleEarth::Document->new(key1=>value1,
                                                 key2=>[value=>{opt1=>val1}],
                                                 key3=>{value=>{opt2=>val2}});

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
  foreach my $key (keys %$self) {
    if (ref($self->{$key}) eq 'ARRAY') {
      #[text => {opt->val}]
      my @array=@{$self->{$key}};
      $self->{'options'}->{$key}=$array[1] if defined($array[1]);
      $self->{$key}=$array[0];
      use Data::Dumper qw{};
      print Data::Dumper->Dump([@array]) ,"\n";
    } elsif (ref($self->{$key}) eq 'HASH') {
      #{text => {opt->val}}
      my @array=%{$self->{$key}};
      $self->{'options'}->{$key}=$array[1] if defined($array[1]);
      $self->{$key}=$array[0];
    } else { #scalar and objects that overload ""
      #text
    }
  }
}

=head2 function

This is an internal method that may allow hackers to add custom fields.

  $placemark->function('HashKey' => {key1=>value1, key2=>value2});

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

=head2 options

Returns options hash.

=cut

sub options {
  my $self=shift();
  my $hash=$self->{'options'};
  if (ref($hash) eq 'HASH') {
    return wantarray ? %$hash : $hash;
  } else {
    return wantarray ? () : undef();
  }
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

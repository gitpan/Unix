package Unix;

use 5.006;
use strict;
use warnings;

use FileHandle;

require Exporter;

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Unix ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.

our %EXPORT_TAGS = ( 'all' => [ qw() ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(UNIX);

our $VERSION = '0.01';

# Preloaded methods go here.

sub UNIX {

    my $shell_string = shift or return;
    my $shell_cmd    = "$shell_string |";
    my $fh           = new FileHandle $shell_cmd;
    $fh;
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Unix - Perl extension for shell access

=head1 SYNOPSIS

  use Unix;

  my $fh = UNIX ("ps -eaf");

  while ( <$fh> ) {
     warn $_;
  }  
  
  my $fh = UNIX "cat /etc/passwd";  

  # fine as long as getline() doesnt return 0
  while ($_ = $fh->getline) { 


#    $_ = (split ':')[4];
#    print $_, $/;
     print ( (split ':')[4], $/ );

  }



=head1 DESCRIPTION

This module is nothing but syntactic sugar for something I do a lot of:

 use FileHandle;
 my $fh = new FileHandle "$unix_cmd |";

I just prefer the cleanliness of:

 use Unix;
 my $fh = UNIX $unix_cmd;

In other words, I prefer the DWIM approach that this module affords me,
albeit a small amount.

I imagine this might work on Windows and other machines.


=head1 AUTHOR

T. M. Brannon, E<lt>tbone@cpan.org<gt>

=head1 SEE ALSO

L<Proc::SafePipe>.

=cut

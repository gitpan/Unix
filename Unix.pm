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

our $VERSION = '0.02';

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

=head2 Response to Criticisms at http://cpanratings.perl.org/d/Unix

=head3 Simon Cozens

In Software Engineering it is very important that you state what you intend
to do as opposed to actually doing it. If a piece of code performs the same
conceptual function more than once, then that concept must be packaged. 

To wit, a recent thread on Perlmonks.org shows just how widely people's views
contrast on this subject. The thread:

 http://perlmonks.org/index.pl?node_id=287647

was about how to "slurp" a file. Some people were keen on
C<my $string = do {local $/;<DATA>};> while someone else
suggested L<File::Slurp|File::Slurp> to
which came the query:

   why get a module and a function just for this two expression idiom?

And that is the central point and one on which I am 
_very_ obsessive about my code talking to a human as opposed to talking to a
computer... definitional succinctness is and always will be my guiding factor. 
If you can show a more definitional way of handling this process, I am all
ears.


Regarding a top-level namespace, I am very conscientious about creating new
top-level namespaces. There were already several Unix::* modules on CPAN,
so I did not feel I have created another.

True, this module is not Unix-specific, but it was Unix-*inspired*.

=head3 Response to Juerd

"Just syntactic sugar" and its importance in my coding style was discussed 
above.

Regarind the amount of space taken for a such a simple module, it is 
unfortunate that the only available packaging in Perl is modules. I think a 
C preprocessor macro is more appropriate for the intent of Unix.pm... did
you see the type of voodoo that was required in 
L<Semi::Semicolons> to do a simple string rewrite? In plain C, one could
simply write:

  #define peterbilt ;

and be done. It would be nice to have some sort of CPP for Perl... one that
is simpler than the current source filters.

Regarding testing, what kind of test could I do that would run on someone
else's machine for certain. Ditto for portability.

=head3 Response to Unspoken Criticism

I spent a good amount of time on CPAN looking for a solution to what I wanted.
I looked at L<Pipe|Pipe> and L<Proc::SafePipe> but nothing really seemd to 
fit.


=head1 AUTHOR

T. M. Brannon, <tbone@cpan.org>

=head1 SEE ALSO

L<Proc::SafePipe>.

=cut

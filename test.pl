# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 1 };
use Unix;
ok(1); # If we made it this far, we're ok.

#########################

# Insert your test code below, the Test module is use()ed here so read
# its man page ( perldoc Test ) for help writing this test script.

my $fh = UNIX ("ps -eaf");

while ( <$fh> ) {
    warn $_;
}

my $fh = UNIX "cat /etc/passwd";
while ($_ = $fh->getline) { # fine as long as getline() doesnt return 0


#    $_ = (split ':')[4];
#    print $_, $/;
     print ( (split ':')[4], $/ );

}
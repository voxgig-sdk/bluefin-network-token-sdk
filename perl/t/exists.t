#!perl
# BluefinNetworkToken SDK exists test

use strict;
use warnings;
use Test::More;
use FindBin;
use lib "$FindBin::Bin/../lib";

use BluefinNetworkTokenSDK;

my $testsdk = BluefinNetworkTokenSDK->test(undef, undef);
ok(defined $testsdk, 'create test sdk');

done_testing();

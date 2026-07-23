# BluefinNetworkToken SDK result

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/../lib/Voxgig/Struct.pm"));
require(Cwd::abs_path("$__dir/helpers.pm"));

package BluefinNetworkTokenResult;

sub new {
  my ($class, $resmap) = @_;
  $resmap = {} unless defined $resmap;

  my $s = BluefinNetworkTokenHelpers::gp($resmap, 'status');
  my $status = (defined $s && !ref $s && Scalar::Util::looks_like_number($s)) ? int($s) : -1;

  my $st = BluefinNetworkTokenHelpers::gp($resmap, 'statusText');
  my $status_text = (defined $st && !ref $st) ? "$st" : '';

  my $h = BluefinNetworkTokenHelpers::gp($resmap, 'headers');
  my $rm = BluefinNetworkTokenHelpers::gp($resmap, 'resmatch');

  return bless {
    ok          => BluefinNetworkTokenHelpers::is_true(BluefinNetworkTokenHelpers::gp($resmap, 'ok')) ? 1 : 0,
    status      => $status,
    status_text => $status_text,
    headers     => (Voxgig::Struct::ismap($h) ? $h : {}),
    body        => BluefinNetworkTokenHelpers::gp($resmap, 'body'),
    err         => BluefinNetworkTokenHelpers::gp($resmap, 'err'),
    resdata     => BluefinNetworkTokenHelpers::gp($resmap, 'resdata'),
    resmatch    => (Voxgig::Struct::ismap($rm) ? $rm : undef),
    paging      => undef,
    streaming   => undef,
    stream      => undef,
  }, $class;
}

1;

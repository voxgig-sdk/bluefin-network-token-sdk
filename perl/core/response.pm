# BluefinNetworkToken SDK response

use strict;
use warnings;

use File::Basename ();
use Cwd ();
use Scalar::Util ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/../lib/Voxgig/Struct.pm"));
require(Cwd::abs_path("$__dir/helpers.pm"));

package BluefinNetworkTokenResponse;

sub new {
  my ($class, $resmap) = @_;
  $resmap = {} unless defined $resmap;

  my $s = BluefinNetworkTokenHelpers::gp($resmap, 'status');
  my $status = (defined $s && !ref $s && Scalar::Util::looks_like_number($s)) ? int($s) : -1;

  my $st = BluefinNetworkTokenHelpers::gp($resmap, 'statusText');
  my $status_text = (defined $st && !ref $st) ? "$st" : '';

  my $jf = BluefinNetworkTokenHelpers::gp($resmap, 'json');
  my $json_func = (ref $jf eq 'CODE') ? $jf : undef;

  return bless {
    status      => $status,
    status_text => $status_text,
    headers     => BluefinNetworkTokenHelpers::gp($resmap, 'headers'),
    json_func   => $json_func,
    body        => BluefinNetworkTokenHelpers::gp($resmap, 'body'),
    err         => BluefinNetworkTokenHelpers::gp($resmap, 'err'),
    # Set by a transport that could not read a non-blank body as JSON.
    unreadable  => (BluefinNetworkTokenHelpers::gp($resmap, 'unreadable') ? 1 : 0),
  }, $class;
}

1;

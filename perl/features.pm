# BluefinNetworkToken SDK feature factory

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/feature/base_feature.pm"));
require(Cwd::abs_path("$__dir/feature/audit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/clienttrack_feature.pm"));
require(Cwd::abs_path("$__dir/feature/idempotency_feature.pm"));
require(Cwd::abs_path("$__dir/feature/log_feature.pm"));
require(Cwd::abs_path("$__dir/feature/metrics_feature.pm"));
require(Cwd::abs_path("$__dir/feature/paging_feature.pm"));
require(Cwd::abs_path("$__dir/feature/ratelimit_feature.pm"));
require(Cwd::abs_path("$__dir/feature/retry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/telemetry_feature.pm"));
require(Cwd::abs_path("$__dir/feature/test_feature.pm"));
require(Cwd::abs_path("$__dir/feature/timeout_feature.pm"));

package BluefinNetworkTokenFeatures;

sub make_feature {
  my ($name) = @_;
  $name = '' unless defined $name;
  return BluefinNetworkTokenBaseFeature->new if 'base' eq $name;
  return BluefinNetworkTokenAuditFeature->new if 'audit' eq $name;
  return BluefinNetworkTokenClienttrackFeature->new if 'clienttrack' eq $name;
  return BluefinNetworkTokenIdempotencyFeature->new if 'idempotency' eq $name;
  return BluefinNetworkTokenLogFeature->new if 'log' eq $name;
  return BluefinNetworkTokenMetricsFeature->new if 'metrics' eq $name;
  return BluefinNetworkTokenPagingFeature->new if 'paging' eq $name;
  return BluefinNetworkTokenRatelimitFeature->new if 'ratelimit' eq $name;
  return BluefinNetworkTokenRetryFeature->new if 'retry' eq $name;
  return BluefinNetworkTokenTelemetryFeature->new if 'telemetry' eq $name;
  return BluefinNetworkTokenTestFeature->new if 'test' eq $name;
  return BluefinNetworkTokenTimeoutFeature->new if 'timeout' eq $name;
  return BluefinNetworkTokenBaseFeature->new;
}

1;

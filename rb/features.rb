# BluefinNetworkToken SDK feature factory

require_relative 'feature/base_feature'
require_relative 'feature/audit_feature'
require_relative 'feature/clienttrack_feature'
require_relative 'feature/debug_feature'
require_relative 'feature/idempotency_feature'
require_relative 'feature/log_feature'
require_relative 'feature/metrics_feature'
require_relative 'feature/paging_feature'
require_relative 'feature/ratelimit_feature'
require_relative 'feature/retry_feature'
require_relative 'feature/telemetry_feature'
require_relative 'feature/test_feature'
require_relative 'feature/timeout_feature'


module BluefinNetworkTokenFeatures
  def self.make_feature(name)
    case name
    when "base"
      BluefinNetworkTokenBaseFeature.new
    when "audit"
      BluefinNetworkTokenAuditFeature.new
    when "clienttrack"
      BluefinNetworkTokenClienttrackFeature.new
    when "debug"
      BluefinNetworkTokenDebugFeature.new
    when "idempotency"
      BluefinNetworkTokenIdempotencyFeature.new
    when "log"
      BluefinNetworkTokenLogFeature.new
    when "metrics"
      BluefinNetworkTokenMetricsFeature.new
    when "paging"
      BluefinNetworkTokenPagingFeature.new
    when "ratelimit"
      BluefinNetworkTokenRatelimitFeature.new
    when "retry"
      BluefinNetworkTokenRetryFeature.new
    when "telemetry"
      BluefinNetworkTokenTelemetryFeature.new
    when "test"
      BluefinNetworkTokenTestFeature.new
    when "timeout"
      BluefinNetworkTokenTimeoutFeature.new
    else
      BluefinNetworkTokenBaseFeature.new
    end
  end
end

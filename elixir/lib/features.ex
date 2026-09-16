# BluefinNetworkToken SDK feature factory

defmodule BluefinNetworkToken.Features do
  def make_feature(name) do
    case name do
      "audit" -> BluefinNetworkToken.Feature.Audit.new()
      "clienttrack" -> BluefinNetworkToken.Feature.Clienttrack.new()
      "debug" -> BluefinNetworkToken.Feature.Debug.new()
      "idempotency" -> BluefinNetworkToken.Feature.Idempotency.new()
      "log" -> BluefinNetworkToken.Feature.Log.new()
      "metrics" -> BluefinNetworkToken.Feature.Metrics.new()
      "paging" -> BluefinNetworkToken.Feature.Paging.new()
      "ratelimit" -> BluefinNetworkToken.Feature.Ratelimit.new()
      "retry" -> BluefinNetworkToken.Feature.Retry.new()
      "telemetry" -> BluefinNetworkToken.Feature.Telemetry.new()
      "test" -> BluefinNetworkToken.Feature.Test.new()
      "timeout" -> BluefinNetworkToken.Feature.Timeout.new()
      _ -> BluefinNetworkToken.Feature.new()
    end
  end
end

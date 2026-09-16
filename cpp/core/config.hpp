// Generated API configuration (mirrors Config_java / core/config.go).

#ifndef SDK_CORE_CONFIG_HPP
#define SDK_CORE_CONFIG_HPP

#include <memory>
#include <string>
#include <vector>

#include "../core/struct.hpp"
#include "../core/types.hpp"
#include "../feature/base.hpp"
#include "../feature/audit.hpp"
#include "../feature/clienttrack.hpp"
#include "../feature/debug.hpp"
#include "../feature/idempotency.hpp"
#include "../feature/log.hpp"
#include "../feature/metrics.hpp"
#include "../feature/paging.hpp"
#include "../feature/ratelimit.hpp"
#include "../feature/retry.hpp"
#include "../feature/telemetry.hpp"
#include "../feature/test.hpp"
#include "../feature/timeout.hpp"

namespace sdk {

inline const char* config_json() {
  return
    "{\"main\":{\"name\":\"BluefinNetworkToken\",\"slug\":\"bluefin-network-token\",\"version\":\"0.1.1\",\"target\":\"cpp\"},\"feature\":{\"audit\":{\"options\":{\"active\":false,\"actor\":\"anonymous\",\"max\":1000},\"optspec\":{\"now\":\"`$FUNCTION`\",\"sink\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"none\"},\"clienttrack\":{\"options\":{\"active\":false,\"clientVersion\":\"0.0.1\"},\"optspec\":{\"clientName\":\"`$STRING`\",\"clientVersion\":\"`$STRING`\",\"headers\":\"`$MAP`\",\"idgen\":\"`$FUNCTION`\",\"sessionId\":\"`$STRING`\"},\"strict\":false,\"transport\":\"none\"},\"debug\":{\"options\":{\"active\":false,\"max\":100,\"redact\":[\"authorization\",\"cookie\",\"set-cookie\",\"api-key\",\"apikey\",\"x-api-key\",\"idempotency-key\"]},\"optspec\":{\"now\":\"`$FUNCTION`\",\"onEntry\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"none\"},\"idempotency\":{\"options\":{\"active\":false,\"header\":\"Idempotency-Key\",\"methods\":[\"POST\",\"PUT\",\"PATCH\",\"DELETE\"],\"ops\":[\"create\",\"update\",\"remove\"]},\"optspec\":{\"keygen\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"none\"},\"log\":{\"options\":{\"active\":true},\"optspec\":{\"level\":\"`$STRING`\",\"logger\":\"`$ANY`\"},\"strict\":false,\"transport\":\"none\"},\"metrics\":{\"options\":{\"active\":false},\"optspec\":{\"now\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"none\"},\"paging\":{\"options\":{\"active\":false,\"afterVar\":\"after\",\"cursorParam\":\"cursor\",\"firstVar\":\"first\",\"limitParam\":\"limit\",\"pageParam\":\"page\",\"startPage\":1},\"optspec\":{\"limit\":\"`$NUMBER`\",\"ops\":\"`$LIST`\"},\"strict\":false,\"transport\":\"none\"},\"ratelimit\":{\"options\":{\"active\":false,\"burst\":5,\"rate\":5},\"optspec\":{\"now\":\"`$FUNCTION`\",\"sleep\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"wrap\"},\"retry\":{\"options\":{\"active\":false,\"factor\":2,\"maxDelay\":2000,\"minDelay\":50,\"retries\":2,\"statuses\":[408,425,429,500,502,503,504]},\"optspec\":{\"jitter"
    "\":\"`$BOOLEAN`\",\"sleep\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"wrap\"},\"telemetry\":{\"options\":{\"active\":false},\"optspec\":{\"exporter\":\"`$FUNCTION`\",\"headers\":\"`$MAP`\",\"idgen\":\"`$FUNCTION`\",\"now\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"none\"},\"test\":{\"options\":{\"active\":false},\"optspec\":{\"entity\":\"`$MAP`\",\"net\":\"`$MAP`\"},\"strict\":false,\"transport\":\"base\"},\"timeout\":{\"options\":{\"active\":false,\"ms\":30000},\"optspec\":{\"clearTimer\":\"`$FUNCTION`\",\"setTimer\":\"`$FUNCTION`\"},\"strict\":false,\"transport\":\"wrap\"}},\"options\":{\"base\":\"https://secure-cert.shieldconex.com/api\",\"auth\":{\"prefix\":\"Basic\",\"basic\":true},\"headers\":{\"content-type\":\"application/json\"},\"entity\":{\"network_token_bundle\":{}}},\"entity\":{\"network_token_bundle\":{\"fields\":[{\"name\":\"card\",\"type\":\"`$OBJECT`\"},{\"name\":\"cardNumber\",\"type\":\"`$STRING`\"},{\"name\":\"expirationMonth\",\"short\":\"Two-digit month in which the payment card expires.\",\"type\":\"`$STRING`\"},{\"name\":\"expirationYear\",\"short\":\"Four-digit year in which the payment card expires.\",\"type\":\"`$STRING`\"},{\"name\":\"id\",\"type\":\"`$STRING`\"},{\"name\":\"issuer\",\"type\":\"`$OBJECT`\"},{\"name\":\"metadata\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkToken\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkTokenBundleId\",\"short\":\"Unique identifier for the Instrument Identifier token used in the transaction.\",\"type\":\"`$STRING`\"},{\"name\":\"networkTokenBundleState\",\"type\":\"`$STRING`\"},{\"name\":\"securityCode\",\"type\":\"`$STRING`\"}],\"id\":{\"field\":\"id\",\"name\":\"id\"},\"name\":\"network_token_bundle\",\"op\":{\"create\":{\"input\":\"data\",\"name\":\"create\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"POST\",\"orig\":\"/network-token-bu"
    "ndle\",\"segments\":[{\"lit\":\"network-token-bundle\"}],\"select\":{\"exist\":[\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"},\"parts\":[\"network-token-bundle\"]}]},\"load\":{\"input\":\"data\",\"name\":\"load\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"segments\":[{\"lit\":\"network-token-bundle\"},{\"var\":\"id\"}],\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"},\"parts\":[\"network-token-bundle\",\"{id}\"]},{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}/payment-credentials\",\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"segments\":[{\"lit\":\"network-token-bundle\"},{\"var\":\"id\"},{\"lit\":\"payment-credentials\"}],\"select\":{\"$action\":\"payment_credential\",\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"},\"parts\":[\"network-token-bundle\",\"{id}\",\"payment-credentials\"]}]},\"remove\":{\"input\":\"data\",\"name\":\"remove\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":tr"
    "ue,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"DELETE\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"segments\":[{\"lit\":\"network-token-bundle\"},{\"var\":\"id\"}],\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"},\"parts\":[\"network-token-bundle\",\"{id}\"]}]}},\"relations\":{\"ancestors\":[]}}}}";
}

inline Value makeConfig() { return vs::parse_json(config_json()); }

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client - this is
// the difference between parsing the embedded JSON once and once per client.
//
// A function-local static in an inline function is one object across every
// translation unit, and its initialisation is thread-safe by the standard.
// Value holds shared_ptr nodes, so copying the returned Value shares the
// structure rather than duplicating it.
//
// The result is SHARED: treat it as read-only. Callers that need to mutate
// should use makeConfig, which always parses a fresh copy.
inline const Value& sharedConfig() {
  static const Value shared = makeConfig();
  return shared;
}

inline FeaturePtr makeFeature(const std::string& name) {
  if (name == "audit") return std::make_shared<AuditFeature>();
  if (name == "clienttrack") return std::make_shared<ClienttrackFeature>();
  if (name == "debug") return std::make_shared<DebugFeature>();
  if (name == "idempotency") return std::make_shared<IdempotencyFeature>();
  if (name == "log") return std::make_shared<LogFeature>();
  if (name == "metrics") return std::make_shared<MetricsFeature>();
  if (name == "paging") return std::make_shared<PagingFeature>();
  if (name == "ratelimit") return std::make_shared<RatelimitFeature>();
  if (name == "retry") return std::make_shared<RetryFeature>();
  if (name == "telemetry") return std::make_shared<TelemetryFeature>();
  if (name == "test") return std::make_shared<TestFeature>();
  if (name == "timeout") return std::make_shared<TimeoutFeature>();
  return std::make_shared<BaseFeature>();
}

// The plugin definitions the model selected per feature (type-erased; see
// feature/<name>/kinds.cpp). Empty for a feature with none, and for a
// model with no plugin-bearing feature active.

inline std::vector<std::shared_ptr<void>> featurePlugins(const std::string& name) {
  (void)name;
  return {};
}

} // namespace sdk

#endif // SDK_CORE_CONFIG_HPP

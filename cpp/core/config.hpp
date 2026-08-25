// Generated API configuration (mirrors Config_java / core/config.go).

#ifndef SDK_CORE_CONFIG_HPP
#define SDK_CORE_CONFIG_HPP

#include <memory>
#include <string>

#include "../core/struct.hpp"
#include "../core/types.hpp"
#include "../feature/base.hpp"
#include "../feature/test.hpp"

namespace sdk {

inline const char* config_json() {
  return
    "{\"main\":{\"name\":\"BluefinNetworkToken\",\"slug\":\"bluefin-network-token\",\"version\":\"0.1.1\",\"target\":\"cpp\"},\"feature\":{\"test\":{\"options\":{\"active\":false},\"transport\":\"base\"}},\"options\":{\"base\":\"https://secure-cert.shieldconex.com/api\",\"auth\":{\"prefix\":\"Basic\"},\"headers\":{\"content-type\":\"application/json\"},\"entity\":{\"network_token_bundle\":{}}},\"entity\":{\"network_token_bundle\":{\"fields\":[{\"name\":\"card\",\"type\":\"`$OBJECT`\"},{\"name\":\"cardNumber\",\"type\":\"`$STRING`\"},{\"name\":\"expirationMonth\",\"short\":\"Two-digit month in which the payment card expires.\",\"type\":\"`$STRING`\"},{\"name\":\"expirationYear\",\"short\":\"Four-digit year in which the payment card expires.\",\"type\":\"`$STRING`\"},{\"name\":\"id\",\"type\":\"`$STRING`\"},{\"name\":\"issuer\",\"type\":\"`$OBJECT`\"},{\"name\":\"metadata\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkToken\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkTokenBundleId\",\"short\":\"Unique identifier for the Instrument Identifier token used in the transaction.\",\"type\":\"`$STRING`\"},{\"name\":\"networkTokenBundleState\",\"type\":\"`$STRING`\"},{\"name\":\"securityCode\",\"type\":\"`$STRING`\"}],\"name\":\"network_token_bundle\",\"op\":{\"create\":{\"input\":\"data\",\"name\":\"create\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"POST\",\"orig\":\"/network-token-bundle\",\"parts\":[\"network-token-bundle\"],\"select\":{\"exist\":[\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]},\"load\":{\"input\":\"data\",\"name\":\"load\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd"
    "\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"parts\":[\"network-token-bundle\",\"{id}\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}},{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}/payment-credentials\",\"parts\":[\"network-token-bundle\",\"{id}\",\"payment-credentials\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"$action\":\"payment_credential\",\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]},\"remove\":{\"input\":\"data\",\"name\":\"remove\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"DELETE\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"parts\":[\"network-token-bundle\",\"{id}\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]}},\"relations\":{\"ancestors\":[]}}}}";
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
  if (name == "test") return std::make_shared<TestFeature>();
  return std::make_shared<BaseFeature>();
}

} // namespace sdk

#endif // SDK_CORE_CONFIG_HPP

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
    "{\"main\":{\"name\":\"BluefinNetworkToken\"},\"feature\":{\"test\":{\"options\":{\"active\":false}}},\"options\":{\"base\":\"https://secure-cert.shieldconex.com/api\",\"auth\":{\"prefix\":\"Basic\"},\"headers\":{\"content-type\":\"application/json\"},\"entity\":{\"network_token_bundle\":{}}},\"entity\":{\"network_token_bundle\":{\"fields\":[{\"name\":\"card\",\"type\":\"`$OBJECT`\"},{\"name\":\"cardNumber\",\"type\":\"`$STRING`\"},{\"name\":\"expirationMonth\",\"type\":\"`$STRING`\"},{\"name\":\"expirationYear\",\"type\":\"`$STRING`\"},{\"name\":\"issuer\",\"type\":\"`$OBJECT`\"},{\"name\":\"metadata\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkToken\",\"type\":\"`$OBJECT`\"},{\"name\":\"networkTokenBundleId\",\"type\":\"`$STRING`\"},{\"name\":\"networkTokenBundleState\",\"type\":\"`$STRING`\"},{\"name\":\"securityCode\",\"type\":\"`$STRING`\"}],\"name\":\"network_token_bundle\",\"op\":{\"create\":{\"input\":\"data\",\"name\":\"create\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"POST\",\"orig\":\"/network-token-bundle\",\"parts\":[\"network-token-bundle\"],\"select\":{\"exist\":[\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]},\"load\":{\"input\":\"data\",\"name\":\"load\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"parts\":[\"network-token-bundle\",\"{id}\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}},{\"args\":{\"head"
    "er\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"GET\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}/payment-credentials\",\"parts\":[\"network-token-bundle\",\"{id}\",\"payment-credentials\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"$action\":\"payment_credential\",\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]},\"remove\":{\"input\":\"data\",\"name\":\"remove\",\"points\":[{\"args\":{\"header\":[{\"kind\":\"header\",\"name\":\"scx_client_reference\",\"orig\":\"scx_client_reference\",\"reqd\":true,\"type\":\"`$STRING`\"}],\"params\":[{\"kind\":\"param\",\"name\":\"id\",\"orig\":\"network_token_bundle_id\",\"reqd\":true,\"type\":\"`$STRING`\"}]},\"kind\":\"http\",\"method\":\"DELETE\",\"orig\":\"/network-token-bundle/{networkTokenBundleId}\",\"parts\":[\"network-token-bundle\",\"{id}\"],\"rename\":{\"param\":{\"networkTokenBundleId\":\"id\"}},\"select\":{\"exist\":[\"id\",\"scx_client_reference\"]},\"transform\":{\"req\":\"`reqdata`\",\"res\":\"`body`\"}}]}},\"relations\":{\"ancestors\":[]}}}}";
}

inline Value makeConfig() { return vs::parse_json(config_json()); }

inline FeaturePtr makeFeature(const std::string& name) {
  if (name == "test") return std::make_shared<TestFeature>();
  return std::make_shared<BaseFeature>();
}

} // namespace sdk

#endif // SDK_CORE_CONFIG_HPP

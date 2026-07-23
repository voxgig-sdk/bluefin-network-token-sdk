// BluefinNetworkToken SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/types.hpp); this class binds the API-specific entity
// accessors and the test-mode constructor.

#ifndef SDK_CORE_CLIENT_HPP
#define SDK_CORE_CLIENT_HPP

#include <memory>

#include "../core/types.hpp"
#include "../entity/entities.hpp"

namespace sdk {

class BluefinNetworkTokenSDK : public SdkClient {
public:
  explicit BluefinNetworkTokenSDK(Value options = Value::undef()) : SdkClient(options) {}


  // NetworkTokenBundle entity bound to this client.
  std::shared_ptr<NetworkTokenBundleEntity> network_token_bundle(Value entopts = Value::undef()) {
    return std::make_shared<NetworkTokenBundleEntity>(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  static std::shared_ptr<BluefinNetworkTokenSDK> testSDK() {
    return testSDK(Value::undef(), Value::undef());
  }

  static std::shared_ptr<BluefinNetworkTokenSDK> testSDK(Value testopts, Value sdkopts) {
    auto sdk = std::make_shared<BluefinNetworkTokenSDK>(SdkClient::testOptions(testopts, sdkopts));
    sdk->mode = "test";
    return sdk;
  }

  // Convenience no-arg constructor.
  static std::shared_ptr<BluefinNetworkTokenSDK> create() {
    return std::make_shared<BluefinNetworkTokenSDK>(Value::undef());
  }
};

using BluefinNetworkTokenSDKPtr = std::shared_ptr<BluefinNetworkTokenSDK>;

} // namespace sdk

#endif // SDK_CORE_CLIENT_HPP

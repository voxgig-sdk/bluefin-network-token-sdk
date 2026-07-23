package voxgig.bluefinnetworktokensdk.core;

import java.util.Map;

/**
 * BluefinNetworkToken SDK client. All transport and pipeline behaviour lives in
 * the SdkClient base (core/SdkClient.java); this class binds the
 * API-specific entity accessors and the test-mode constructor.
 */
public class BluefinNetworkTokenSDK extends SdkClient {

  public BluefinNetworkTokenSDK() {
    this(null);
  }

  public BluefinNetworkTokenSDK(Map<String, Object> options) {
    super(options);
  }


  /**
   * Returns a network_token_bundle entity bound to this client.
   * Idiomatic usage: client.networkTokenBundle(null).list(null, null) or
   * client.networkTokenBundle(null).load(Map.of("id", ...), null).
   */
  public SdkEntity networkTokenBundle(Map<String, Object> entopts) {
    return new voxgig.bluefinnetworktokensdk.entity.NetworkTokenBundleEntity(this, entopts);
  }


  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  public static BluefinNetworkTokenSDK testSDK() {
    return testSDK(null, null);
  }

  public static BluefinNetworkTokenSDK testSDK(
      Map<String, Object> testopts, Map<String, Object> sdkopts) {
    BluefinNetworkTokenSDK sdk = new BluefinNetworkTokenSDK(SdkClient.testOptions(testopts, sdkopts));
    sdk.mode = "test";
    return sdk;
  }
}

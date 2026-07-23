package voxgig.bluefinnetworktokensdk.core

import java.util.{Map => JMap}

// BluefinNetworkToken SDK client. All transport and pipeline behaviour lives in the
// SdkClient base (core/SdkClient.scala); this class binds the API-specific
// entity accessors and the test-mode constructor.
class BluefinNetworkTokenSDK(options: JMap[String, Object]) extends SdkClient(options) {

  def this() = this(null)


  /**
   * Returns a network_token_bundle entity bound to this client.
   * Idiomatic usage: client.networkTokenBundle(null).list(null, null) or
   * client.networkTokenBundle(null).load(java.util.Map.of("id", ...), null).
   */
  def networkTokenBundle(entopts: java.util.Map[String, Object]): SdkEntity =
    new voxgig.bluefinnetworktokensdk.entity.NetworkTokenBundleEntity(this, entopts)


}

object BluefinNetworkTokenSDK {

  // testSDK builds a client in test mode: the test feature is activated,
  // installing the in-memory mock transport (no network activity).
  def testSDK(): BluefinNetworkTokenSDK = testSDK(null, null)

  def testSDK(testopts: JMap[String, Object], sdkopts: JMap[String, Object]): BluefinNetworkTokenSDK = {
    val sdk = new BluefinNetworkTokenSDK(SdkClient.testOptions(testopts, sdkopts))
    sdk.mode = "test"
    sdk
  }
}

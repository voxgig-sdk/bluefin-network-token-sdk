package voxgig.bluefinnetworktokensdk.core

/**
 * BluefinNetworkToken SDK client. All transport and pipeline behaviour lives in the
 * SdkClient base (core/SdkClient.kt); this class binds the API-specific
 * entity accessors and the test-mode constructor.
 */
class BluefinNetworkTokenSDK(options: MutableMap<String, Any?>?) : SdkClient(options) {

  constructor() : this(null)


  /**
   * Returns a network_token_bundle entity bound to this client.
   * Idiomatic usage: client.networkTokenBundle(null).list(null, null) or
   * client.networkTokenBundle(null).load(mutableMapOf("id" to ...), null).
   */
  fun networkTokenBundle(entopts: MutableMap<String, Any?>?): SdkEntity {
    return voxgig.bluefinnetworktokensdk.entity.NetworkTokenBundleEntity(this, entopts)
  }


  companion object {
    // testSDK builds a client in test mode: the test feature is activated,
    // installing the in-memory mock transport (no network activity).
    fun testSDK(): BluefinNetworkTokenSDK = testSDK(null, null)

    fun testSDK(
      testopts: MutableMap<String, Any?>?,
      sdkopts: MutableMap<String, Any?>?,
    ): BluefinNetworkTokenSDK {
      val sdk = BluefinNetworkTokenSDK(testOptions(testopts, sdkopts))
      sdk.mode = "test"
      return sdk
    }
  }
}

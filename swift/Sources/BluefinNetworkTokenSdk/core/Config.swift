// BluefinNetworkToken SDK - generated model configuration and feature
// factory. GENERATED from the API model - do not edit by hand.

import Foundation

public enum SdkConfig {
  public static func makeConfig() -> VMap {
    let json = #"""
{"main":{"name":"BluefinNetworkToken","slug":"bluefin-network-token","version":"0.1.1","target":"swift"},"feature":{"test":{"options":{"active":false},"transport":"base"}},"options":{"base":"https://secure-cert.shieldconex.com/api","auth":{"prefix":"Basic"},"headers":{"content-type":"application/json"},"entity":{"network_token_bundle":{}}},"entity":{"network_token_bundle":{"fields":[{"name":"card","type":"`$OBJECT`"},{"name":"cardNumber","type":"`$STRING`"},{"name":"expirationMonth","short":"Two-digit month in which the payment card expires.","type":"`$STRING`"},{"name":"expirationYear","short":"Four-digit year in which the payment card expires.","type":"`$STRING`"},{"name":"issuer","type":"`$OBJECT`"},{"name":"metadata","type":"`$OBJECT`"},{"name":"networkToken","type":"`$OBJECT`"},{"name":"networkTokenBundleId","short":"Unique identifier for the Instrument Identifier token used in the transaction.","type":"`$STRING`"},{"name":"networkTokenBundleState","type":"`$STRING`"},{"name":"securityCode","type":"`$STRING`"}],"name":"network_token_bundle","op":{"create":{"input":"data","name":"create","points":[{"args":{"header":[{"kind":"header","name":"scx_client_reference","orig":"scx_client_reference","reqd":true,"type":"`$STRING`"}]},"kind":"http","method":"POST","orig":"/network-token-bundle","parts":["network-token-bundle"],"select":{"exist":["scx_client_reference"]},"transform":{"req":"`reqdata`","res":"`body`"}}]},"load":{"input":"data","name":"load","points":[{"args":{"header":[{"kind":"header","name":"scx_client_reference","orig":"scx_client_reference","reqd":true,"type":"`$STRING`"}],"params":[{"kind":"param","name":"id","orig":"network_token_bundle_id","reqd":true,"type":"`$STRING`"}]},"kind":"http","method":"GET","orig":"/network-token-bundle/{networkTokenBundleId}","parts":["network-token-bundle","{id}"],"rename":{"param":{"networkTokenBundleId":"id"}},"select":{"exist":["id","scx_client_reference"]},"transform":{"req":"`reqdata`","res":"`body`"}},{"args":{"header":[{"kind":"header","name":"scx_client_reference","orig":"scx_client_reference","reqd":true,"type":"`$STRING`"}],"params":[{"kind":"param","name":"id","orig":"network_token_bundle_id","reqd":true,"type":"`$STRING`"}]},"kind":"http","method":"GET","orig":"/network-token-bundle/{networkTokenBundleId}/payment-credentials","parts":["network-token-bundle","{id}","payment-credentials"],"rename":{"param":{"networkTokenBundleId":"id"}},"select":{"$action":"payment_credential","exist":["id","scx_client_reference"]},"transform":{"req":"`reqdata`","res":"`body`"}}]},"remove":{"input":"data","name":"remove","points":[{"args":{"header":[{"kind":"header","name":"scx_client_reference","orig":"scx_client_reference","reqd":true,"type":"`$STRING`"}],"params":[{"kind":"param","name":"id","orig":"network_token_bundle_id","reqd":true,"type":"`$STRING`"}]},"kind":"http","method":"DELETE","orig":"/network-token-bundle/{networkTokenBundleId}","parts":["network-token-bundle","{id}"],"rename":{"param":{"networkTokenBundleId":"id"}},"select":{"exist":["id","scx_client_reference"]},"transform":{"req":"`reqdata`","res":"`body`"}}]}},"relations":{"ancestors":[]}}}}
"""#
    return (try? JSON.parse(json))?.asMap ?? VMap()
  }

  // SHARED CONFIG (sdkgen rung L2).
  //
  // The SDK reads the config on every request and never writes to it, so one
  // instance is shared by every client rather than rebuilt per client - the
  // difference between parsing the embedded JSON once and once per client.
  //
  // A static let in an enum is lazy and initialised exactly once, thread-safe
  // via swift_once.
  //
  // The result is SHARED: treat it as read-only. Callers that need to mutate
  // should use makeConfig, which always parses a fresh copy.
  private static let sharedConfigVal: VMap = makeConfig()

  public static func sharedConfig() -> VMap {
    return sharedConfigVal
  }

  public static func makeFeature(_ name: String) -> BaseFeature {
    switch name {
    case "test": return TestFeature()
    default: return BaseFeature()
    }
  }
}

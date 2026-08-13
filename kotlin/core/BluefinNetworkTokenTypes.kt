package voxgig.bluefinnetworktokensdk.core

// Typed reference models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These types are documentation/DX reference shapes ONLY. The SDK ops take and
// return the loose object model (MutableMap<String, Any?> / Any?) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a nullable type, so
// an optional (req:false) key needs no distinct rendering.

@Suppress("unused")
object BluefinNetworkTokenTypes {

  data class NetworkTokenBundle(val card: Map<String, Any?>?, val cardNumber: String?, val expirationMonth: String?, val expirationYear: String?, val issuer: Map<String, Any?>?, val metadata: Map<String, Any?>?, val networkToken: Map<String, Any?>?, val networkTokenBundleId: String?, val networkTokenBundleState: String?, val securityCode: String?)

  data class NetworkTokenBundleLoadMatch(val id: String?)

  data class NetworkTokenBundleCreateData(val card: Map<String, Any?>?, val cardNumber: String?, val expirationMonth: String?, val expirationYear: String?, val issuer: Map<String, Any?>?, val metadata: Map<String, Any?>?, val networkToken: Map<String, Any?>?, val networkTokenBundleId: String?, val networkTokenBundleState: String?, val securityCode: String?)

  data class NetworkTokenBundleRemoveMatch(val id: String?)

}

package voxgig.bluefinnetworktokensdk.core

// Typed reference models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These case classes are documentation/DX reference shapes ONLY. The SDK ops
// take and return the loose object model (java.util.Map[String, Object] /
// Object) at runtime, so these types are not wired into the op signatures —
// use them to describe a payload before converting it to a map. Every
// component is a boxed (nullable) type, so an optional (req:false) key needs
// no distinct rendering.

object BluefinNetworkTokenTypes {

  final case class NetworkTokenBundle(card: java.util.Map[String, Object], cardNumber: String, expirationMonth: String, expirationYear: String, id: String, issuer: java.util.Map[String, Object], metadata: java.util.Map[String, Object], networkToken: java.util.Map[String, Object], networkTokenBundleId: String, networkTokenBundleState: String, securityCode: String)

  final case class NetworkTokenBundleLoadMatch(id: String)

  final case class NetworkTokenBundleCreateData(card: java.util.Map[String, Object], cardNumber: String, expirationMonth: String, expirationYear: String, id: String, issuer: java.util.Map[String, Object], metadata: java.util.Map[String, Object], networkToken: java.util.Map[String, Object], networkTokenBundleId: String, networkTokenBundleState: String, securityCode: String)

  final case class NetworkTokenBundleRemoveMatch(id: String)

}

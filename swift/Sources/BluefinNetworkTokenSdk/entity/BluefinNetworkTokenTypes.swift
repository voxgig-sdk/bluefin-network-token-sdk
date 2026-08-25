// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.

import Foundation

/// NetworkTokenBundle is the typed data model for the network_token_bundle entity.
public struct NetworkTokenBundle {
  public var card: VMap?
  public var cardNumber: String?
  public var expirationMonth: String?
  public var expirationYear: String?
  public var id: String?
  public var issuer: VMap?
  public var metadata: VMap?
  public var networkToken: VMap?
  public var networkTokenBundleId: String?
  public var networkTokenBundleState: String?
  public var securityCode: String?
}

/// NetworkTokenBundleLoadMatch is the typed request payload for NetworkTokenBundle.load.
public struct NetworkTokenBundleLoadMatch {
  public var id: String
}

/// NetworkTokenBundleCreateData is the typed request payload for NetworkTokenBundle.create.
public struct NetworkTokenBundleCreateData {
  public var card: VMap?
  public var cardNumber: String?
  public var expirationMonth: String?
  public var expirationYear: String?
  public var id: String?
  public var issuer: VMap?
  public var metadata: VMap?
  public var networkToken: VMap?
  public var networkTokenBundleId: String?
  public var networkTokenBundleState: String?
  public var securityCode: String?
}

/// NetworkTokenBundleRemoveMatch is the typed request payload for NetworkTokenBundle.remove.
public struct NetworkTokenBundleRemoveMatch {
  public var id: String
}


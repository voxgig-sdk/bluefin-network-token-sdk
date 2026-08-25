package voxgig.bluefinnetworktokensdk.core;

// Typed reference models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels (source of truth: @voxgig/apidef VALID_CANON). Do
// not edit by hand.
//
// These records are documentation/DX reference shapes ONLY. The SDK ops take
// and return the loose object model (Map<String, Object> / Object) at runtime,
// so these types are not wired into the op signatures — use them to describe a
// payload before converting it to a map. Every component is a boxed (nullable)
// type, so an optional (req:false) key needs no distinct rendering.

import java.util.List;
import java.util.Map;

public final class BluefinNetworkTokenTypes {

  private BluefinNetworkTokenTypes() {}

  public record NetworkTokenBundle(Map<String, Object> card, String cardNumber, String expirationMonth, String expirationYear, String id, Map<String, Object> issuer, Map<String, Object> metadata, Map<String, Object> networkToken, String networkTokenBundleId, String networkTokenBundleState, String securityCode) {}

  public record NetworkTokenBundleLoadMatch(String id) {}

  public record NetworkTokenBundleCreateData(Map<String, Object> card, String cardNumber, String expirationMonth, String expirationYear, String id, Map<String, Object> issuer, Map<String, Object> metadata, Map<String, Object> networkToken, String networkTokenBundleId, String networkTokenBundleState, String securityCode) {}

  public record NetworkTokenBundleRemoveMatch(String id) {}

}

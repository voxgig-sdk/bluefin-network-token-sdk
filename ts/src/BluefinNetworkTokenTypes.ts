// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface NetworkTokenBundle {
  card?: Record<string, any>
  card_number?: string
  expiration_month?: string
  expiration_year?: string
  issuer?: Record<string, any>
  metadata?: Record<string, any>
  network_token?: Record<string, any>
  network_token_bundle_id?: string
  network_token_bundle_state?: string
  security_code?: string
}

export interface NetworkTokenBundleLoadMatch {
  id: string
}

export interface NetworkTokenBundleCreateData {
  card?: Record<string, any>
  card_number?: string
  expiration_month?: string
  expiration_year?: string
  issuer?: Record<string, any>
  metadata?: Record<string, any>
  network_token?: Record<string, any>
  network_token_bundle_id?: string
  network_token_bundle_state?: string
  security_code?: string
}

export interface NetworkTokenBundleRemoveMatch {
  id: string
}


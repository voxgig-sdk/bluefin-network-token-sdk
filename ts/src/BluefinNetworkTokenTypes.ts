// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.

export interface NetworkTokenBundle {
  card?: Record<string, any>
  cardNumber?: string
  expirationMonth?: string
  expirationYear?: string
  issuer?: Record<string, any>
  metadata?: Record<string, any>
  networkToken?: Record<string, any>
  networkTokenBundleId?: string
  networkTokenBundleState?: string
  securityCode?: string
}

export interface NetworkTokenBundleLoadMatch {
  id: string

  // Selects a custom action instead of the plain load:
  //   'payment_credential'
  // The remaining keys are that action's own payload.
  $action?: string
  [action: string]: any
}

export interface NetworkTokenBundleCreateData {
  card?: Record<string, any>
  cardNumber?: string
  expirationMonth?: string
  expirationYear?: string
  issuer?: Record<string, any>
  metadata?: Record<string, any>
  networkToken?: Record<string, any>
  networkTokenBundleId?: string
  networkTokenBundleState?: string
  securityCode?: string
}

export interface NetworkTokenBundleRemoveMatch {
  id: string
}


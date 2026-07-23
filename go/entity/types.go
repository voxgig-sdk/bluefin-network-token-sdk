// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types come from the
// canonical type sentinels via @voxgig/sdkgen canonToType (source of truth:
// @voxgig/apidef VALID_CANON). Do not edit by hand.
package entity

import "encoding/json"

// NetworkTokenBundle is the typed data model for the network_token_bundle entity.
type NetworkTokenBundle struct {
	Card *map[string]any `json:"card,omitempty"`
	CardNumber *string `json:"card_number,omitempty"`
	ExpirationMonth *string `json:"expiration_month,omitempty"`
	ExpirationYear *string `json:"expiration_year,omitempty"`
	Issuer *map[string]any `json:"issuer,omitempty"`
	Metadata *map[string]any `json:"metadata,omitempty"`
	NetworkToken *map[string]any `json:"network_token,omitempty"`
	NetworkTokenBundleId *string `json:"network_token_bundle_id,omitempty"`
	NetworkTokenBundleState *string `json:"network_token_bundle_state,omitempty"`
	SecurityCode *string `json:"security_code,omitempty"`
}

// NetworkTokenBundleLoadMatch is the typed request payload for NetworkTokenBundle.LoadTyped.
type NetworkTokenBundleLoadMatch struct {
	Id string `json:"id"`
}

// NetworkTokenBundleCreateData is the typed request payload for NetworkTokenBundle.CreateTyped.
type NetworkTokenBundleCreateData struct {
	Card *map[string]any `json:"card,omitempty"`
	CardNumber *string `json:"card_number,omitempty"`
	ExpirationMonth *string `json:"expiration_month,omitempty"`
	ExpirationYear *string `json:"expiration_year,omitempty"`
	Issuer *map[string]any `json:"issuer,omitempty"`
	Metadata *map[string]any `json:"metadata,omitempty"`
	NetworkToken *map[string]any `json:"network_token,omitempty"`
	NetworkTokenBundleId *string `json:"network_token_bundle_id,omitempty"`
	NetworkTokenBundleState *string `json:"network_token_bundle_state,omitempty"`
	SecurityCode *string `json:"security_code,omitempty"`
}

// NetworkTokenBundleRemoveMatch is the typed request payload for NetworkTokenBundle.RemoveTyped.
type NetworkTokenBundleRemoveMatch struct {
	Id string `json:"id"`
}

// asMap turns a typed request/data struct into the map[string]any the
// runtime op pipeline consumes, honouring the json tags above.
func asMap(v any) map[string]any {
	out := map[string]any{}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedFrom decodes a runtime value (a map[string]any produced by the op
// pipeline) into a typed model T via a JSON round-trip. On any error it
// returns the zero value of T; the op's own (value, error) tuple carries the
// real error.
func typedFrom[T any](v any) T {
	var out T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

// typedSliceFrom decodes a runtime list value ([]any of maps) into a typed
// slice []T via a JSON round-trip, for list ops.
func typedSliceFrom[T any](v any) []T {
	var out []T
	if v == nil {
		return out
	}
	b, err := json.Marshal(v)
	if err != nil {
		return out
	}
	_ = json.Unmarshal(b, &out)
	return out
}

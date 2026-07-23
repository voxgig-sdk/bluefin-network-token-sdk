// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return
// `voxgig_value*`), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support. This header is standalone
// and is not #included by any generated .c.

#ifndef BLUEFINNETWORKTOKEN_ENTITY_TYPES_H
#define BLUEFINNETWORKTOKEN_ENTITY_TYPES_H

#include "sdk.h"

// NetworkTokenBundle is the typed data model for the network_token_bundle entity.
typedef struct {
  voxgig_value*card;  // optional
  char*card_number;  // optional
  char*expiration_month;  // optional
  char*expiration_year;  // optional
  voxgig_value*issuer;  // optional
  voxgig_value*metadata;  // optional
  voxgig_value*network_token;  // optional
  char*network_token_bundle_id;  // optional
  char*network_token_bundle_state;  // optional
  char*security_code;  // optional
} NetworkTokenBundle;

// NetworkTokenBundleLoadMatch is the typed request payload for NetworkTokenBundle.load.
typedef struct {
  char*id;
} NetworkTokenBundleLoadMatch;

// NetworkTokenBundleCreateData is the typed request payload for NetworkTokenBundle.create.
typedef struct {
  voxgig_value*card;  // optional
  char*card_number;  // optional
  char*expiration_month;  // optional
  char*expiration_year;  // optional
  voxgig_value*issuer;  // optional
  voxgig_value*metadata;  // optional
  voxgig_value*network_token;  // optional
  char*network_token_bundle_id;  // optional
  char*network_token_bundle_state;  // optional
  char*security_code;  // optional
} NetworkTokenBundleCreateData;

// NetworkTokenBundleRemoveMatch is the typed request payload for NetworkTokenBundle.remove.
typedef struct {
  char*id;
} NetworkTokenBundleRemoveMatch;

#endif // BLUEFINNETWORKTOKEN_ENTITY_TYPES_H

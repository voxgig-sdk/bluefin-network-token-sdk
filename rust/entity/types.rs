// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields[] and per-op
// params (op.<name>.points[].args.params[]). Field/param types are mapped
// from the canonical type sentinels. Do not edit by hand.
//
// These are DOCUMENTARY: the SDK runtime is dynamic (ops take/return the
// `Value` enum), so nothing consumes these structs yet — they mirror the
// entity/op shapes for reference and IDE support.
#![allow(dead_code, non_snake_case, unused_imports)]

use crate::utility::voxgigstruct::Value;

/// NetworkTokenBundle is the typed data model for the network_token_bundle entity.
#[derive(Debug, Clone)]
pub struct NetworkTokenBundle {
    pub card: Option<std::collections::HashMap<String, Value>>,
    pub card_number: Option<String>,
    pub expiration_month: Option<String>,
    pub expiration_year: Option<String>,
    pub issuer: Option<std::collections::HashMap<String, Value>>,
    pub metadata: Option<std::collections::HashMap<String, Value>>,
    pub network_token: Option<std::collections::HashMap<String, Value>>,
    pub network_token_bundle_id: Option<String>,
    pub network_token_bundle_state: Option<String>,
    pub security_code: Option<String>,
}

/// NetworkTokenBundleLoadMatch is the typed request payload for NetworkTokenBundle.load.
#[derive(Debug, Clone)]
pub struct NetworkTokenBundleLoadMatch {
    pub id: String,
}

/// NetworkTokenBundleCreateData is the typed request payload for NetworkTokenBundle.create.
#[derive(Debug, Clone)]
pub struct NetworkTokenBundleCreateData {
    pub card: Option<std::collections::HashMap<String, Value>>,
    pub card_number: Option<String>,
    pub expiration_month: Option<String>,
    pub expiration_year: Option<String>,
    pub issuer: Option<std::collections::HashMap<String, Value>>,
    pub metadata: Option<std::collections::HashMap<String, Value>>,
    pub network_token: Option<std::collections::HashMap<String, Value>>,
    pub network_token_bundle_id: Option<String>,
    pub network_token_bundle_state: Option<String>,
    pub security_code: Option<String>,
}

/// NetworkTokenBundleRemoveMatch is the typed request payload for NetworkTokenBundle.remove.
#[derive(Debug, Clone)]
pub struct NetworkTokenBundleRemoveMatch {
    pub id: String,
}


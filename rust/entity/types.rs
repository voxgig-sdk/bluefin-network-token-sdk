// Typed models for the BluefinNetworkToken SDK.
//
// GENERATED from the API model: main.kit.entity.<e>.fields{} and per-op
// params (op.<name>.points[].g.params[]). Field/param types are mapped
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
    pub cardnumber: Option<String>,
    pub expirationmonth: Option<String>,
    pub expirationyear: Option<String>,
    pub id: Option<String>,
    pub issuer: Option<std::collections::HashMap<String, Value>>,
    pub metadata: Option<std::collections::HashMap<String, Value>>,
    pub networktoken: Option<std::collections::HashMap<String, Value>>,
    pub networktokenbundleid: Option<String>,
    pub networktokenbundlestate: Option<String>,
    pub securitycode: Option<String>,
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
    pub cardnumber: Option<String>,
    pub expirationmonth: Option<String>,
    pub expirationyear: Option<String>,
    pub id: Option<String>,
    pub issuer: Option<std::collections::HashMap<String, Value>>,
    pub metadata: Option<std::collections::HashMap<String, Value>>,
    pub networktoken: Option<std::collections::HashMap<String, Value>>,
    pub networktokenbundleid: Option<String>,
    pub networktokenbundlestate: Option<String>,
    pub securitycode: Option<String>,
}

/// NetworkTokenBundleRemoveMatch is the typed request payload for NetworkTokenBundle.remove.
#[derive(Debug, Clone)]
pub struct NetworkTokenBundleRemoveMatch {
    pub id: String,
}


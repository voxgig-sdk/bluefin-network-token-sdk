// Generated API configuration (mirrors go core/config.go).

use std::cell::RefCell;
use std::rc::Rc;

use crate::core::types::FeatureRef;
use crate::utility::voxgigstruct::Value;

pub fn make_config() -> Value {
    Value::map_of([
        ("main".to_string(), Value::map_of([
            ("name".to_string(), Value::str("BluefinNetworkToken")),
        ])),
        ("feature".to_string(), Value::map_of([
            ("test".to_string(), Value::map_of([
                ("options".to_string(), Value::map_of([
                    ("active".to_string(), Value::Bool(false)),
                ])),
            ])),
        ])),
        ("options".to_string(), Value::map_of([
            ("base".to_string(), Value::str("https://secure-cert.shieldconex.com/api")),
            ("headers".to_string(), Value::map_of([
                ("content-type".to_string(), Value::str("application/json")),
            ])),
            ("entity".to_string(), Value::map_of([
                ("network_token_bundle".to_string(), Value::empty_map()),
            ])),
            ("auth".to_string(), Value::map_of([
                ("prefix".to_string(), Value::str("Basic")),
            ])),
        ])),
        ("entity".to_string(), Value::map_of([
            ("network_token_bundle".to_string(), Value::map_of([
                ("fields".to_string(), Value::list(vec![
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("card")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(0f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("cardNumber")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(1f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expirationMonth")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(2f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("expirationYear")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(3f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("issuer")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(4f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("metadata")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(5f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("networkToken")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$OBJECT`")),
                        ("index$".to_string(), Value::Num(6f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("networkTokenBundleId")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(7f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("networkTokenBundleState")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(8f64)),
                    ]),
                    Value::map_of([
                        ("active".to_string(), Value::Bool(true)),
                        ("name".to_string(), Value::str("securityCode")),
                        ("req".to_string(), Value::Bool(false)),
                        ("type".to_string(), Value::str("`$STRING`")),
                        ("index$".to_string(), Value::Num(9f64)),
                    ]),
                ])),
                ("name".to_string(), Value::str("network_token_bundle")),
                ("op".to_string(), Value::map_of([
                    ("create".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("create")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("scx_client_reference")),
                                            ("orig".to_string(), Value::str("scx_client_reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("POST")),
                                ("orig".to_string(), Value::str("/network-token-bundle")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("network-token-bundle"),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("scx_client_reference"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("create")),
                    ])),
                    ("load".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("load")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("scx_client_reference")),
                                            ("orig".to_string(), Value::str("scx_client_reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("network_token_bundle_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/network-token-bundle/{networkTokenBundleId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("network-token-bundle"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("networkTokenBundleId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("scx_client_reference"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("scx_client_reference")),
                                            ("orig".to_string(), Value::str("scx_client_reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("network_token_bundle_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("GET")),
                                ("orig".to_string(), Value::str("/network-token-bundle/{networkTokenBundleId}/payment-credentials")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("network-token-bundle"),
                                    Value::str("{id}"),
                                    Value::str("payment-credentials"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("networkTokenBundleId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("$action".to_string(), Value::str("payment_credential")),
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("scx_client_reference"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(1f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("load")),
                    ])),
                    ("remove".to_string(), Value::map_of([
                        ("input".to_string(), Value::str("data")),
                        ("name".to_string(), Value::str("remove")),
                        ("points".to_string(), Value::list(vec![
                            Value::map_of([
                                ("active".to_string(), Value::Bool(true)),
                                ("args".to_string(), Value::map_of([
                                    ("header".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("header")),
                                            ("name".to_string(), Value::str("scx_client_reference")),
                                            ("orig".to_string(), Value::str("scx_client_reference")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                        ]),
                                    ])),
                                    ("params".to_string(), Value::list(vec![
                                        Value::map_of([
                                            ("active".to_string(), Value::Bool(true)),
                                            ("kind".to_string(), Value::str("param")),
                                            ("name".to_string(), Value::str("id")),
                                            ("orig".to_string(), Value::str("network_token_bundle_id")),
                                            ("reqd".to_string(), Value::Bool(true)),
                                            ("type".to_string(), Value::str("`$STRING`")),
                                            ("index$".to_string(), Value::Num(0f64)),
                                        ]),
                                    ])),
                                ])),
                                ("kind".to_string(), Value::str("http")),
                                ("method".to_string(), Value::str("DELETE")),
                                ("orig".to_string(), Value::str("/network-token-bundle/{networkTokenBundleId}")),
                                ("parts".to_string(), Value::list(vec![
                                    Value::str("network-token-bundle"),
                                    Value::str("{id}"),
                                ])),
                                ("rename".to_string(), Value::map_of([
                                    ("param".to_string(), Value::map_of([
                                        ("networkTokenBundleId".to_string(), Value::str("id")),
                                    ])),
                                ])),
                                ("select".to_string(), Value::map_of([
                                    ("exist".to_string(), Value::list(vec![
                                        Value::str("id"),
                                        Value::str("scx_client_reference"),
                                    ])),
                                ])),
                                ("transform".to_string(), Value::map_of([
                                    ("req".to_string(), Value::str("`reqdata`")),
                                    ("res".to_string(), Value::str("`body`")),
                                ])),
                                ("index$".to_string(), Value::Num(0f64)),
                            ]),
                        ])),
                        ("key$".to_string(), Value::str("remove")),
                    ])),
                ])),
                ("relations".to_string(), Value::map_of([
                    ("ancestors".to_string(), Value::empty_list()),
                ])),
            ])),
        ])),
    ])
}

pub fn make_feature(name: &str) -> FeatureRef {
    match name {
        "test" => Rc::new(RefCell::new(crate::feature::test::TestFeature::new())),
        _ => Rc::new(RefCell::new(crate::feature::base::BaseFeature::new())),
    }
}

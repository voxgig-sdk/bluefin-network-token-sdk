(* Generated API configuration (mirrors go core/config.go).
 *
 * make_config () — the embedded API model as a voxgig struct value.
 * make_feature name — the N-feature-safe factory the client uses. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Sdk_features

let make_config () : value =
  (jo [
    ("main", (jo [
      ("name", (Str "BluefinNetworkToken")) ]));
    ("feature", (jo [
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ])) ])) ]));
    ("options", (jo [
      ("base", (Str "https://secure-cert.shieldconex.com/api"));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("network_token_bundle", (empty_map ())) ]));
      ("auth", (jo [
        ("prefix", (Str "Basic")) ])) ]));
    ("entity", (jo [
      ("network_token_bundle", (jo [
        ("fields", (ja [
          (jo [
            ("name", (Str "card"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "cardNumber"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "expirationMonth"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "expirationYear"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "issuer"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "metadata"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "networkToken"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "networkTokenBundleId"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "networkTokenBundleState"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "securityCode"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("name", (Str "network_token_bundle"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/network-token-bundle"));
                ("parts", (ja [
                  (Str "network-token-bundle") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}"));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]);
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}/payment-credentials"));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}");
                  (Str "payment-credentials") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("$action", (Str "payment_credential"));
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}"));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()

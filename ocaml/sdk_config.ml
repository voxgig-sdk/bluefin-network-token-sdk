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
            ("active", (Bool true));
            ("name", (Str "card"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (0.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "card_number"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (1.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expiration_month"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (2.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "expiration_year"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (3.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "issuer"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (4.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "metadata"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (5.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "network_token"));
            ("req", (Bool false));
            ("type", (Str "`$OBJECT`"));
            ("index$", (Num (6.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "network_token_bundle_id"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (7.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "network_token_bundle_state"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (8.))) ]);
          (jo [
            ("active", (Bool true));
            ("name", (Str "security_code"));
            ("req", (Bool false));
            ("type", (Str "`$STRING`"));
            ("index$", (Num (9.))) ]) ]));
        ("name", (Str "network_token_bundle"));
        ("op", (jo [
          ("create", (jo [
            ("input", (Str "data"));
            ("name", (Str "create"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
                ("method", (Str "POST"));
                ("orig", (Str "/network-token-bundle"));
                ("parts", (ja [
                  (Str "network-token-bundle") ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "create")) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]);
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (1.))) ]) ]));
            ("key$", (Str "load")) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("active", (Bool true));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "header"));
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`")) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("active", (Bool true));
                      ("kind", (Str "param"));
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("reqd", (Bool true));
                      ("type", (Str "`$STRING`"));
                      ("index$", (Num (0.))) ]) ])) ]));
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
                  ("res", (Str "`body`")) ]));
                ("index$", (Num (0.))) ]) ]));
            ("key$", (Str "remove")) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

let make_feature (name : string) : feature =
  match name with
  | "test" -> test_feature ()
  | _ -> base_feature ()

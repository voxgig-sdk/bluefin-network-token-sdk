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
      ("name", (Str "BluefinNetworkToken"));
      ("slug", (Str "bluefin-network-token"));
      ("version", (Str "0.1.1"));
      ("target", (Str "ocaml")) ]));
    ("feature", (jo [
      ("audit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("actor", (Str "anonymous"));
          ("max", (Num (1000.))) ]));
        ("transport", (Str "none")) ]));
      ("clienttrack", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("clientVersion", (Str "0.0.1")) ]));
        ("transport", (Str "none")) ]));
      ("idempotency", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("header", (Str "Idempotency-Key"));
          ("methods", (ja [
            (Str "POST");
            (Str "PUT");
            (Str "PATCH");
            (Str "DELETE") ]));
          ("ops", (ja [
            (Str "create");
            (Str "update");
            (Str "remove") ])) ]));
        ("transport", (Str "none")) ]));
      ("log", (jo [
        ("options", (jo [
          ("active", (Bool true)) ]));
        ("transport", (Str "none")) ]));
      ("metrics", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("transport", (Str "none")) ]));
      ("paging", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("afterVar", (Str "after"));
          ("cursorParam", (Str "cursor"));
          ("firstVar", (Str "first"));
          ("limitParam", (Str "limit"));
          ("pageParam", (Str "page"));
          ("startPage", (Num (1.))) ]));
        ("transport", (Str "none")) ]));
      ("ratelimit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("burst", (Num (5.)));
          ("rate", (Num (5.))) ]));
        ("transport", (Str "wrap")) ]));
      ("retry", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("factor", (Num (2.)));
          ("maxDelay", (Num (2000.)));
          ("minDelay", (Num (50.)));
          ("retries", (Num (2.)));
          ("statuses", (ja [
            (Num (408.));
            (Num (425.));
            (Num (429.));
            (Num (500.));
            (Num (502.));
            (Num (503.));
            (Num (504.)) ])) ]));
        ("transport", (Str "wrap")) ]));
      ("telemetry", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("transport", (Str "none")) ]));
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("transport", (Str "base")) ]));
      ("timeout", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("ms", (Num (30000.))) ]));
        ("transport", (Str "wrap")) ])) ]));
    ("options", (jo [
      ("base", (Str "https://secure-cert.shieldconex.com/api"));
      ("auth", (jo [
        ("prefix", (Str "Basic"));
        ("basic", (Bool true)) ]));
      ("headers", (jo [
        ("content-type", (Str "application/json")) ]));
      ("entity", (jo [
        ("network_token_bundle", (empty_map ())) ])) ]));
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
            ("short", (Str "Two-digit month in which the payment card expires."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "expirationYear"));
            ("short", (Str "Four-digit year in which the payment card expires."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "id"));
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
            ("short", (Str "Unique identifier for the Instrument Identifier token used in the transaction."));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "networkTokenBundleState"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "securityCode"));
            ("type", (Str "`$STRING`")) ]) ]));
        ("id", (jo [
          ("field", (Str "id"));
          ("name", (Str "id")) ]));
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
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "network-token-bundle") ])) ]) ])) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ])) ]);
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
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]);
                  (jo [
                    ("lit", (Str "payment-credentials")) ]) ]));
                ("select", (jo [
                  ("$action", (Str "payment_credential"));
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}");
                  (Str "payment-credentials") ])) ]) ])) ]));
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
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

(* The plugin definitions the model selected, per feature: none - no
 * plugin-bearing feature is active in this SDK. *)
let feature_plugins (_name : string) = []

let make_feature (name : string) : feature =
  match name with
  | "audit" -> audit_feature ()
  | "clienttrack" -> clienttrack_feature ()
  | "idempotency" -> idempotency_feature ()
  | "log" -> log_feature ()
  | "metrics" -> metrics_feature ()
  | "paging" -> paging_feature ()
  | "ratelimit" -> ratelimit_feature ()
  | "retry" -> retry_feature ()
  | "telemetry" -> telemetry_feature ()
  | "test" -> test_feature ()
  | "timeout" -> timeout_feature ()
  | _ -> base_feature ()

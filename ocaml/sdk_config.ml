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
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sink", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("clienttrack", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("clientVersion", (Str "0.0.1")) ]));
        ("optspec", (jo [
          ("clientName", (Str "`$STRING`"));
          ("clientVersion", (Str "`$STRING`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("sessionId", (Str "`$STRING`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("debug", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("max", (Num (100.)));
          ("redact", (ja [
            (Str "authorization");
            (Str "cookie");
            (Str "set-cookie");
            (Str "api-key");
            (Str "apikey");
            (Str "x-api-key");
            (Str "idempotency-key") ])) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("onEntry", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
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
        ("optspec", (jo [
          ("keygen", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("log", (jo [
        ("options", (jo [
          ("active", (Bool true)) ]));
        ("optspec", (jo [
          ("level", (Str "`$STRING`"));
          ("logger", (Str "`$ANY`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("metrics", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
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
        ("optspec", (jo [
          ("limit", (Str "`$NUMBER`"));
          ("ops", (Str "`$LIST`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("ratelimit", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("burst", (Num (5.)));
          ("rate", (Num (5.))) ]));
        ("optspec", (jo [
          ("now", (Str "`$FUNCTION`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
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
        ("optspec", (jo [
          ("jitter", (Str "`$BOOLEAN`"));
          ("sleep", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "wrap")) ]));
      ("telemetry", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("exporter", (Str "`$FUNCTION`"));
          ("headers", (Str "`$MAP`"));
          ("idgen", (Str "`$FUNCTION`"));
          ("now", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "none")) ]));
      ("test", (jo [
        ("options", (jo [
          ("active", (Bool false)) ]));
        ("optspec", (jo [
          ("entity", (Str "`$MAP`"));
          ("net", (Str "`$MAP`")) ]));
        ("strict", (Bool false));
        ("transport", (Str "base")) ]));
      ("timeout", (jo [
        ("options", (jo [
          ("active", (Bool false));
          ("ms", (Num (30000.))) ]));
        ("optspec", (jo [
          ("clearTimer", (Str "`$FUNCTION`"));
          ("setTimer", (Str "`$FUNCTION`")) ]));
        ("strict", (Bool false));
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
            ("title", (Str "Card"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "cardNumber"));
            ("title", (Str "Card Number"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "expirationMonth"));
            ("title", (Str "Expiration Month"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Two-digit month in which the payment card expires.")) ]);
          (jo [
            ("name", (Str "expirationYear"));
            ("title", (Str "Expiration Year"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Four-digit year in which the payment card expires.")) ]);
          (jo [
            ("name", (Str "id"));
            ("title", (Str "Id"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "issuer"));
            ("title", (Str "Issuer"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "metadata"));
            ("title", (Str "Metadata"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "networkToken"));
            ("title", (Str "Network Token"));
            ("type", (Str "`$OBJECT`")) ]);
          (jo [
            ("name", (Str "networkTokenBundleId"));
            ("title", (Str "Network Token Bundle Id"));
            ("type", (Str "`$STRING`"));
            ("short", (Str "Unique identifier for the Instrument Identifier token used in the transaction.")) ]);
          (jo [
            ("name", (Str "networkTokenBundleState"));
            ("title", (Str "Network Token Bundle State"));
            ("type", (Str "`$STRING`")) ]);
          (jo [
            ("name", (Str "securityCode"));
            ("title", (Str "Security Code"));
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
                ("kind", (Str "http"));
                ("method", (Str "POST"));
                ("orig", (Str "/network-token-bundle"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]) ]));
                ("parts", (ja [
                  (Str "network-token-bundle") ]));
                ("rename", (empty_map ()));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "scx_client_reference") ])) ])) ]) ])) ]));
          ("load", (jo [
            ("input", (Str "data"));
            ("name", (Str "load"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ])) ]);
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "GET"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}/payment-credentials"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]);
                  (jo [
                    ("lit", (Str "payment-credentials")) ]) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}");
                  (Str "payment-credentials") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("$action", (Str "payment_credential"));
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ])) ]) ])) ]));
          ("remove", (jo [
            ("input", (Str "data"));
            ("name", (Str "remove"));
            ("points", (ja [
              (jo [
                ("kind", (Str "http"));
                ("method", (Str "DELETE"));
                ("orig", (Str "/network-token-bundle/{networkTokenBundleId}"));
                ("segments", (ja [
                  (jo [
                    ("lit", (Str "network-token-bundle")) ]);
                  (jo [
                    ("var", (Str "id")) ]) ]));
                ("parts", (ja [
                  (Str "network-token-bundle");
                  (Str "{id}") ]));
                ("rename", (jo [
                  ("param", (jo [
                    ("networkTokenBundleId", (Str "id")) ])) ]));
                ("transform", (jo [
                  ("req", (Str "`reqdata`"));
                  ("res", (Str "`body`")) ]));
                ("args", (jo [
                  ("header", (ja [
                    (jo [
                      ("name", (Str "scx_client_reference"));
                      ("orig", (Str "scx_client_reference"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "header"));
                      ("reqd", (Bool true)) ]) ]));
                  ("params", (ja [
                    (jo [
                      ("name", (Str "id"));
                      ("orig", (Str "network_token_bundle_id"));
                      ("type", (Str "`$STRING`"));
                      ("kind", (Str "param"));
                      ("reqd", (Bool true)) ]) ])) ]));
                ("select", (jo [
                  ("exist", (ja [
                    (Str "id");
                    (Str "scx_client_reference") ])) ])) ]) ])) ])) ]));
        ("relations", (jo [
          ("ancestors", (empty_list ())) ])) ])) ])) ])

(* The plugin definitions the model selected, per feature: none - no
 * plugin-bearing feature is active in this SDK. *)
let feature_plugins (_name : string) = []

let make_feature (name : string) : feature =
  match name with
  | "audit" -> audit_feature ()
  | "clienttrack" -> clienttrack_feature ()
  | "debug" -> debug_feature ()
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

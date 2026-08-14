-- Generated API configuration (make_config) and the feature factory.

module SdkConfig (makeConfig, makeFeature) where

import VoxgigStruct (Value)
import SdkHelpers (CV (..), buildCV)
import SdkTypes (Feature)
import qualified SdkFeatures as F

makeConfig :: IO Value
makeConfig = buildCV (CVMap [("entity", (CVMap [("network_token_bundle", (CVMap [("fields", (CVList [(CVMap [("name", (CVStr "card")), ("type", (CVStr "`$OBJECT`"))]), (CVMap [("name", (CVStr "cardNumber")), ("type", (CVStr "`$STRING`"))]), (CVMap [("name", (CVStr "expirationMonth")), ("type", (CVStr "`$STRING`"))]), (CVMap [("name", (CVStr "expirationYear")), ("type", (CVStr "`$STRING`"))]), (CVMap [("name", (CVStr "issuer")), ("type", (CVStr "`$OBJECT`"))]), (CVMap [("name", (CVStr "metadata")), ("type", (CVStr "`$OBJECT`"))]), (CVMap [("name", (CVStr "networkToken")), ("type", (CVStr "`$OBJECT`"))]), (CVMap [("name", (CVStr "networkTokenBundleId")), ("type", (CVStr "`$STRING`"))]), (CVMap [("name", (CVStr "networkTokenBundleState")), ("type", (CVStr "`$STRING`"))]), (CVMap [("name", (CVStr "securityCode")), ("type", (CVStr "`$STRING`"))])])), ("name", (CVStr "network_token_bundle")), ("op", (CVMap [("create", (CVMap [("input", (CVStr "data")), ("name", (CVStr "create")), ("points", (CVList [(CVMap [("args", (CVMap [("header", (CVList [(CVMap [("kind", (CVStr "header")), ("name", (CVStr "scx_client_reference")), ("orig", (CVStr "scx_client_reference")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])]))])), ("kind", (CVStr "http")), ("method", (CVStr "POST")), ("orig", (CVStr "/network-token-bundle")), ("parts", (CVList [(CVStr "network-token-bundle")])), ("select", (CVMap [("exist", (CVList [(CVStr "scx_client_reference")]))])), ("transform", (CVMap [("req", (CVStr "`reqdata`")), ("res", (CVStr "`body`"))]))])]))])), ("load", (CVMap [("input", (CVStr "data")), ("name", (CVStr "load")), ("points", (CVList [(CVMap [("args", (CVMap [("header", (CVList [(CVMap [("kind", (CVStr "header")), ("name", (CVStr "scx_client_reference")), ("orig", (CVStr "scx_client_reference")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])])), ("params", (CVList [(CVMap [("kind", (CVStr "param")), ("name", (CVStr "id")), ("orig", (CVStr "network_token_bundle_id")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])]))])), ("kind", (CVStr "http")), ("method", (CVStr "GET")), ("orig", (CVStr "/network-token-bundle/{networkTokenBundleId}")), ("parts", (CVList [(CVStr "network-token-bundle"), (CVStr "{id}")])), ("rename", (CVMap [("param", (CVMap [("networkTokenBundleId", (CVStr "id"))]))])), ("select", (CVMap [("exist", (CVList [(CVStr "id"), (CVStr "scx_client_reference")]))])), ("transform", (CVMap [("req", (CVStr "`reqdata`")), ("res", (CVStr "`body`"))]))]), (CVMap [("args", (CVMap [("header", (CVList [(CVMap [("kind", (CVStr "header")), ("name", (CVStr "scx_client_reference")), ("orig", (CVStr "scx_client_reference")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])])), ("params", (CVList [(CVMap [("kind", (CVStr "param")), ("name", (CVStr "id")), ("orig", (CVStr "network_token_bundle_id")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])]))])), ("kind", (CVStr "http")), ("method", (CVStr "GET")), ("orig", (CVStr "/network-token-bundle/{networkTokenBundleId}/payment-credentials")), ("parts", (CVList [(CVStr "network-token-bundle"), (CVStr "{id}"), (CVStr "payment-credentials")])), ("rename", (CVMap [("param", (CVMap [("networkTokenBundleId", (CVStr "id"))]))])), ("select", (CVMap [("$action", (CVStr "payment_credential")), ("exist", (CVList [(CVStr "id"), (CVStr "scx_client_reference")]))])), ("transform", (CVMap [("req", (CVStr "`reqdata`")), ("res", (CVStr "`body`"))]))])]))])), ("remove", (CVMap [("input", (CVStr "data")), ("name", (CVStr "remove")), ("points", (CVList [(CVMap [("args", (CVMap [("header", (CVList [(CVMap [("kind", (CVStr "header")), ("name", (CVStr "scx_client_reference")), ("orig", (CVStr "scx_client_reference")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])])), ("params", (CVList [(CVMap [("kind", (CVStr "param")), ("name", (CVStr "id")), ("orig", (CVStr "network_token_bundle_id")), ("reqd", (CVBool True)), ("type", (CVStr "`$STRING`"))])]))])), ("kind", (CVStr "http")), ("method", (CVStr "DELETE")), ("orig", (CVStr "/network-token-bundle/{networkTokenBundleId}")), ("parts", (CVList [(CVStr "network-token-bundle"), (CVStr "{id}")])), ("rename", (CVMap [("param", (CVMap [("networkTokenBundleId", (CVStr "id"))]))])), ("select", (CVMap [("exist", (CVList [(CVStr "id"), (CVStr "scx_client_reference")]))])), ("transform", (CVMap [("req", (CVStr "`reqdata`")), ("res", (CVStr "`body`"))]))])]))]))])), ("relations", (CVMap [("ancestors", (CVList []))]))]))])), ("feature", (CVMap [("test", (CVMap [("options", (CVMap [("active", (CVBool False))]))]))])), ("main", (CVMap [("name", (CVStr "BluefinNetworkToken"))])), ("options", (CVMap [("auth", (CVMap [("prefix", (CVStr "Basic"))])), ("base", (CVStr "https://secure-cert.shieldconex.com/api")), ("entity", (CVMap [("network_token_bundle", (CVMap []))])), ("headers", (CVMap [("content-type", (CVStr "application/json"))]))]))])

makeFeature :: String -> IO Feature
makeFeature name = case name of
  "log" -> F.logFeature
  "test" -> F.testFeature
  "retry" -> F.retryFeature
  "timeout" -> F.timeoutFeature
  "ratelimit" -> F.ratelimitFeature
  "cache" -> F.cacheFeature
  "idempotency" -> F.idempotencyFeature
  "paging" -> F.pagingFeature
  "streaming" -> F.streamingFeature
  "proxy" -> F.proxyFeature
  "telemetry" -> F.telemetryFeature
  "metrics" -> F.metricsFeature
  "debug" -> F.debugFeature
  "audit" -> F.auditFeature
  "clienttrack" -> F.clienttrackFeature
  "rbac" -> F.rbacFeature
  "netsim" -> F.netsimFeature
  _ -> F.baseFeature

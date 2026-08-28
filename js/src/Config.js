
const { BaseFeature } = require('./feature/base/BaseFeature')
const { AuditFeature } = require('./feature/audit/AuditFeature')
const { ClienttrackFeature } = require('./feature/clienttrack/ClienttrackFeature')
const { IdempotencyFeature } = require('./feature/idempotency/IdempotencyFeature')
const { LogFeature } = require('./feature/log/LogFeature')
const { MetricsFeature } = require('./feature/metrics/MetricsFeature')
const { PagingFeature } = require('./feature/paging/PagingFeature')
const { RatelimitFeature } = require('./feature/ratelimit/RatelimitFeature')
const { RetryFeature } = require('./feature/retry/RetryFeature')
const { TelemetryFeature } = require('./feature/telemetry/TelemetryFeature')
const { TestFeature } = require('./feature/test/TestFeature')
const { TimeoutFeature } = require('./feature/timeout/TimeoutFeature')



const FEATURE_CLASS = {
   audit: AuditFeature,
 clienttrack: ClienttrackFeature,
 idempotency: IdempotencyFeature,
 log: LogFeature,
 metrics: MetricsFeature,
 paging: PagingFeature,
 ratelimit: RatelimitFeature,
 retry: RetryFeature,
 telemetry: TelemetryFeature,
 test: TestFeature,
 timeout: TimeoutFeature,

}


class Config {

  makeFeature(fn) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  hasFeature(fn) {
    return null != FEATURE_CLASS[fn]
  }


  main = {
    name: 'BluefinNetworkToken',
        slug: "bluefin-network-token",
    version: "0.1.1",
    target: "js",

  }


  feature = {
     audit:     {
      "options": {
        "active": false,
        "actor": "anonymous",
        "max": 1000
      },
      "transport": "none"
    },
 clienttrack:     {
      "options": {
        "active": false,
        "clientVersion": "0.0.1"
      },
      "transport": "none"
    },
 idempotency:     {
      "options": {
        "active": false,
        "header": "Idempotency-Key",
        "methods": [
          "POST",
          "PUT",
          "PATCH",
          "DELETE"
        ],
        "ops": [
          "create",
          "update",
          "remove"
        ]
      },
      "transport": "none"
    },
 log:     {
      "options": {
        "active": true
      },
      "transport": "none"
    },
 metrics:     {
      "options": {
        "active": false
      },
      "transport": "none"
    },
 paging:     {
      "options": {
        "active": false,
        "afterVar": "after",
        "cursorParam": "cursor",
        "firstVar": "first",
        "limitParam": "limit",
        "pageParam": "page",
        "startPage": 1
      },
      "transport": "none"
    },
 ratelimit:     {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "transport": "wrap"
    },
 retry:     {
      "options": {
        "active": false,
        "factor": 2,
        "maxDelay": 2000,
        "minDelay": 50,
        "retries": 2,
        "statuses": [
          408,
          425,
          429,
          500,
          502,
          503,
          504
        ]
      },
      "transport": "wrap"
    },
 telemetry:     {
      "options": {
        "active": false
      },
      "transport": "none"
    },
 test:     {
      "options": {
        "active": false
      },
      "transport": "base"
    },
 timeout:     {
      "options": {
        "active": false,
        "ms": 30000
      },
      "transport": "wrap"
    },

  }


  options = {
    base: "https://secure-cert.shieldconex.com/api",

    auth: {
      prefix: 'Basic',
    },

    headers: {
      "content-type": "application/json"
    },

    entity: {
      
      network_token_bundle: {
      },

    }
  }


  entity = {
    "network_token_bundle": {
      "fields": [
        {
          "name": "card",
          "type": "`$OBJECT`"
        },
        {
          "name": "cardNumber",
          "type": "`$STRING`"
        },
        {
          "name": "expirationMonth",
          "short": "Two-digit month in which the payment card expires.",
          "type": "`$STRING`"
        },
        {
          "name": "expirationYear",
          "short": "Four-digit year in which the payment card expires.",
          "type": "`$STRING`"
        },
        {
          "name": "id",
          "type": "`$STRING`"
        },
        {
          "name": "issuer",
          "type": "`$OBJECT`"
        },
        {
          "name": "metadata",
          "type": "`$OBJECT`"
        },
        {
          "name": "networkToken",
          "type": "`$OBJECT`"
        },
        {
          "name": "networkTokenBundleId",
          "short": "Unique identifier for the Instrument Identifier token used in the transaction.",
          "type": "`$STRING`"
        },
        {
          "name": "networkTokenBundleState",
          "type": "`$STRING`"
        },
        {
          "name": "securityCode",
          "type": "`$STRING`"
        }
      ],
      "name": "network_token_bundle",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "args": {
                "header": [
                  {
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "POST",
              "orig": "/network-token-bundle",
              "parts": [
                "network-token-bundle"
              ],
              "select": {
                "exist": [
                  "scx_client_reference"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "args": {
                "header": [
                  {
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/network-token-bundle/{networkTokenBundleId}",
              "parts": [
                "network-token-bundle",
                "{id}"
              ],
              "rename": {
                "param": {
                  "networkTokenBundleId": "id"
                }
              },
              "select": {
                "exist": [
                  "id",
                  "scx_client_reference"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            },
            {
              "args": {
                "header": [
                  {
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "GET",
              "orig": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
              "parts": [
                "network-token-bundle",
                "{id}",
                "payment-credentials"
              ],
              "rename": {
                "param": {
                  "networkTokenBundleId": "id"
                }
              },
              "select": {
                "$action": "payment_credential",
                "exist": [
                  "id",
                  "scx_client_reference"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "args": {
                "header": [
                  {
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
              "kind": "http",
              "method": "DELETE",
              "orig": "/network-token-bundle/{networkTokenBundleId}",
              "parts": [
                "network-token-bundle",
                "{id}"
              ],
              "rename": {
                "param": {
                  "networkTokenBundleId": "id"
                }
              },
              "select": {
                "exist": [
                  "id",
                  "scx_client_reference"
                ]
              },
              "transform": {
                "req": "`reqdata`",
                "res": "`body`"
              }
            }
          ]
        }
      },
      "relations": {
        "ancestors": []
      }
    }
  }
}


const config = new Config()

module.exports = {
  config
}


# BluefinNetworkToken SDK configuration

use strict;
use warnings;

use File::Basename ();
use Cwd ();

my $__dir;
BEGIN { $__dir = File::Basename::dirname(Cwd::abs_path(__FILE__)) }
require(Cwd::abs_path("$__dir/lib/Voxgig/Struct.pm"));

package BluefinNetworkTokenConfig;

# GENERATED from the API model - do not edit by hand. Parsed fresh on
# each call so callers can safely mutate their copy.
my $CONFIG_JSON = <<'END_CONFIG_JSON';
{
  "main": {
    "name": "BluefinNetworkToken",
    "slug": "bluefin-network-token",
    "version": "0.1.1",
    "target": "perl"
  },
  "feature": {
    "audit": {
      "options": {
        "active": false,
        "actor": "anonymous",
        "max": 1000
      },
      "transport": "none"
    },
    "clienttrack": {
      "options": {
        "active": false,
        "clientVersion": "0.0.1"
      },
      "transport": "none"
    },
    "idempotency": {
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
    "log": {
      "options": {
        "active": true
      },
      "transport": "none"
    },
    "metrics": {
      "options": {
        "active": false
      },
      "transport": "none"
    },
    "paging": {
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
    "ratelimit": {
      "options": {
        "active": false,
        "burst": 5,
        "rate": 5
      },
      "transport": "wrap"
    },
    "retry": {
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
    "telemetry": {
      "options": {
        "active": false
      },
      "transport": "none"
    },
    "test": {
      "options": {
        "active": false
      },
      "transport": "base"
    },
    "timeout": {
      "options": {
        "active": false,
        "ms": 30000
      },
      "transport": "wrap"
    }
  },
  "options": {
    "base": "https://secure-cert.shieldconex.com/api",
    "auth": {
      "prefix": "Basic",
      "basic": true
    },
    "headers": {
      "content-type": "application/json"
    },
    "entity": {
      "network_token_bundle": {}
    }
  },
  "entity": {
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
END_CONFIG_JSON

sub make_config {
  return Voxgig::Struct::parse_json($CONFIG_JSON);
}

# SHARED CONFIG (sdkgen rung L2).
#
# The SDK reads the config on every request and never writes to it, so one
# instance is shared by every client rather than rebuilt per client - the
# difference between parsing the embedded JSON once and once per client.
#
# The returned structure is SHARED: treat it as read-only. Callers that need to
# mutate should use make_config, which always parses a fresh copy.
my $SHARED_CONFIG;

sub shared_config {
  $SHARED_CONFIG = make_config() unless defined $SHARED_CONFIG;
  return $SHARED_CONFIG;
}

sub make_feature {
  my ($name) = @_;
  require(Cwd::abs_path("$__dir/features.pm"));
  return BluefinNetworkTokenFeatures::make_feature($name);
}

1;

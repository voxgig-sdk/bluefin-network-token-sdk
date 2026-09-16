# BluefinNetworkToken SDK configuration


# The sekreto plugin DEFINITIONS the model selected per feature, imported
# above by name from the modules the catalogue's active `plugin.def`
# entries declare. Handed to each feature (secrets builds its Sekreto
# with them): a provider kind not listed here is unknown to that SDK.
FEATURE_PLUGINS = {
}


_shared_config = None


def shared_config():
    """Return the process-wide config, built once on first use.

    The SDK reads the config on every request and never writes to it, so one
    instance is shared by every client rather than rebuilt per client.

    The returned dict is shared: treat it as read-only. Callers that need to
    mutate should use make_config, which always returns a fresh copy.
    """
    global _shared_config
    if _shared_config is None:
        _shared_config = make_config()
    return _shared_config


def make_config():
    """Build a fresh, fully materialised config dict.

    Every call rebuilds the whole structure, so prefer shared_config unless
    you need a private copy you intend to mutate.
    """
    return {
        "main": {
            "name": "BluefinNetworkToken",
            "slug": "bluefin-network-token",
            "version": "0.1.1",
            "target": "py",
        },
        "feature": {
            "audit": {
        "options": {
          "active": False,
          "actor": "anonymous",
          "max": 1000,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sink": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "clienttrack": {
        "options": {
          "active": False,
          "clientVersion": "0.0.1",
        },
        "optspec": {
          "clientName": "`$STRING`",
          "clientVersion": "`$STRING`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "sessionId": "`$STRING`",
        },
        "strict": False,
        "transport": "none",
      },
            "debug": {
        "options": {
          "active": False,
          "max": 100,
          "redact": [
            "authorization",
            "cookie",
            "set-cookie",
            "api-key",
            "apikey",
            "x-api-key",
            "idempotency-key",
          ],
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "onEntry": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "idempotency": {
        "options": {
          "active": False,
          "header": "Idempotency-Key",
          "methods": [
            "POST",
            "PUT",
            "PATCH",
            "DELETE",
          ],
          "ops": [
            "create",
            "update",
            "remove",
          ],
        },
        "optspec": {
          "keygen": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "log": {
        "options": {
          "active": True,
        },
        "optspec": {
          "level": "`$STRING`",
          "logger": "`$ANY`",
        },
        "strict": False,
        "transport": "none",
      },
            "metrics": {
        "options": {
          "active": False,
        },
        "optspec": {
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "paging": {
        "options": {
          "active": False,
          "afterVar": "after",
          "cursorParam": "cursor",
          "firstVar": "first",
          "limitParam": "limit",
          "pageParam": "page",
          "startPage": 1,
        },
        "optspec": {
          "limit": "`$NUMBER`",
          "ops": "`$LIST`",
        },
        "strict": False,
        "transport": "none",
      },
            "ratelimit": {
        "options": {
          "active": False,
          "burst": 5,
          "rate": 5,
        },
        "optspec": {
          "now": "`$FUNCTION`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "retry": {
        "options": {
          "active": False,
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
            504,
          ],
        },
        "optspec": {
          "jitter": "`$BOOLEAN`",
          "sleep": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
            "telemetry": {
        "options": {
          "active": False,
        },
        "optspec": {
          "exporter": "`$FUNCTION`",
          "headers": "`$MAP`",
          "idgen": "`$FUNCTION`",
          "now": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "none",
      },
            "test": {
        "options": {
          "active": False,
        },
        "optspec": {
          "entity": "`$MAP`",
          "net": "`$MAP`",
        },
        "strict": False,
        "transport": "base",
      },
            "timeout": {
        "options": {
          "active": False,
          "ms": 30000,
        },
        "optspec": {
          "clearTimer": "`$FUNCTION`",
          "setTimer": "`$FUNCTION`",
        },
        "strict": False,
        "transport": "wrap",
      },
        },
        "options": {
            "base": "https://secure-cert.shieldconex.com/api",
            "auth": {
                "prefix": "Basic",
            },
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "network_token_bundle": {},
            },
        },
        "entity": {
      "network_token_bundle": {
        "fields": [
          {
            "name": "card",
            "type": "`$OBJECT`",
          },
          {
            "name": "cardNumber",
            "type": "`$STRING`",
          },
          {
            "name": "expirationMonth",
            "short": "Two-digit month in which the payment card expires.",
            "type": "`$STRING`",
          },
          {
            "name": "expirationYear",
            "short": "Four-digit year in which the payment card expires.",
            "type": "`$STRING`",
          },
          {
            "name": "id",
            "type": "`$STRING`",
          },
          {
            "name": "issuer",
            "type": "`$OBJECT`",
          },
          {
            "name": "metadata",
            "type": "`$OBJECT`",
          },
          {
            "name": "networkToken",
            "type": "`$OBJECT`",
          },
          {
            "name": "networkTokenBundleId",
            "short": "Unique identifier for the Instrument Identifier token used in the transaction.",
            "type": "`$STRING`",
          },
          {
            "name": "networkTokenBundleState",
            "type": "`$STRING`",
          },
          {
            "name": "securityCode",
            "type": "`$STRING`",
          },
        ],
        "id": {
          "field": "id",
          "name": "id",
        },
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
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "POST",
                "orig": "/network-token-bundle",
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                ],
                "select": {
                  "exist": [
                    "scx_client_reference",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "network-token-bundle",
                ],
              },
            ],
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
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                  {
                    "var": "id",
                  },
                ],
                "select": {
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
              },
              {
                "args": {
                  "header": [
                    {
                      "kind": "header",
                      "name": "scx_client_reference",
                      "orig": "scx_client_reference",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                  {
                    "var": "id",
                  },
                  {
                    "lit": "payment-credentials",
                  },
                ],
                "select": {
                  "$action": "payment_credential",
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "network-token-bundle",
                  "{id}",
                  "payment-credentials",
                ],
              },
            ],
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
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
                "method": "DELETE",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                  {
                    "var": "id",
                  },
                ],
                "select": {
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
              },
            ],
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }

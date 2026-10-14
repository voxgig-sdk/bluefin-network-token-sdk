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
          "now": "`$FUNCTION`",
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
                "basic": True,
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
            "title": "Card",
            "type": "`$OBJECT`",
          },
          {
            "name": "cardNumber",
            "title": "Card Number",
            "type": "`$STRING`",
          },
          {
            "name": "expirationMonth",
            "title": "Expiration Month",
            "type": "`$STRING`",
            "short": "Two-digit month in which the payment card expires.",
          },
          {
            "name": "expirationYear",
            "title": "Expiration Year",
            "type": "`$STRING`",
            "short": "Four-digit year in which the payment card expires.",
          },
          {
            "name": "id",
            "title": "Id",
            "type": "`$STRING`",
          },
          {
            "name": "issuer",
            "title": "Issuer",
            "type": "`$OBJECT`",
          },
          {
            "name": "metadata",
            "title": "Metadata",
            "type": "`$OBJECT`",
          },
          {
            "name": "networkToken",
            "title": "Network Token",
            "type": "`$OBJECT`",
          },
          {
            "name": "networkTokenBundleId",
            "title": "Network Token Bundle Id",
            "type": "`$STRING`",
            "short": "Unique identifier for the Instrument Identifier token used in the transaction.",
          },
          {
            "name": "networkTokenBundleState",
            "title": "Network Token Bundle State",
            "type": "`$STRING`",
          },
          {
            "name": "securityCode",
            "title": "Security Code",
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
                "kind": "http",
                "method": "POST",
                "orig": "/network-token-bundle",
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                ],
                "parts": [
                  "network-token-bundle",
                ],
                "rename": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "header": [
                    {
                      "name": "scx_client_reference",
                      "orig": "scx-client-reference",
                      "type": "`$STRING`",
                      "kind": "header",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "scx_client_reference",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "kind": "http",
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "header": [
                    {
                      "name": "scx_client_reference",
                      "orig": "scx-client-reference",
                      "type": "`$STRING`",
                      "kind": "header",
                      "reqd": True,
                    },
                  ],
                  "params": [
                    {
                      "name": "id",
                      "orig": "networkTokenBundleId",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
              {
                "kind": "http",
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
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
                "parts": [
                  "network-token-bundle",
                  "{id}",
                  "payment-credentials",
                ],
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "header": [
                    {
                      "name": "scx_client_reference",
                      "orig": "scx-client-reference",
                      "type": "`$STRING`",
                      "kind": "header",
                      "reqd": True,
                    },
                  ],
                  "params": [
                    {
                      "name": "id",
                      "orig": "networkTokenBundleId",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "$action": "payment_credential",
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
              },
            ],
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "kind": "http",
                "method": "DELETE",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "segments": [
                  {
                    "lit": "network-token-bundle",
                  },
                  {
                    "var": "id",
                  },
                ],
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "args": {
                  "header": [
                    {
                      "name": "scx_client_reference",
                      "orig": "scx-client-reference",
                      "type": "`$STRING`",
                      "kind": "header",
                      "reqd": True,
                    },
                  ],
                  "params": [
                    {
                      "name": "id",
                      "orig": "networkTokenBundleId",
                      "type": "`$STRING`",
                      "kind": "param",
                      "reqd": True,
                    },
                  ],
                },
                "select": {
                  "exist": [
                    "id",
                    "scx_client_reference",
                  ],
                },
                "response": {
                  "kind": "json",
                  "media": "application/json",
                },
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

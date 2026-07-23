# BluefinNetworkToken SDK configuration


def make_config():
    return {
        "main": {
            "name": "BluefinNetworkToken",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
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
            "active": True,
            "name": "card",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "card_number",
            "req": False,
            "type": "`$STRING`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "expiration_month",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "expiration_year",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "issuer",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "metadata",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "network_token",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "network_token_bundle_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "network_token_bundle_state",
            "req": False,
            "type": "`$STRING`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "security_code",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
        ],
        "name": "network_token_bundle",
        "op": {
          "create": {
            "input": "data",
            "name": "create",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "scx_client_reference",
                      "orig": "scx_client_reference",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "method": "POST",
                "orig": "/network-token-bundle",
                "parts": [
                  "network-token-bundle",
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
                "index$": 0,
              },
            ],
            "key$": "create",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "scx_client_reference",
                      "orig": "scx_client_reference",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
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
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "scx_client_reference",
                      "orig": "scx_client_reference",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "method": "GET",
                "orig": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
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
                "index$": 1,
              },
            ],
            "key$": "load",
          },
          "remove": {
            "input": "data",
            "name": "remove",
            "points": [
              {
                "active": True,
                "args": {
                  "header": [
                    {
                      "active": True,
                      "kind": "header",
                      "name": "scx_client_reference",
                      "orig": "scx_client_reference",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                  "params": [
                    {
                      "active": True,
                      "kind": "param",
                      "name": "id",
                      "orig": "network_token_bundle_id",
                      "reqd": True,
                      "type": "`$STRING`",
                      "index$": 0,
                    },
                  ],
                },
                "method": "DELETE",
                "orig": "/network-token-bundle/{networkTokenBundleId}",
                "parts": [
                  "network-token-bundle",
                  "{id}",
                ],
                "rename": {
                  "param": {
                    "networkTokenBundleId": "id",
                  },
                },
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
                "index$": 0,
              },
            ],
            "key$": "remove",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }

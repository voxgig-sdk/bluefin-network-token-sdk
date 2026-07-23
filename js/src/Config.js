
const { BaseFeature } = require('./feature/base/BaseFeature')
const { TestFeature } = require('./feature/test/TestFeature')



const FEATURE_CLASS = {
   test: TestFeature,

}


class Config {

  makeFeature(fn) {
    const fc = FEATURE_CLASS[fn]
    const fi = new fc()
    // TODO: errors etc
    return fi
  }


  main = {
    name: 'ProjectName',
  }


  feature = {
     test:     {
      "options": {
        "active": false
      }
    },

  }


  options = {
    base: 'https://secure-cert.shieldconex.com/api',

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
          "active": true,
          "name": "card",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 0
        },
        {
          "active": true,
          "name": "card_number",
          "req": false,
          "type": "`$STRING`",
          "index$": 1
        },
        {
          "active": true,
          "name": "expiration_month",
          "req": false,
          "type": "`$STRING`",
          "index$": 2
        },
        {
          "active": true,
          "name": "expiration_year",
          "req": false,
          "type": "`$STRING`",
          "index$": 3
        },
        {
          "active": true,
          "name": "issuer",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 4
        },
        {
          "active": true,
          "name": "metadata",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 5
        },
        {
          "active": true,
          "name": "network_token",
          "req": false,
          "type": "`$OBJECT`",
          "index$": 6
        },
        {
          "active": true,
          "name": "network_token_bundle_id",
          "req": false,
          "type": "`$STRING`",
          "index$": 7
        },
        {
          "active": true,
          "name": "network_token_bundle_state",
          "req": false,
          "type": "`$STRING`",
          "index$": 8
        },
        {
          "active": true,
          "name": "security_code",
          "req": false,
          "type": "`$STRING`",
          "index$": 9
        }
      ],
      "name": "network_token_bundle",
      "op": {
        "create": {
          "input": "data",
          "name": "create",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
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
              },
              "index$": 0
            }
          ],
          "key$": "create"
        },
        "load": {
          "input": "data",
          "name": "load",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
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
              },
              "index$": 0
            },
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ]
              },
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
              },
              "index$": 1
            }
          ],
          "key$": "load"
        },
        "remove": {
          "input": "data",
          "name": "remove",
          "points": [
            {
              "active": true,
              "args": {
                "header": [
                  {
                    "active": true,
                    "kind": "header",
                    "name": "scx_client_reference",
                    "orig": "scx_client_reference",
                    "reqd": true,
                    "type": "`$STRING`"
                  }
                ],
                "params": [
                  {
                    "active": true,
                    "kind": "param",
                    "name": "id",
                    "orig": "network_token_bundle_id",
                    "reqd": true,
                    "type": "`$STRING`",
                    "index$": 0
                  }
                ]
              },
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
              },
              "index$": 0
            }
          ],
          "key$": "remove"
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


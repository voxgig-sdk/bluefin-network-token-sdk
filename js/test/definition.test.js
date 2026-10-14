const { describe, test } = require('node:test')
const { SDK } = require('..')
const { runDefinitionPoint } = require('./definition-runner')
const { isControlSkipped } = require('./utility')


// Generated from the API definition, not from the model this SDK was built
// from: the route, the declared query parameters, the credential the security
// scheme names, and the definition's own response example.
const PLAN = [
  {
    "entity": "network_token_bundle",
    "accessor": "NetworkTokenBundle",
    "op": "create",
    "method": "POST",
    "path": "/network-token-bundle",
    "args": [],
    "select": {},
    "headers": [
      {
        "name": "scx_client_reference",
        "wire": "scx-client-reference",
        "value": "h1"
      }
    ],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "networkTokenBundleId": "x",
      "networkTokenBundleState": "x",
      "networkToken": {
        "networkTokenId": "x",
        "networkTokenState": "x",
        "networkTokenReason": "x",
        "tokenizedNumber": "x",
        "expirationMonth": "x",
        "expirationYear": "x",
        "type": "x",
        "card": {
          "suffix": "x",
          "expirationMonth": "x",
          "expirationYear": "x"
        }
      },
      "issuer": {
        "paymentAccountReference": "x"
      },
      "metadata": {
        "creator": "x"
      }
    },
    "idField": "id"
  },
  {
    "entity": "network_token_bundle",
    "accessor": "NetworkTokenBundle",
    "op": "load",
    "method": "GET",
    "path": "/network-token-bundle/{networkTokenBundleId}",
    "args": [
      {
        "name": "id",
        "wire": "networkTokenBundleId",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [
      {
        "name": "scx_client_reference",
        "wire": "scx-client-reference",
        "value": "h1"
      }
    ],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "networkTokenBundleId": "x",
      "networkTokenBundleState": "x",
      "networkToken": {
        "networkTokenId": "x",
        "networkTokenState": "x",
        "networkTokenReason": "x",
        "tokenizedNumber": "x",
        "expirationMonth": "x",
        "expirationYear": "x",
        "type": "x",
        "card": {
          "suffix": "x",
          "expirationMonth": "x",
          "expirationYear": "x"
        }
      },
      "issuer": {
        "paymentAccountReference": "x"
      }
    },
    "idField": "id"
  },
  {
    "entity": "network_token_bundle",
    "accessor": "NetworkTokenBundle",
    "op": "load",
    "method": "GET",
    "path": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
    "action": "payment_credential",
    "args": [
      {
        "name": "id",
        "wire": "networkTokenBundleId",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [
      {
        "name": "scx_client_reference",
        "wire": "scx-client-reference",
        "value": "h1"
      }
    ],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {
      "networkTokenBundleId": "x",
      "networkToken": {
        "networkTokenId": "x",
        "networkTokenState": "x",
        "networkTokenReason": "x",
        "tokenizedNumber": "x",
        "expirationMonth": "x",
        "expirationYear": "x",
        "type": "x",
        "card": {
          "suffix": "x",
          "expirationMonth": "x",
          "expirationYear": "x"
        },
        "cryptogram": "x",
        "eci": "x",
        "requestorId": "x"
      },
      "card": {
        "number": "x"
      },
      "issuer": {
        "paymentAccountReference": "x"
      }
    },
    "idField": "id"
  },
  {
    "entity": "network_token_bundle",
    "accessor": "NetworkTokenBundle",
    "op": "remove",
    "method": "DELETE",
    "path": "/network-token-bundle/{networkTokenBundleId}",
    "args": [
      {
        "name": "id",
        "wire": "networkTokenBundleId",
        "value": "p1"
      }
    ],
    "select": {},
    "headers": [
      {
        "name": "scx_client_reference",
        "wire": "scx-client-reference",
        "value": "h1"
      }
    ],
    "cookies": [],
    "responseMedia": [
      "application/json"
    ],
    "query": [],
    "queryArgs": [],
    "auth": [
      [
        {
          "in": "header",
          "name": "authorization",
          "scheme": "basic"
        }
      ]
    ],
    "status": 200,
    "sample": {},
    "idField": "id"
  }
]


describe('definition', () => {
  for (const point of PLAN) {
    test(point.entity + '.' + point.op + ' ' + point.method + ' ' + point.path, async (t) => {
      const control = isControlSkipped('entityOp', point.entity + '.' + point.op, 'definition')
      if (control.skip) {
        t.skip(control.reason || 'skipped via sdk-test-control.json')
        return
      }
      await runDefinitionPoint(SDK, point)
    })
  }
})

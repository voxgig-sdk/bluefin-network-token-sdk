"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.config = void 0;
const TestFeature_1 = require("./feature/test/TestFeature");
const FEATURE_CLASS = {
    test: TestFeature_1.TestFeature,
};
class Config {
    makeFeature(fn) {
        const fc = FEATURE_CLASS[fn];
        const fi = new fc();
        // TODO: errors etc
        return fi;
    }
    // False for a feature added at runtime via options.extend (station's
    // adopt path) - the constructor uses this to skip makeFeature for names
    // no generated class backs.
    hasFeature(fn) {
        return null != FEATURE_CLASS[fn];
    }
    main = {
        name: 'BluefinNetworkToken',
        slug: "bluefin-network-token",
        version: "0.1.1",
        target: "ts",
    };
    feature = {
        test: {
            "options": {
                "active": false
            },
            "transport": "base"
        },
    };
    options = {
        base: "https://secure-cert.shieldconex.com/api",
        auth: {
            prefix: 'Basic',
        },
        headers: {
            "content-type": "application/json"
        },
        entity: {
            network_token_bundle: {},
        }
    };
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
    };
}
const config = new Config();
exports.config = config;
//# sourceMappingURL=Config.js.map
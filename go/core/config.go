package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "BluefinNetworkToken",
			"slug": "bluefin-network-token",
			"version": "0.1.1",
			"target": "go",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://secure-cert.shieldconex.com/api",
			"auth": map[string]any{
				"prefix": "Basic",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"network_token_bundle": map[string]any{},
			},
		},
		"entity": map[string]any{
			"network_token_bundle": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "card",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "cardNumber",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "expirationMonth",
						"short": "Two-digit month in which the payment card expires.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "expirationYear",
						"short": "Four-digit year in which the payment card expires.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "issuer",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "metadata",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "networkToken",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "networkTokenBundleId",
						"short": "Unique identifier for the Instrument Identifier token used in the transaction.",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "networkTokenBundleState",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "securityCode",
						"type": "`$STRING`",
					},
				},
				"name": "network_token_bundle",
				"op": map[string]any{
					"create": map[string]any{
						"input": "data",
						"name": "create",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "scx_client_reference",
											"orig": "scx_client_reference",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "POST",
								"orig": "/network-token-bundle",
								"parts": []any{
									"network-token-bundle",
								},
								"select": map[string]any{
									"exist": []any{
										"scx_client_reference",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "scx_client_reference",
											"orig": "scx_client_reference",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "network_token_bundle_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/network-token-bundle/{networkTokenBundleId}",
								"parts": []any{
									"network-token-bundle",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"networkTokenBundleId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"scx_client_reference",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "scx_client_reference",
											"orig": "scx_client_reference",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "network_token_bundle_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
								"parts": []any{
									"network-token-bundle",
									"{id}",
									"payment-credentials",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"networkTokenBundleId": "id",
									},
								},
								"select": map[string]any{
									"$action": "payment_credential",
									"exist": []any{
										"id",
										"scx_client_reference",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
					"remove": map[string]any{
						"input": "data",
						"name": "remove",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"header": []any{
										map[string]any{
											"kind": "header",
											"name": "scx_client_reference",
											"orig": "scx_client_reference",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
									"params": []any{
										map[string]any{
											"kind": "param",
											"name": "id",
											"orig": "network_token_bundle_id",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "DELETE",
								"orig": "/network-token-bundle/{networkTokenBundleId}",
								"parts": []any{
									"network-token-bundle",
									"{id}",
								},
								"rename": map[string]any{
									"param": map[string]any{
										"networkTokenBundleId": "id",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"scx_client_reference",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}

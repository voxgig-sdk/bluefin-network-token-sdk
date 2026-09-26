# BluefinNetworkToken SDK configuration
#
# Returns the resolved SDK config as vendored-struct nodes (via
# BluefinNetworkToken.Helpers.deep/1). Do not edit by hand.

defmodule BluefinNetworkToken.Config do
  def make_config do
    BluefinNetworkToken.Helpers.deep(%{
      "main" => %{
        "name" => "BluefinNetworkToken",
        "slug" => "bluefin-network-token",
        "version" => "0.1.1",
        "target" => "elixir"
      },
      "feature" => %{
        "audit" => %{
          "options" => %{
            "active" => false,
            "actor" => "anonymous",
            "max" => 1000
          },
          "optspec" => %{
            "now" => "`$FUNCTION`",
            "sink" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "clienttrack" => %{
          "options" => %{
            "active" => false,
            "clientVersion" => "0.0.1"
          },
          "optspec" => %{
            "clientName" => "`$STRING`",
            "clientVersion" => "`$STRING`",
            "headers" => "`$MAP`",
            "idgen" => "`$FUNCTION`",
            "sessionId" => "`$STRING`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "debug" => %{
          "options" => %{
            "active" => false,
            "max" => 100,
            "redact" => [
              "authorization",
              "cookie",
              "set-cookie",
              "api-key",
              "apikey",
              "x-api-key",
              "idempotency-key"
            ]
          },
          "optspec" => %{
            "now" => "`$FUNCTION`",
            "onEntry" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "idempotency" => %{
          "options" => %{
            "active" => false,
            "header" => "Idempotency-Key",
            "methods" => [
              "POST",
              "PUT",
              "PATCH",
              "DELETE"
            ],
            "ops" => [
              "create",
              "update",
              "remove"
            ]
          },
          "optspec" => %{
            "keygen" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "log" => %{
          "options" => %{
            "active" => true
          },
          "optspec" => %{
            "level" => "`$STRING`",
            "logger" => "`$ANY`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "metrics" => %{
          "options" => %{
            "active" => false
          },
          "optspec" => %{
            "now" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "paging" => %{
          "options" => %{
            "active" => false,
            "afterVar" => "after",
            "cursorParam" => "cursor",
            "firstVar" => "first",
            "limitParam" => "limit",
            "pageParam" => "page",
            "startPage" => 1
          },
          "optspec" => %{
            "limit" => "`$NUMBER`",
            "ops" => "`$LIST`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "ratelimit" => %{
          "options" => %{
            "active" => false,
            "burst" => 5,
            "rate" => 5
          },
          "optspec" => %{
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "wrap"
        },
        "retry" => %{
          "options" => %{
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504
            ]
          },
          "optspec" => %{
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "wrap"
        },
        "telemetry" => %{
          "options" => %{
            "active" => false
          },
          "optspec" => %{
            "exporter" => "`$FUNCTION`",
            "headers" => "`$MAP`",
            "idgen" => "`$FUNCTION`",
            "now" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "none"
        },
        "test" => %{
          "options" => %{
            "active" => false
          },
          "optspec" => %{
            "entity" => "`$MAP`",
            "net" => "`$MAP`"
          },
          "strict" => false,
          "transport" => "base"
        },
        "timeout" => %{
          "options" => %{
            "active" => false,
            "ms" => 30000
          },
          "optspec" => %{
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`"
          },
          "strict" => false,
          "transport" => "wrap"
        },
      },
      "options" => %{
        "base" => "https://secure-cert.shieldconex.com/api",
        "auth" => %{
          "prefix" => "Basic",
          "basic" => true
        },
        "headers" => %{
          "content-type" => "application/json"
        },
        "entity" => %{
          "network_token_bundle" => %{}
        }
      },
      "entity" => %{
        "network_token_bundle" => %{
          "fields" => [
            %{
              "name" => "card",
              "title" => "Card",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "cardNumber",
              "title" => "Card Number",
              "type" => "`$STRING`"
            },
            %{
              "name" => "expirationMonth",
              "title" => "Expiration Month",
              "type" => "`$STRING`",
              "short" => "Two-digit month in which the payment card expires."
            },
            %{
              "name" => "expirationYear",
              "title" => "Expiration Year",
              "type" => "`$STRING`",
              "short" => "Four-digit year in which the payment card expires."
            },
            %{
              "name" => "id",
              "title" => "Id",
              "type" => "`$STRING`"
            },
            %{
              "name" => "issuer",
              "title" => "Issuer",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "metadata",
              "title" => "Metadata",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "networkToken",
              "title" => "Network Token",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "networkTokenBundleId",
              "title" => "Network Token Bundle Id",
              "type" => "`$STRING`",
              "short" => "Unique identifier for the Instrument Identifier token used in the transaction."
            },
            %{
              "name" => "networkTokenBundleState",
              "title" => "Network Token Bundle State",
              "type" => "`$STRING`"
            },
            %{
              "name" => "securityCode",
              "title" => "Security Code",
              "type" => "`$STRING`"
            }
          ],
          "id" => %{
            "field" => "id",
            "name" => "id"
          },
          "name" => "network_token_bundle",
          "op" => %{
            "create" => %{
              "input" => "data",
              "name" => "create",
              "points" => [
                %{
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/network-token-bundle",
                  "segments" => [
                    %{
                      "lit" => "network-token-bundle"
                    }
                  ],
                  "parts" => [
                    "network-token-bundle"
                  ],
                  "rename" => %{},
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  },
                  "args" => %{
                    "header" => [
                      %{
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "type" => "`$STRING`",
                        "kind" => "header",
                        "reqd" => true
                      }
                    ]
                  },
                  "select" => %{
                    "exist" => [
                      "scx_client_reference"
                    ]
                  }
                }
              ]
            },
            "load" => %{
              "input" => "data",
              "name" => "load",
              "points" => [
                %{
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "segments" => [
                    %{
                      "lit" => "network-token-bundle"
                    },
                    %{
                      "var" => "id"
                    }
                  ],
                  "parts" => [
                    "network-token-bundle",
                    "{id}"
                  ],
                  "rename" => %{
                    "param" => %{
                      "networkTokenBundleId" => "id"
                    }
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  },
                  "args" => %{
                    "header" => [
                      %{
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "type" => "`$STRING`",
                        "kind" => "header",
                        "reqd" => true
                      }
                    ],
                    "params" => [
                      %{
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true
                      }
                    ]
                  },
                  "select" => %{
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  }
                },
                %{
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
                  "segments" => [
                    %{
                      "lit" => "network-token-bundle"
                    },
                    %{
                      "var" => "id"
                    },
                    %{
                      "lit" => "payment-credentials"
                    }
                  ],
                  "parts" => [
                    "network-token-bundle",
                    "{id}",
                    "payment-credentials"
                  ],
                  "rename" => %{
                    "param" => %{
                      "networkTokenBundleId" => "id"
                    }
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  },
                  "args" => %{
                    "header" => [
                      %{
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "type" => "`$STRING`",
                        "kind" => "header",
                        "reqd" => true
                      }
                    ],
                    "params" => [
                      %{
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true
                      }
                    ]
                  },
                  "select" => %{
                    "$action" => "payment_credential",
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  }
                }
              ]
            },
            "remove" => %{
              "input" => "data",
              "name" => "remove",
              "points" => [
                %{
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "segments" => [
                    %{
                      "lit" => "network-token-bundle"
                    },
                    %{
                      "var" => "id"
                    }
                  ],
                  "parts" => [
                    "network-token-bundle",
                    "{id}"
                  ],
                  "rename" => %{
                    "param" => %{
                      "networkTokenBundleId" => "id"
                    }
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  },
                  "args" => %{
                    "header" => [
                      %{
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "type" => "`$STRING`",
                        "kind" => "header",
                        "reqd" => true
                      }
                    ],
                    "params" => [
                      %{
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "type" => "`$STRING`",
                        "kind" => "param",
                        "reqd" => true
                      }
                    ]
                  },
                  "select" => %{
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  }
                }
              ]
            }
          },
          "relations" => %{
            "ancestors" => []
          }
        }
      }
    })
  end

  # SHARED CONFIG (sdkgen rung L2). See the data branch for the rationale, and
  # for why the cached handle is validated on read.
  @shared_key {__MODULE__, :shared_config}

  # The process-wide config, built once on first use. The returned node is
  # SHARED: treat it as read-only. Callers that need to mutate should use
  # make_config, which always returns a fresh copy.
  def shared_config do
    cached = :persistent_term.get(@shared_key, nil)

    if cached != nil and usable?(cached) do
      cached
    else
      cfg = make_config()
      :persistent_term.put(@shared_key, cfg)
      cfg
    end
  end

  defp usable?(cfg) do
    Voxgig.Struct.getprop(cfg, "main")
    true
  rescue
    ArgumentError -> false
  end
end

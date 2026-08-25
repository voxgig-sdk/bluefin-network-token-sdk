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
        "test" => %{
          "options" => %{
            "active" => false
          },
          "transport" => "base"
        },
      },
      "options" => %{
        "base" => "https://secure-cert.shieldconex.com/api",
        "auth" => %{
          "prefix" => "Basic"
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
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "cardNumber",
              "type" => "`$STRING`"
            },
            %{
              "name" => "expirationMonth",
              "short" => "Two-digit month in which the payment card expires.",
              "type" => "`$STRING`"
            },
            %{
              "name" => "expirationYear",
              "short" => "Four-digit year in which the payment card expires.",
              "type" => "`$STRING`"
            },
            %{
              "name" => "id",
              "type" => "`$STRING`"
            },
            %{
              "name" => "issuer",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "metadata",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "networkToken",
              "type" => "`$OBJECT`"
            },
            %{
              "name" => "networkTokenBundleId",
              "short" => "Unique identifier for the Instrument Identifier token used in the transaction.",
              "type" => "`$STRING`"
            },
            %{
              "name" => "networkTokenBundleState",
              "type" => "`$STRING`"
            },
            %{
              "name" => "securityCode",
              "type" => "`$STRING`"
            }
          ],
          "name" => "network_token_bundle",
          "op" => %{
            "create" => %{
              "input" => "data",
              "name" => "create",
              "points" => [
                %{
                  "args" => %{
                    "header" => [
                      %{
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ]
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/network-token-bundle",
                  "parts" => [
                    "network-token-bundle"
                  ],
                  "select" => %{
                    "exist" => [
                      "scx_client_reference"
                    ]
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  }
                }
              ]
            },
            "load" => %{
              "input" => "data",
              "name" => "load",
              "points" => [
                %{
                  "args" => %{
                    "header" => [
                      %{
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ],
                    "params" => [
                      %{
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ]
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "parts" => [
                    "network-token-bundle",
                    "{id}"
                  ],
                  "rename" => %{
                    "param" => %{
                      "networkTokenBundleId" => "id"
                    }
                  },
                  "select" => %{
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  }
                },
                %{
                  "args" => %{
                    "header" => [
                      %{
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ],
                    "params" => [
                      %{
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ]
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
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
                  "select" => %{
                    "$action" => "payment_credential",
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
                  }
                }
              ]
            },
            "remove" => %{
              "input" => "data",
              "name" => "remove",
              "points" => [
                %{
                  "args" => %{
                    "header" => [
                      %{
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ],
                    "params" => [
                      %{
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`"
                      }
                    ]
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "parts" => [
                    "network-token-bundle",
                    "{id}"
                  ],
                  "rename" => %{
                    "param" => %{
                      "networkTokenBundleId" => "id"
                    }
                  },
                  "select" => %{
                    "exist" => [
                      "id",
                      "scx_client_reference"
                    ]
                  },
                  "transform" => %{
                    "req" => "`reqdata`",
                    "res" => "`body`"
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

-- BluefinNetworkToken SDK configuration

-- Build a fresh, fully materialised config table. Every call rebuilds the
-- whole structure, so prefer require("config_shared") unless you need a
-- private copy you intend to mutate.
local function make_config()
  return {
    main = {
      name = "BluefinNetworkToken",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://secure-cert.shieldconex.com/api",
      auth = {
        prefix = "Basic",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["network_token_bundle"] = {},
      },
    },
    entity = {
      ["network_token_bundle"] = {
        ["fields"] = {
          {
            ["name"] = "card",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "cardNumber",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "expirationMonth",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "expirationYear",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "issuer",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "metadata",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "networkToken",
            ["type"] = "`$OBJECT`",
          },
          {
            ["name"] = "networkTokenBundleId",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "networkTokenBundleState",
            ["type"] = "`$STRING`",
          },
          {
            ["name"] = "securityCode",
            ["type"] = "`$STRING`",
          },
        },
        ["name"] = "network_token_bundle",
        ["op"] = {
          ["create"] = {
            ["input"] = "data",
            ["name"] = "create",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "scx_client_reference",
                      ["orig"] = "scx_client_reference",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "POST",
                ["orig"] = "/network-token-bundle",
                ["parts"] = {
                  "network-token-bundle",
                },
                ["select"] = {
                  ["exist"] = {
                    "scx_client_reference",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "scx_client_reference",
                      ["orig"] = "scx_client_reference",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "network_token_bundle_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/network-token-bundle/{networkTokenBundleId}",
                ["parts"] = {
                  "network-token-bundle",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["networkTokenBundleId"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                    "scx_client_reference",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "scx_client_reference",
                      ["orig"] = "scx_client_reference",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "network_token_bundle_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
                ["parts"] = {
                  "network-token-bundle",
                  "{id}",
                  "payment-credentials",
                },
                ["rename"] = {
                  ["param"] = {
                    ["networkTokenBundleId"] = "id",
                  },
                },
                ["select"] = {
                  ["$action"] = "payment_credential",
                  ["exist"] = {
                    "id",
                    "scx_client_reference",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
          ["remove"] = {
            ["input"] = "data",
            ["name"] = "remove",
            ["points"] = {
              {
                ["args"] = {
                  ["header"] = {
                    {
                      ["kind"] = "header",
                      ["name"] = "scx_client_reference",
                      ["orig"] = "scx_client_reference",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                  ["params"] = {
                    {
                      ["kind"] = "param",
                      ["name"] = "id",
                      ["orig"] = "network_token_bundle_id",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "DELETE",
                ["orig"] = "/network-token-bundle/{networkTokenBundleId}",
                ["parts"] = {
                  "network-token-bundle",
                  "{id}",
                },
                ["rename"] = {
                  ["param"] = {
                    ["networkTokenBundleId"] = "id",
                  },
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                    "scx_client_reference",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
              },
            },
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config

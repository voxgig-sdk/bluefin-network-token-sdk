# BluefinNetworkToken SDK configuration

module BluefinNetworkTokenConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "BluefinNetworkToken",
        "slug" => "bluefin-network-token",
        "version" => "0.1.1",
        "target" => "rb",
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
          "transport" => "base",
        },
      },
      "options" => {
        "base" => "https://secure-cert.shieldconex.com/api",
        "auth" => {
          "prefix" => "Basic",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "network_token_bundle" => {},
        },
      },
      "entity" => {
        "network_token_bundle" => {
          "fields" => [
            {
              "name" => "card",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "cardNumber",
              "type" => "`$STRING`",
            },
            {
              "name" => "expirationMonth",
              "short" => "Two-digit month in which the payment card expires.",
              "type" => "`$STRING`",
            },
            {
              "name" => "expirationYear",
              "short" => "Four-digit year in which the payment card expires.",
              "type" => "`$STRING`",
            },
            {
              "name" => "issuer",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "metadata",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "networkToken",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "networkTokenBundleId",
              "short" => "Unique identifier for the Instrument Identifier token used in the transaction.",
              "type" => "`$STRING`",
            },
            {
              "name" => "networkTokenBundleState",
              "type" => "`$STRING`",
            },
            {
              "name" => "securityCode",
              "type" => "`$STRING`",
            },
          ],
          "name" => "network_token_bundle",
          "op" => {
            "create" => {
              "input" => "data",
              "name" => "create",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "POST",
                  "orig" => "/network-token-bundle",
                  "parts" => [
                    "network-token-bundle",
                  ],
                  "select" => {
                    "exist" => [
                      "scx_client_reference",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "parts" => [
                    "network-token-bundle",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "networkTokenBundleId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "scx_client_reference",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}/payment-credentials",
                  "parts" => [
                    "network-token-bundle",
                    "{id}",
                    "payment-credentials",
                  ],
                  "rename" => {
                    "param" => {
                      "networkTokenBundleId" => "id",
                    },
                  },
                  "select" => {
                    "$action" => "payment_credential",
                    "exist" => [
                      "id",
                      "scx_client_reference",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
            "remove" => {
              "input" => "data",
              "name" => "remove",
              "points" => [
                {
                  "args" => {
                    "header" => [
                      {
                        "kind" => "header",
                        "name" => "scx_client_reference",
                        "orig" => "scx_client_reference",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                    "params" => [
                      {
                        "kind" => "param",
                        "name" => "id",
                        "orig" => "network_token_bundle_id",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "DELETE",
                  "orig" => "/network-token-bundle/{networkTokenBundleId}",
                  "parts" => [
                    "network-token-bundle",
                    "{id}",
                  ],
                  "rename" => {
                    "param" => {
                      "networkTokenBundleId" => "id",
                    },
                  },
                  "select" => {
                    "exist" => [
                      "id",
                      "scx_client_reference",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    BluefinNetworkTokenFeatures.make_feature(name)
  end
end

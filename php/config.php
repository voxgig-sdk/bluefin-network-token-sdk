<?php
declare(strict_types=1);

// BluefinNetworkToken SDK configuration

class BluefinNetworkTokenConfig
{
    /** @var array<string,mixed>|null */
    private static ?array $shared_config = null;

    /**
     * Return the process-wide config, built once on first use. The SDK reads
     * the config on every request and never writes to it, so one instance is
     * shared by every client rather than rebuilt per client.
     *
     * PHP arrays are copy-on-write, so callers that do mutate the result get
     * their own copy and cannot disturb the shared one.
     */
    public static function shared_config(): array
    {
        if (self::$shared_config === null) {
            self::$shared_config = self::make_config();
        }
        return self::$shared_config;
    }

    /**
     * Build a fresh, fully materialised config array. Every call rebuilds the
     * whole structure, so prefer shared_config unless you need a private copy.
     */
    public static function make_config(): array
    {
        return [
            "main" => [
                "name" => "BluefinNetworkToken",
            ],
            "feature" => [
                "test" => [
          'options' => [
            'active' => false,
          ],
        ],
            ],
            "options" => [
                "base" => "https://secure-cert.shieldconex.com/api",
                "auth" => [
                    "prefix" => "Basic",
                ],
                "headers" => [
          'content-type' => 'application/json',
        ],
                "entity" => [
                    "network_token_bundle" => [],
                ],
            ],
            "entity" => [
        'network_token_bundle' => [
          'fields' => [
            [
              'name' => 'card',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'cardNumber',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'expirationMonth',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'expirationYear',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'issuer',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'metadata',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'networkToken',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'networkTokenBundleId',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'networkTokenBundleState',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'securityCode',
              'type' => '`$STRING`',
            ],
          ],
          'name' => 'network_token_bundle',
          'op' => [
            'create' => [
              'input' => 'data',
              'name' => 'create',
              'points' => [
                [
                  'args' => [
                    'header' => [
                      [
                        'kind' => 'header',
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/network-token-bundle',
                  'parts' => [
                    'network-token-bundle',
                  ],
                  'select' => [
                    'exist' => [
                      'scx_client_reference',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'args' => [
                    'header' => [
                      [
                        'kind' => 'header',
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}',
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
                [
                  'args' => [
                    'header' => [
                      [
                        'kind' => 'header',
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}/payment-credentials',
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                    'payment-credentials',
                  ],
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'select' => [
                    '$action' => 'payment_credential',
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
            'remove' => [
              'input' => 'data',
              'name' => 'remove',
              'points' => [
                [
                  'args' => [
                    'header' => [
                      [
                        'kind' => 'header',
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                    'params' => [
                      [
                        'kind' => 'param',
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'reqd' => true,
                        'type' => '`$STRING`',
                      ],
                    ],
                  ],
                  'kind' => 'http',
                  'method' => 'DELETE',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}',
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                ],
              ],
            ],
          ],
          'relations' => [
            'ancestors' => [],
          ],
        ],
      ],
        ];
    }


    public static function make_feature(string $name)
    {
        require_once __DIR__ . '/features.php';
        return BluefinNetworkTokenFeatures::make_feature($name);
    }
}

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
                "slug" => "bluefin-network-token",
                "version" => "0.1.1",
                "target" => "php",
            ],
            "feature" => [
                "audit" => [
          'options' => [
            'active' => false,
            'actor' => 'anonymous',
            'max' => 1000,
          ],
          'transport' => 'none',
        ],
                "clienttrack" => [
          'options' => [
            'active' => false,
            'clientVersion' => '0.0.1',
          ],
          'transport' => 'none',
        ],
                "idempotency" => [
          'options' => [
            'active' => false,
            'header' => 'Idempotency-Key',
            'methods' => [
              'POST',
              'PUT',
              'PATCH',
              'DELETE',
            ],
            'ops' => [
              'create',
              'update',
              'remove',
            ],
          ],
          'transport' => 'none',
        ],
                "log" => [
          'options' => [
            'active' => true,
          ],
          'transport' => 'none',
        ],
                "metrics" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'none',
        ],
                "paging" => [
          'options' => [
            'active' => false,
            'afterVar' => 'after',
            'cursorParam' => 'cursor',
            'firstVar' => 'first',
            'limitParam' => 'limit',
            'pageParam' => 'page',
            'startPage' => 1,
          ],
          'transport' => 'none',
        ],
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'transport' => 'wrap',
        ],
                "retry" => [
          'options' => [
            'active' => false,
            'factor' => 2,
            'maxDelay' => 2000,
            'minDelay' => 50,
            'retries' => 2,
            'statuses' => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          ],
          'transport' => 'wrap',
        ],
                "telemetry" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'none',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'transport' => 'wrap',
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
              'short' => 'Two-digit month in which the payment card expires.',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'expirationYear',
              'short' => 'Four-digit year in which the payment card expires.',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'id',
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
              'short' => 'Unique identifier for the Instrument Identifier token used in the transaction.',
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
          'id' => [
            'field' => 'id',
            'name' => 'id',
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
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
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
                  'parts' => [
                    'network-token-bundle',
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
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                    [
                      'var' => 'id',
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
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
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
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                    [
                      'var' => 'id',
                    ],
                    [
                      'lit' => 'payment-credentials',
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
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                    'payment-credentials',
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
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                    [
                      'var' => 'id',
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
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
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

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
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sink' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "clienttrack" => [
          'options' => [
            'active' => false,
            'clientVersion' => '0.0.1',
          ],
          'optspec' => [
            'clientName' => '`$STRING`',
            'clientVersion' => '`$STRING`',
            'headers' => '`$MAP`',
            'idgen' => '`$FUNCTION`',
            'sessionId' => '`$STRING`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "debug" => [
          'options' => [
            'active' => false,
            'max' => 100,
            'redact' => [
              'authorization',
              'cookie',
              'set-cookie',
              'api-key',
              'apikey',
              'x-api-key',
              'idempotency-key',
            ],
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'onEntry' => '`$FUNCTION`',
          ],
          'strict' => false,
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
          'optspec' => [
            'keygen' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "log" => [
          'options' => [
            'active' => true,
          ],
          'optspec' => [
            'level' => '`$STRING`',
            'logger' => '`$ANY`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "metrics" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
          ],
          'strict' => false,
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
          'optspec' => [
            'limit' => '`$NUMBER`',
            'ops' => '`$LIST`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "ratelimit" => [
          'options' => [
            'active' => false,
            'burst' => 5,
            'rate' => 5,
          ],
          'optspec' => [
            'now' => '`$FUNCTION`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
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
          'optspec' => [
            'jitter' => '`$BOOLEAN`',
            'sleep' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'wrap',
        ],
                "telemetry" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'exporter' => '`$FUNCTION`',
            'headers' => '`$MAP`',
            'idgen' => '`$FUNCTION`',
            'now' => '`$FUNCTION`',
          ],
          'strict' => false,
          'transport' => 'none',
        ],
                "test" => [
          'options' => [
            'active' => false,
          ],
          'optspec' => [
            'entity' => '`$MAP`',
            'net' => '`$MAP`',
          ],
          'strict' => false,
          'transport' => 'base',
        ],
                "timeout" => [
          'options' => [
            'active' => false,
            'ms' => 30000,
          ],
          'optspec' => [
            'clearTimer' => '`$FUNCTION`',
            'setTimer' => '`$FUNCTION`',
          ],
          'strict' => false,
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
              'title' => 'Card',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'cardNumber',
              'title' => 'Card Number',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'expirationMonth',
              'title' => 'Expiration Month',
              'type' => '`$STRING`',
              'short' => 'Two-digit month in which the payment card expires.',
            ],
            [
              'name' => 'expirationYear',
              'title' => 'Expiration Year',
              'type' => '`$STRING`',
              'short' => 'Four-digit year in which the payment card expires.',
            ],
            [
              'name' => 'id',
              'title' => 'Id',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'issuer',
              'title' => 'Issuer',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'metadata',
              'title' => 'Metadata',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'networkToken',
              'title' => 'Network Token',
              'type' => '`$OBJECT`',
            ],
            [
              'name' => 'networkTokenBundleId',
              'title' => 'Network Token Bundle Id',
              'type' => '`$STRING`',
              'short' => 'Unique identifier for the Instrument Identifier token used in the transaction.',
            ],
            [
              'name' => 'networkTokenBundleState',
              'title' => 'Network Token Bundle State',
              'type' => '`$STRING`',
            ],
            [
              'name' => 'securityCode',
              'title' => 'Security Code',
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
                  'kind' => 'http',
                  'method' => 'POST',
                  'orig' => '/network-token-bundle',
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                  ],
                  'parts' => [
                    'network-token-bundle',
                  ],
                  'rename' => [],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'header' => [
                      [
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'type' => '`$STRING`',
                        'kind' => 'header',
                        'reqd' => true,
                      ],
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'scx_client_reference',
                    ],
                  ],
                ],
              ],
            ],
            'load' => [
              'input' => 'data',
              'name' => 'load',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}',
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                    [
                      'var' => 'id',
                    ],
                  ],
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'header' => [
                      [
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'type' => '`$STRING`',
                        'kind' => 'header',
                        'reqd' => true,
                      ],
                    ],
                    'params' => [
                      [
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'type' => '`$STRING`',
                        'kind' => 'param',
                        'reqd' => true,
                      ],
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
                  ],
                ],
                [
                  'kind' => 'http',
                  'method' => 'GET',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}/payment-credentials',
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
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'header' => [
                      [
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'type' => '`$STRING`',
                        'kind' => 'header',
                        'reqd' => true,
                      ],
                    ],
                    'params' => [
                      [
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'type' => '`$STRING`',
                        'kind' => 'param',
                        'reqd' => true,
                      ],
                    ],
                  ],
                  'select' => [
                    '$action' => 'payment_credential',
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
                  ],
                ],
              ],
            ],
            'remove' => [
              'input' => 'data',
              'name' => 'remove',
              'points' => [
                [
                  'kind' => 'http',
                  'method' => 'DELETE',
                  'orig' => '/network-token-bundle/{networkTokenBundleId}',
                  'segments' => [
                    [
                      'lit' => 'network-token-bundle',
                    ],
                    [
                      'var' => 'id',
                    ],
                  ],
                  'parts' => [
                    'network-token-bundle',
                    '{id}',
                  ],
                  'rename' => [
                    'param' => [
                      'networkTokenBundleId' => 'id',
                    ],
                  ],
                  'transform' => [
                    'req' => '`reqdata`',
                    'res' => '`body`',
                  ],
                  'args' => [
                    'header' => [
                      [
                        'name' => 'scx_client_reference',
                        'orig' => 'scx_client_reference',
                        'type' => '`$STRING`',
                        'kind' => 'header',
                        'reqd' => true,
                      ],
                    ],
                    'params' => [
                      [
                        'name' => 'id',
                        'orig' => 'network_token_bundle_id',
                        'type' => '`$STRING`',
                        'kind' => 'param',
                        'reqd' => true,
                      ],
                    ],
                  ],
                  'select' => [
                    'exist' => [
                      'id',
                      'scx_client_reference',
                    ],
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

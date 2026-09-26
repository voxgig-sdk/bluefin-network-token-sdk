import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
import 'feature/debug/DebugFeature.dart';
import 'feature/idempotency/IdempotencyFeature.dart';
import 'feature/log/LogFeature.dart';
import 'feature/metrics/MetricsFeature.dart';
import 'feature/paging/PagingFeature.dart';
import 'feature/ratelimit/RatelimitFeature.dart';
import 'feature/retry/RetryFeature.dart';
import 'feature/telemetry/TelemetryFeature.dart';
import 'feature/test/TestFeature.dart';
import 'feature/timeout/TimeoutFeature.dart';



// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'audit': () => AuditFeature(),
  'clienttrack': () => ClienttrackFeature(),
  'debug': () => DebugFeature(),
  'idempotency': () => IdempotencyFeature(),
  'log': () => LogFeature(),
  'metrics': () => MetricsFeature(),
  'paging': () => PagingFeature(),
  'ratelimit': () => RatelimitFeature(),
  'retry': () => RetryFeature(),
  'telemetry': () => TelemetryFeature(),
  'test': () => TestFeature(),
  'timeout': () => TimeoutFeature(),

};

// Per-feature plugin DEFINITIONS (voxgig/plugin `Definition` values), from
// the model's active plugin groups. A feature that takes a `plugins` option
// (secrets over sekreto) reads its own entry; a feature with no plugins has
// none. The named `show` imports above make each definition statically
// reachable, so an SDK carries exactly the plugin libraries its model
// selects - the same leanness the old side-effect registry bought, without
// a registry.
//
// Emitted UNCONDITIONALLY, empty when no group is active: SecretsFeature
// imports this name, and the feature source can be present in a tree whose
// model selects no plugin group at all. An emission conditional on the map
// having entries would make that tree fail `dart analyze`.
//
// ignore: non_constant_identifier_names
final Map<String, List<dynamic>> FEATURE_PLUGINS = <String, List<dynamic>>{
  
};

class Config {
  BaseFeature makeFeature(String fn) {
    final fc = FEATURE_CLASS[fn];
    if (null == fc) {
      // TODO: errors etc
      throw StateError('Unknown feature: ' + fn);
    }
    return fc();
  }

  // False for a feature added at runtime via options.extend (station's
  // adopt path) - the constructor uses this to skip makeFeature for names
  // no generated class backs.
  bool hasFeature(String fn) => null != FEATURE_CLASS[fn];

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinNetworkToken',
        'slug': 'bluefin-network-token',
    'version': '0.1.1',
    'target': 'dart',

  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'audit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'actor': 'anonymous',
        'max': 1000,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sink': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
      'optspec': <String, dynamic>{
        'clientName': '`\$STRING`',
        'clientVersion': '`\$STRING`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'sessionId': '`\$STRING`',
      },
      'strict': false,
      'transport': 'none',
    },
    'debug': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'max': 100,
        'redact': <dynamic>[
          'authorization',
          'cookie',
          'set-cookie',
          'api-key',
          'apikey',
          'x-api-key',
          'idempotency-key',
        ],
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'onEntry': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'idempotency': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'header': 'Idempotency-Key',
        'methods': <dynamic>[
          'POST',
          'PUT',
          'PATCH',
          'DELETE',
        ],
        'ops': <dynamic>[
          'create',
          'update',
          'remove',
        ],
      },
      'optspec': <String, dynamic>{
        'keygen': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'optspec': <String, dynamic>{
        'level': '`\$STRING`',
        'logger': '`\$ANY`',
      },
      'strict': false,
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'paging': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'afterVar': 'after',
        'cursorParam': 'cursor',
        'firstVar': 'first',
        'limitParam': 'limit',
        'pageParam': 'page',
        'startPage': 1,
      },
      'optspec': <String, dynamic>{
        'limit': '`\$NUMBER`',
        'ops': '`\$LIST`',
      },
      'strict': false,
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
      'optspec': <String, dynamic>{
        'now': '`\$FUNCTION`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'retry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'factor': 2,
        'maxDelay': 2000,
        'minDelay': 50,
        'retries': 2,
        'statuses': <dynamic>[
          408,
          425,
          429,
          500,
          502,
          503,
          504,
        ],
      },
      'optspec': <String, dynamic>{
        'jitter': '`\$BOOLEAN`',
        'sleep': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'exporter': '`\$FUNCTION`',
        'headers': '`\$MAP`',
        'idgen': '`\$FUNCTION`',
        'now': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'optspec': <String, dynamic>{
        'entity': '`\$MAP`',
        'net': '`\$MAP`',
      },
      'strict': false,
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
      'optspec': <String, dynamic>{
        'clearTimer': '`\$FUNCTION`',
        'setTimer': '`\$FUNCTION`',
      },
      'strict': false,
      'transport': 'wrap',
    },

  };

  // Rendered whole from the canonical config definition rather than assembled
  // slot by slot. Assembling it here meant `options.server` - the OpenAPI
  // server-variable defaults - was simply absent from this branch, so a
  // templated server URL produced a different config either side of the
  // threshold.
  final Map<String, dynamic> options = <String, dynamic>{
    'base': 'https://secure-cert.shieldconex.com/api',
    'auth': <String, dynamic>{
      'prefix': 'Basic',
      'basic': true,
    },
    'headers': <String, dynamic>{
      'content-type': 'application/json',
    },
    'entity': <String, dynamic>{
      'network_token_bundle': <String, dynamic>{},
    },
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'network_token_bundle': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'name': 'card',
          'title': 'Card',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'cardNumber',
          'title': 'Card Number',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'expirationMonth',
          'title': 'Expiration Month',
          'type': '`\$STRING`',
          'short': 'Two-digit month in which the payment card expires.',
        },
        <String, dynamic>{
          'name': 'expirationYear',
          'title': 'Expiration Year',
          'type': '`\$STRING`',
          'short': 'Four-digit year in which the payment card expires.',
        },
        <String, dynamic>{
          'name': 'id',
          'title': 'Id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'issuer',
          'title': 'Issuer',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'metadata',
          'title': 'Metadata',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'networkToken',
          'title': 'Network Token',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'networkTokenBundleId',
          'title': 'Network Token Bundle Id',
          'type': '`\$STRING`',
          'short': 'Unique identifier for the Instrument Identifier token used in the transaction.',
        },
        <String, dynamic>{
          'name': 'networkTokenBundleState',
          'title': 'Network Token Bundle State',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'securityCode',
          'title': 'Security Code',
          'type': '`\$STRING`',
        },
      ],
      'id': <String, dynamic>{
        'field': 'id',
        'name': 'id',
      },
      'name': 'network_token_bundle',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'POST',
              'orig': '/network-token-bundle',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
              ],
              'parts': <dynamic>[
                'network-token-bundle',
              ],
              'rename': <String, dynamic>{},
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'scx_client_reference',
                ],
              },
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/network-token-bundle/{networkTokenBundleId}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
            },
            <String, dynamic>{
              'kind': 'http',
              'method': 'GET',
              'orig': '/network-token-bundle/{networkTokenBundleId}/payment-credentials',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
                <String, dynamic>{
                  'var': 'id',
                },
                <String, dynamic>{
                  'lit': 'payment-credentials',
                },
              ],
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
                'payment-credentials',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                '\$action': 'payment_credential',
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/network-token-bundle/{networkTokenBundleId}',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'type': '`\$STRING`',
                    'kind': 'header',
                    'reqd': true,
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'type': '`\$STRING`',
                    'kind': 'param',
                    'reqd': true,
                  },
                ],
              },
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
            },
          ],
        },
      },
      'relations': <String, dynamic>{
        'ancestors': <dynamic>[],
      },
    },
  };

  // The pipeline context carries the config as a plain map.
  Map<String, dynamic> toMap() => <String, dynamic>{
        'main': main,
        'feature': feature,
        'options': options,
        'entity': entity,
      };
}

final config = Config();

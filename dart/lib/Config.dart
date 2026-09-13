import 'feature/base/BaseFeature.dart';
import 'feature/audit/AuditFeature.dart';
import 'feature/clienttrack/ClienttrackFeature.dart';
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
      'transport': 'none',
    },
    'clienttrack': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'clientVersion': '0.0.1',
      },
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
      'transport': 'none',
    },
    'log': <String, dynamic>{
      'options': <String, dynamic>{
        'active': true,
      },
      'transport': 'none',
    },
    'metrics': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
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
      'transport': 'none',
    },
    'ratelimit': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'burst': 5,
        'rate': 5,
      },
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
      'transport': 'wrap',
    },
    'telemetry': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'none',
    },
    'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'base',
    },
    'timeout': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
        'ms': 30000,
      },
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
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'cardNumber',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'expirationMonth',
          'short': 'Two-digit month in which the payment card expires.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'expirationYear',
          'short': 'Four-digit year in which the payment card expires.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'id',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'issuer',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'metadata',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'networkToken',
          'type': '`\$OBJECT`',
        },
        <String, dynamic>{
          'name': 'networkTokenBundleId',
          'short': 'Unique identifier for the Instrument Identifier token used in the transaction.',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'networkTokenBundleState',
          'type': '`\$STRING`',
        },
        <String, dynamic>{
          'name': 'securityCode',
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
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'POST',
              'orig': '/network-token-bundle',
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'scx_client_reference',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'network-token-bundle',
              ],
            },
          ],
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/network-token-bundle/{networkTokenBundleId}',
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
            },
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'GET',
              'orig': '/network-token-bundle/{networkTokenBundleId}/payment-credentials',
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
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
              'select': <String, dynamic>{
                '\$action': 'payment_credential',
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
                'payment-credentials',
              ],
            },
          ],
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
              },
              'kind': 'http',
              'method': 'DELETE',
              'orig': '/network-token-bundle/{networkTokenBundleId}',
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
              'segments': <dynamic>[
                <String, dynamic>{
                  'lit': 'network-token-bundle',
                },
                <String, dynamic>{
                  'var': 'id',
                },
              ],
              'select': <String, dynamic>{
                'exist': <dynamic>[
                  'id',
                  'scx_client_reference',
                ],
              },
              'transform': <String, dynamic>{
                'req': '`reqdata`',
                'res': '`body`',
              },
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
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

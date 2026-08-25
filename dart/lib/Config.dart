import 'feature/base/BaseFeature.dart';
import 'feature/test/TestFeature.dart';


// ignore: non_constant_identifier_names
final Map<String, BaseFeature Function()> FEATURE_CLASS = {
    'test': () => TestFeature(),

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
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
      'transport': 'base',
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
              'parts': <dynamic>[
                'network-token-bundle',
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
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
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
              'parts': <dynamic>[
                'network-token-bundle',
                '{id}',
              ],
              'rename': <String, dynamic>{
                'param': <String, dynamic>{
                  'networkTokenBundleId': 'id',
                },
              },
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

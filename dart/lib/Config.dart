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

  final Map<String, dynamic> main = <String, dynamic>{
    'name': 'BluefinNetworkToken',
  };

  final Map<String, dynamic> feature = <String, dynamic>{
        'test': <String, dynamic>{
      'options': <String, dynamic>{
        'active': false,
      },
    },

  };

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

    }
  };

  final Map<String, dynamic> entity = <String, dynamic>{
    'network_token_bundle': <String, dynamic>{
      'fields': <dynamic>[
        <String, dynamic>{
          'active': true,
          'name': 'card',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 0,
        },
        <String, dynamic>{
          'active': true,
          'name': 'cardNumber',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 1,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expirationMonth',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 2,
        },
        <String, dynamic>{
          'active': true,
          'name': 'expirationYear',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 3,
        },
        <String, dynamic>{
          'active': true,
          'name': 'issuer',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 4,
        },
        <String, dynamic>{
          'active': true,
          'name': 'metadata',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 5,
        },
        <String, dynamic>{
          'active': true,
          'name': 'networkToken',
          'req': false,
          'type': '`\$OBJECT`',
          'index\$': 6,
        },
        <String, dynamic>{
          'active': true,
          'name': 'networkTokenBundleId',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 7,
        },
        <String, dynamic>{
          'active': true,
          'name': 'networkTokenBundleState',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 8,
        },
        <String, dynamic>{
          'active': true,
          'name': 'securityCode',
          'req': false,
          'type': '`\$STRING`',
          'index\$': 9,
        },
      ],
      'name': 'network_token_bundle',
      'op': <String, dynamic>{
        'create': <String, dynamic>{
          'input': 'data',
          'name': 'create',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
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
              'index\$': 0,
            },
          ],
          'key\$': 'create',
        },
        'load': <String, dynamic>{
          'input': 'data',
          'name': 'load',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
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
              'index\$': 0,
            },
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
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
              'index\$': 1,
            },
          ],
          'key\$': 'load',
        },
        'remove': <String, dynamic>{
          'input': 'data',
          'name': 'remove',
          'points': <dynamic>[
            <String, dynamic>{
              'active': true,
              'args': <String, dynamic>{
                'header': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'header',
                    'name': 'scx_client_reference',
                    'orig': 'scx_client_reference',
                    'reqd': true,
                    'type': '`\$STRING`',
                  },
                ],
                'params': <dynamic>[
                  <String, dynamic>{
                    'active': true,
                    'kind': 'param',
                    'name': 'id',
                    'orig': 'network_token_bundle_id',
                    'reqd': true,
                    'type': '`\$STRING`',
                    'index\$': 0,
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
              'index\$': 0,
            },
          ],
          'key\$': 'remove',
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

package voxgig.bluefinnetworktokensdk.core;

import java.util.Map;

import voxgig.bluefinnetworktokensdk.utility.Json;

/** Static SDK configuration and by-name feature construction. */
@SuppressWarnings({"unchecked"})
public final class Config {

  private Config() {}

  public static Map<String, Object> makeConfig() {
    return (Map<String, Object>) Json.parse(configJson());
  }

  // SHARED CONFIG (sdkgen rung L2).
  //
  // The SDK reads the config on every request and never writes to it, so one
  // instance is shared by every client rather than rebuilt per client - the
  // difference between parsing the embedded JSON once and once per client.
  //
  // Initialization-on-demand holder: the JLS guarantees the class initializer
  // runs once, lazily, and safely under concurrency, with no locking on the
  // read path.
  private static final class SharedHolder {
    static final Map<String, Object> VALUE = makeConfig();
  }

  // The process-wide config, built once on first use.
  //
  // The returned map is SHARED: treat it as read-only. Callers that need to
  // mutate should use makeConfig, which always parses a fresh copy.
  public static Map<String, Object> sharedConfig() {
    return SharedHolder.VALUE;
  }

  public static Feature makeFeature(String name) {
    switch (name) {
      case "test":
        return new voxgig.bluefinnetworktokensdk.feature.TestFeature();
      default:
        return new voxgig.bluefinnetworktokensdk.feature.BaseFeature();
    }
  }

  private static String configJson() {
    StringBuilder b = new StringBuilder();
    b.append("{");
    b.append(" \"main\": {");
    b.append("  \"name\": \"BluefinNetworkToken\",");
    b.append("  \"slug\": \"bluefin-network-token\",");
    b.append("  \"version\": \"0.1.1\",");
    b.append("  \"target\": \"java\"");
    b.append(" },");
    b.append(" \"feature\": {");
    b.append("  \"test\": {");
    b.append("   \"options\": {");
    b.append("    \"active\": false");
    b.append("   }");
    b.append("  }");
    b.append(" },");
    b.append(" \"options\": {");
    b.append("  \"base\": \"https://secure-cert.shieldconex.com/api\",");
    b.append("  \"auth\": {");
    b.append("   \"prefix\": \"Basic\"");
    b.append("  },");
    b.append("  \"headers\": {");
    b.append("   \"content-type\": \"application/json\"");
    b.append("  },");
    b.append("  \"entity\": {");
    b.append("   \"network_token_bundle\": {}");
    b.append("  }");
    b.append(" },");
    b.append(" \"entity\": {");
    b.append("  \"network_token_bundle\": {");
    b.append("   \"fields\": [");
    b.append("    {");
    b.append("     \"name\": \"card\",");
    b.append("     \"type\": \"`$OBJECT`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"cardNumber\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"expirationMonth\",");
    b.append("     \"short\": \"Two-digit month in which the payment card expires.\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"expirationYear\",");
    b.append("     \"short\": \"Four-digit year in which the payment card expires.\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"issuer\",");
    b.append("     \"type\": \"`$OBJECT`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"metadata\",");
    b.append("     \"type\": \"`$OBJECT`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"networkToken\",");
    b.append("     \"type\": \"`$OBJECT`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"networkTokenBundleId\",");
    b.append("     \"short\": \"Unique identifier for the Instrument Identifier token used in the transaction.\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"networkTokenBundleState\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    },");
    b.append("    {");
    b.append("     \"name\": \"securityCode\",");
    b.append("     \"type\": \"`$STRING`\"");
    b.append("    }");
    b.append("   ],");
    b.append("   \"name\": \"network_token_bundle\",");
    b.append("   \"op\": {");
    b.append("    \"create\": {");
    b.append("     \"input\": \"data\",");
    b.append("     \"name\": \"create\",");
    b.append("     \"points\": [");
    b.append("      {");
    b.append("       \"args\": {");
    b.append("        \"header\": [");
    b.append("         {");
    b.append("          \"kind\": \"header\",");
    b.append("          \"name\": \"scx_client_reference\",");
    b.append("          \"orig\": \"scx_client_reference\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ]");
    b.append("       },");
    b.append("       \"kind\": \"http\",");
    b.append("       \"method\": \"POST\",");
    b.append("       \"orig\": \"/network-token-bundle\",");
    b.append("       \"parts\": [");
    b.append("        \"network-token-bundle\"");
    b.append("       ],");
    b.append("       \"select\": {");
    b.append("        \"exist\": [");
    b.append("         \"scx_client_reference\"");
    b.append("        ]");
    b.append("       },");
    b.append("       \"transform\": {");
    b.append("        \"req\": \"`reqdata`\",");
    b.append("        \"res\": \"`body`\"");
    b.append("       }");
    b.append("      }");
    b.append("     ]");
    b.append("    },");
    b.append("    \"load\": {");
    b.append("     \"input\": \"data\",");
    b.append("     \"name\": \"load\",");
    b.append("     \"points\": [");
    b.append("      {");
    b.append("       \"args\": {");
    b.append("        \"header\": [");
    b.append("         {");
    b.append("          \"kind\": \"header\",");
    b.append("          \"name\": \"scx_client_reference\",");
    b.append("          \"orig\": \"scx_client_reference\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ],");
    b.append("        \"params\": [");
    b.append("         {");
    b.append("          \"kind\": \"param\",");
    b.append("          \"name\": \"id\",");
    b.append("          \"orig\": \"network_token_bundle_id\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ]");
    b.append("       },");
    b.append("       \"kind\": \"http\",");
    b.append("       \"method\": \"GET\",");
    b.append("       \"orig\": \"/network-token-bundle/{networkTokenBundleId}\",");
    b.append("       \"parts\": [");
    b.append("        \"network-token-bundle\",");
    b.append("        \"{id}\"");
    b.append("       ],");
    b.append("       \"rename\": {");
    b.append("        \"param\": {");
    b.append("         \"networkTokenBundleId\": \"id\"");
    b.append("        }");
    b.append("       },");
    b.append("       \"select\": {");
    b.append("        \"exist\": [");
    b.append("         \"id\",");
    b.append("         \"scx_client_reference\"");
    b.append("        ]");
    b.append("       },");
    b.append("       \"transform\": {");
    b.append("        \"req\": \"`reqdata`\",");
    b.append("        \"res\": \"`body`\"");
    b.append("       }");
    b.append("      },");
    b.append("      {");
    b.append("       \"args\": {");
    b.append("        \"header\": [");
    b.append("         {");
    b.append("          \"kind\": \"header\",");
    b.append("          \"name\": \"scx_client_reference\",");
    b.append("          \"orig\": \"scx_client_reference\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ],");
    b.append("        \"params\": [");
    b.append("         {");
    b.append("          \"kind\": \"param\",");
    b.append("          \"name\": \"id\",");
    b.append("          \"orig\": \"network_token_bundle_id\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ]");
    b.append("       },");
    b.append("       \"kind\": \"http\",");
    b.append("       \"method\": \"GET\",");
    b.append("       \"orig\": \"/network-token-bundle/{networkTokenBundleId}/payment-credentials\",");
    b.append("       \"parts\": [");
    b.append("        \"network-token-bundle\",");
    b.append("        \"{id}\",");
    b.append("        \"payment-credentials\"");
    b.append("       ],");
    b.append("       \"rename\": {");
    b.append("        \"param\": {");
    b.append("         \"networkTokenBundleId\": \"id\"");
    b.append("        }");
    b.append("       },");
    b.append("       \"select\": {");
    b.append("        \"$action\": \"payment_credential\",");
    b.append("        \"exist\": [");
    b.append("         \"id\",");
    b.append("         \"scx_client_reference\"");
    b.append("        ]");
    b.append("       },");
    b.append("       \"transform\": {");
    b.append("        \"req\": \"`reqdata`\",");
    b.append("        \"res\": \"`body`\"");
    b.append("       }");
    b.append("      }");
    b.append("     ]");
    b.append("    },");
    b.append("    \"remove\": {");
    b.append("     \"input\": \"data\",");
    b.append("     \"name\": \"remove\",");
    b.append("     \"points\": [");
    b.append("      {");
    b.append("       \"args\": {");
    b.append("        \"header\": [");
    b.append("         {");
    b.append("          \"kind\": \"header\",");
    b.append("          \"name\": \"scx_client_reference\",");
    b.append("          \"orig\": \"scx_client_reference\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ],");
    b.append("        \"params\": [");
    b.append("         {");
    b.append("          \"kind\": \"param\",");
    b.append("          \"name\": \"id\",");
    b.append("          \"orig\": \"network_token_bundle_id\",");
    b.append("          \"reqd\": true,");
    b.append("          \"type\": \"`$STRING`\"");
    b.append("         }");
    b.append("        ]");
    b.append("       },");
    b.append("       \"kind\": \"http\",");
    b.append("       \"method\": \"DELETE\",");
    b.append("       \"orig\": \"/network-token-bundle/{networkTokenBundleId}\",");
    b.append("       \"parts\": [");
    b.append("        \"network-token-bundle\",");
    b.append("        \"{id}\"");
    b.append("       ],");
    b.append("       \"rename\": {");
    b.append("        \"param\": {");
    b.append("         \"networkTokenBundleId\": \"id\"");
    b.append("        }");
    b.append("       },");
    b.append("       \"select\": {");
    b.append("        \"exist\": [");
    b.append("         \"id\",");
    b.append("         \"scx_client_reference\"");
    b.append("        ]");
    b.append("       },");
    b.append("       \"transform\": {");
    b.append("        \"req\": \"`reqdata`\",");
    b.append("        \"res\": \"`body`\"");
    b.append("       }");
    b.append("      }");
    b.append("     ]");
    b.append("    }");
    b.append("   },");
    b.append("   \"relations\": {");
    b.append("    \"ancestors\": []");
    b.append("   }");
    b.append("  }");
    b.append(" }");
    b.append("}");
    return b.toString();
  }
}

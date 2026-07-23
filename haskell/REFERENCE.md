# BluefinNetworkToken Haskell SDK Reference

Complete API reference for the BluefinNetworkToken Haskell SDK.


## Client

### Constructors

```haskell
import qualified SdkClient as Sdk
import VoxgigStruct (Value (..))
import SdkHelpers (jo)

makeClient :: IO Sdk.Client
makeClient = do
  opts <- jo [("base", VStr "https://api.example.com")]
  Sdk.newSdk opts
```

Construct a live SDK client.

**Functions:**

| Function | Signature | Description |
| --- | --- | --- |
| `newSdk` | `Value -> IO Client` | Construct a client from an options map. |
| `newSdk0` | `IO Client` | Construct a client with defaults. |

**Options (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL for API requests. |
| `prefix` | `String` | URL prefix appended after base. |
| `suffix` | `String` | URL suffix appended after path. |
| `headers` | `Value` | Custom headers for all requests. |
| `feature` | `Value` | Feature configuration. |
| `system` | `Value` | System overrides (e.g. custom fetch). |


### Test constructors

```haskell
client <- Sdk.testSdk0
```

`testSdk :: Value -> Value -> IO Client` constructs a test client with mock
features active (`testSdk0 :: IO Client` for the no-argument form). Pass
`VNoval` for defaults.


### Entity accessors

#### `network_token_bundle :: Client -> Value -> IO Entity`

Construct a `NetworkTokenBundle` entity bound to the client. Pass `VNoval` for no initial options.

### HTTP escape hatches

#### `direct :: Client -> Value -> IO Value` (module `SdkFeatures`)

Make a direct HTTP request to any API endpoint. Returns a result `Value` with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `getp result "ok"`.

**Argument (map keys):**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String` | URL path with optional `{param}` placeholders. |
| `method` | `String` | HTTP method (default: `"GET"`). |
| `params` | `Value` | Path parameter values. |
| `query` | `Value` | Query string parameters. |
| `headers` | `Value` | Request headers (merged with defaults). |
| `body` | `Value` | Request body (maps are JSON-serialized). |

#### `prepare :: Client -> Value -> IO Value` (module `SdkFeatures`)

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## NetworkTokenBundle

```haskell
  ent <- Sdk.network_token_bundle sdk VNoval
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Value` | No |  |
| `card_number` | `String` | No |  |
| `expiration_month` | `String` | No |  |
| `expiration_year` | `String` | No |  |
| `issuer` | `Value` | No |  |
| `metadata` | `Value` | No |  |
| `network_token` | `Value` | No |  |
| `network_token_bundle_id` | `String` | No |  |
| `network_token_bundle_state` | `String` | No |  |
| `security_code` | `String` | No |  |

### Operations

#### `eCreate ent data ctrl :: IO Value`

Create a new entity with the given data. Returns the created entity data and raises on error.

```haskell
  ent <- Sdk.network_token_bundle sdk VNoval
  d <- jo
    []
  ctrl <- emptyMap
  result <- Sdk.eCreate ent d ctrl
```

#### `eLoad ent match ctrl :: IO Value`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```haskell
  ent <- Sdk.network_token_bundle sdk VNoval
  match <- jo [("id", VStr "network_token_bundle_id")]
  ctrl <- emptyMap
  result <- Sdk.eLoad ent match ctrl
```

#### `eRemove ent match ctrl :: IO Value`

Remove the entity matching the given criteria. Raises on error.

```haskell
  ent <- Sdk.network_token_bundle sdk VNoval
  match <- jo [("id", VStr "network_token_bundle_id")]
  ctrl <- emptyMap
  result <- Sdk.eRemove ent match ctrl
```

### Common Fields

#### `eDataGet :: IO Value`

Get the entity data.

#### `eDataSet :: Value -> IO ()`

Set the entity data.

#### `eStream :: String -> Value -> Value -> IO [Value]`

Run an operation as a lazy stream of result items.

#### `eMake :: IO Entity`

Create a new `NetworkTokenBundle` entity with the same options.

#### `eName :: String`

The entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```haskell
  active <- jo [("active", VBool True)]
  featureCfg <- jo
    [ ("test", active)
    ]
  opts <- jo [("feature", featureCfg)]
  client <- Sdk.newSdk opts
```


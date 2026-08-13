# BluefinNetworkToken C# SDK Reference

Complete API reference for the BluefinNetworkToken C# SDK.


## BluefinNetworkTokenSDK

### Constructor

```csharp
using BluefinNetworkTokenSdk;

var client = new BluefinNetworkTokenSDK(options);
```

Create a new SDK client instance. `options` is a
`Dictionary<string, object?>`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Dictionary` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `Dictionary` | Custom headers for all requests. |
| `options["feature"]` | `Dictionary` | Feature configuration. |
| `options["system"]` | `Dictionary` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinNetworkTokenSDK.TestSDK(testopts = null, sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```csharp
var client = BluefinNetworkTokenSDK.TestSDK(null, null);
```


### Instance Methods

#### `NetworkTokenBundle(entopts = null)`

Create a new `NetworkTokenBundle` entity instance (returns
`BluefinNetworkTokenEntityBase`). Pass `null` for no initial options.

#### `OptionsMap() -> Dictionary`

Return a deep copy of the current SDK options.

#### `GetUtility() -> Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs = null) -> Dictionary`

Make a direct HTTP request to any API endpoint. Returns a result
`Dictionary<string, object?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Dictionary` | Path parameter values. |
| `fetchargs["query"]` | `Dictionary` | Query string parameters. |
| `fetchargs["headers"]` | `Dictionary` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `object?` | Request body (dictionaries are JSON-serialized). |

**Returns:** `Dictionary<string, object?>`

#### `Prepare(fetchargs = null) -> Dictionary`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## NetworkTokenBundle

```csharp
var networkTokenBundle = client.NetworkTokenBundle();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Dictionary<string, object?>` | No |  |
| `cardNumber` | `string` | No |  |
| `expirationMonth` | `string` | No |  |
| `expirationYear` | `string` | No |  |
| `issuer` | `Dictionary<string, object?>` | No |  |
| `metadata` | `Dictionary<string, object?>` | No |  |
| `networkToken` | `Dictionary<string, object?>` | No |  |
| `networkTokenBundleId` | `string` | No |  |
| `networkTokenBundleState` | `string` | No |  |
| `securityCode` | `string` | No |  |

### Operations

#### `Create(reqdata, ctrl = null) -> object?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```csharp
var result = client.NetworkTokenBundle().Create(new Dictionary<string, object?>
{
});
```

#### `Load(reqmatch, ctrl = null) -> object?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```csharp
var result = client.NetworkTokenBundle().Load(new Dictionary<string, object?> { ["id"] = "network_token_bundle_id" });
```

#### `Remove(reqmatch, ctrl = null) -> object?`

Remove the entity matching the given criteria. Raises on error.

```csharp
var result = client.NetworkTokenBundle().Remove(new Dictionary<string, object?> { ["id"] = "network_token_bundle_id" });
```

### Common Methods

#### `Data(newdata = null) -> object?`

Get or set the entity data.

#### `Match(newmatch = null) -> object?`

Get or set the entity match criteria.

#### `Make() -> IEntity`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `GetName() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```csharp
var client = new BluefinNetworkTokenSDK(new Dictionary<string, object?>
{
    ["feature"] = new Dictionary<string, object?>
    {
        ["test"] = new Dictionary<string, object?> { ["active"] = true },
    },
});
```


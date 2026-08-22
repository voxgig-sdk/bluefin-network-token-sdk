# BluefinNetworkToken Scala SDK Reference

Complete API reference for the BluefinNetworkToken Scala SDK.


## BluefinNetworkTokenSDK

### Constructor

```scala
val client = new BluefinNetworkTokenSDK(options)
```

Create a new SDK client instance. `options` is a `java.util.Map[String, Object]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Map` | Custom headers for all requests. |
| `options["feature"]` | `Map` | Feature configuration. |
| `options["system"]` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinNetworkTokenSDK.testSDK(testopts, sdkopts)`

Create a test client with mock features active. Both arguments may be `null`.

```scala
val client = BluefinNetworkTokenSDK.testSDK(null, null)
```


### Instance Methods

#### `networkTokenBundle(entopts)`

Create a new `NetworkTokenBundle` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> Map`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> Map`

Make a direct HTTP request to any API endpoint. Returns a result
`java.util.Map[String, Object]` with `ok`, `status`, `headers`, and
`data` (or `err` on failure). This escape hatch never raises — branch on
`result.get("ok")`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Object` | Request body (maps are JSON-serialized). |

**Returns:** `java.util.Map[String, Object]`

#### `prepare(fetchargs) -> Map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## NetworkTokenBundle

```scala
val networkTokenBundle = client.networkTokenBundle(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `java.util.Map[String, Object]` | No |  |
| `cardNumber` | `String` | No |  |
| `expirationMonth` | `String` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `String` | No | Four-digit year in which the payment card expires. |
| `issuer` | `java.util.Map[String, Object]` | No |  |
| `metadata` | `java.util.Map[String, Object]` | No |  |
| `networkToken` | `java.util.Map[String, Object]` | No |  |
| `networkTokenBundleId` | `String` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `String` | No |  |
| `securityCode` | `String` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Object`

Create a new entity with the given data. Returns the created entity data and raises on error.

```scala
val result = client.networkTokenBundle(null).create(java.util.Map.of(
), null)
```

#### `load(reqmatch, ctrl) -> Object`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```scala
val result = client.networkTokenBundle(null).load(java.util.Map.of("id", "network_token_bundle_id"), null)
```

#### `remove(reqmatch, ctrl) -> Object`

Remove the entity matching the given criteria. Raises on error.

```scala
val result = client.networkTokenBundle(null).remove(java.util.Map.of("id", "network_token_bundle_id"), null)
```

### Common Methods

#### `data(newdata*) -> Object`

Get or set the entity data.

#### `matchArgs(newmatch*) -> Object`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `getName() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```scala
val feature = new java.util.LinkedHashMap[String, Object]()
feature.put("test", java.util.Map.of("active", true))
val options = new java.util.LinkedHashMap[String, Object]()
options.put("feature", feature)
val client = new BluefinNetworkTokenSDK(options)
```


# BluefinNetworkToken Kotlin SDK Reference

Complete API reference for the BluefinNetworkToken Kotlin SDK.


## BluefinNetworkTokenSDK

### Constructor

```kotlin
val client = BluefinNetworkTokenSDK(options)
```

Create a new SDK client instance. `options` is a `MutableMap<String, Any?>`.

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

```kotlin
val client = BluefinNetworkTokenSDK.testSDK(null, null)
```


### Instance Methods

#### `networkTokenBundle(entopts)`

Create a new `NetworkTokenBundle` entity instance (returns `SdkEntity`). Pass
`null` for no initial options.

#### `optionsMap() -> MutableMap`

Return a deep copy of the current SDK options.

#### `getUtility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> MutableMap`

Make a direct HTTP request to any API endpoint. Returns a result
`MutableMap<String, Any?>` with `ok`, `status`, `headers`, and `data`
(or `err` on failure). This escape hatch never raises — branch on
`result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Map` | Path parameter values. |
| `fetchargs["query"]` | `Map` | Query string parameters. |
| `fetchargs["headers"]` | `Map` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `Any?` | Request body (maps are JSON-serialized). |

**Returns:** `MutableMap<String, Any?>`

#### `prepare(fetchargs) -> MutableMap`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## NetworkTokenBundle

```kotlin
val networkTokenBundle = client.networkTokenBundle(null)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Map<String, Any?>?` | No |  |
| `card_number` | `String?` | No |  |
| `expiration_month` | `String?` | No |  |
| `expiration_year` | `String?` | No |  |
| `issuer` | `Map<String, Any?>?` | No |  |
| `metadata` | `Map<String, Any?>?` | No |  |
| `network_token` | `Map<String, Any?>?` | No |  |
| `network_token_bundle_id` | `String?` | No |  |
| `network_token_bundle_state` | `String?` | No |  |
| `security_code` | `String?` | No |  |

### Operations

#### `create(reqdata, ctrl) -> Any?`

Create a new entity with the given data. Returns the created entity data and raises on error.

```kotlin
val result = client.networkTokenBundle(null).create(mutableMapOf<String, Any?>(
), null)
```

#### `load(reqmatch, ctrl) -> Any?`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```kotlin
val result = client.networkTokenBundle(null).load(mutableMapOf<String, Any?>("id" to "network_token_bundle_id"), null)
```

#### `remove(reqmatch, ctrl) -> Any?`

Remove the entity matching the given criteria. Raises on error.

```kotlin
val result = client.networkTokenBundle(null).remove(mutableMapOf<String, Any?>("id" to "network_token_bundle_id"), null)
```

### Common Methods

#### `data(vararg newdata) -> Any?`

Get or set the entity data.

#### `match(vararg newmatch) -> Any?`

Get or set the entity match criteria.

#### `make() -> Entity`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `name -> String`

The entity name (read-only property).


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```kotlin
val feature = mutableMapOf<String, Any?>(
    "test" to mapOf("active" to true),
)
val client = BluefinNetworkTokenSDK(mutableMapOf<String, Any?>("feature" to feature))
```


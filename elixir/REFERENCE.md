# BluefinNetworkToken Elixir SDK Reference

Complete API reference for the BluefinNetworkToken Elixir SDK.


## BluefinNetworkToken

### Constructor

```elixir
sdk = BluefinNetworkToken.new(options)
```

Create a new SDK client. `options` is a struct value node — build one from a
native map with `BluefinNetworkToken.Helpers.deep/1`.

**Options:**

| Name | Type | Description |
| --- | --- | --- |
| `apikey` | `String.t()` | API key for authentication. |
| `base` | `String.t()` | Base URL for API requests. |
| `prefix` | `String.t()` | URL prefix appended after base. |
| `suffix` | `String.t()` | URL suffix appended after path. |
| `headers` | `map()` | Custom headers for all requests. |
| `feature` | `map()` | Feature configuration. |
| `system` | `map()` | System overrides (e.g. custom fetch). |


### Constructors

#### `BluefinNetworkToken.test(testopts \\ nil, sdkopts \\ nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```elixir
sdk = BluefinNetworkToken.test()
```


### Functions

#### `BluefinNetworkToken.network_token_bundle(client, entopts \\ nil)`

Create a `BluefinNetworkToken.Entity.NetworkTokenBundle` handle.

#### `options_map(client) :: map()`

Return a deep copy of the current SDK options.

#### `get_utility(client) :: map()`

Return the SDK utility node.

#### `direct(client, fetchargs) :: map()`

Make a direct HTTP request to any API endpoint. Returns a result node with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never raises — branch on `Voxgig.Struct.getprop(result, "ok")`.

**fetchargs keys:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `String.t()` | URL path with optional `{param}` placeholders. |
| `method` | `String.t()` | HTTP method (default: `"GET"`). |
| `params` | `map()` | Path parameter values. |
| `query` | `map()` | Query string parameters. |
| `headers` | `map()` | Request headers (merged with defaults). |
| `body` | `any()` | Request body (maps are JSON-serialized). |

#### `prepare(client, fetchargs) :: map()`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises
on error.


---

## BluefinNetworkToken.Entity.NetworkTokenBundle

```elixir
network_token_bundle = BluefinNetworkToken.network_token_bundle(sdk)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `map()` | No |  |
| `cardNumber` | `String.t()` | No |  |
| `expirationMonth` | `String.t()` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `String.t()` | No | Four-digit year in which the payment card expires. |
| `id` | `String.t()` | No |  |
| `issuer` | `map()` | No |  |
| `metadata` | `map()` | No |  |
| `networkToken` | `map()` | No |  |
| `networkTokenBundleId` | `String.t()` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `String.t()` | No |  |
| `securityCode` | `String.t()` | No |  |

### Operations

#### `create(entity, reqdata, ctrl \\ nil) :: map()`

Create a new entity with the given data. Returns the created entity data and raises on error.

```elixir
record = BluefinNetworkToken.Entity.NetworkTokenBundle.create(network_token_bundle, BluefinNetworkToken.Helpers.deep(%{
}))
```

#### `load(entity, reqmatch, ctrl \\ nil) :: map()`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```elixir
record = BluefinNetworkToken.Entity.NetworkTokenBundle.load(network_token_bundle, BluefinNetworkToken.Helpers.deep(%{"id" => "network_token_bundle_id"}))
```

#### `remove(entity, reqmatch, ctrl \\ nil) :: map()`

Remove the entity matching the given criteria. Raises on error.

```elixir
record = BluefinNetworkToken.Entity.NetworkTokenBundle.remove(network_token_bundle, BluefinNetworkToken.Helpers.deep(%{"id" => "network_token_bundle_id"}))
```

### Common Functions

#### `data_get(entity) :: map()`

Get the entity data.

#### `data_set(entity, data)`

Set the entity data.

#### `match_get(entity) :: map()`

Get the entity match criteria.

#### `match_set(entity, match)`

Set the entity match criteria.

#### `make(entity) :: entity`

Create a new `BluefinNetworkToken.Entity.NetworkTokenBundle` handle with the same options.

#### `get_name(entity) :: String.t()`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```elixir
sdk = BluefinNetworkToken.new(BluefinNetworkToken.Helpers.deep(%{
  "feature" => %{
    "test" => %{"active" => true},
  }
}))
```


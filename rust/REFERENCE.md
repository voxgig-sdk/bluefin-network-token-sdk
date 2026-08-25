# BluefinNetworkToken Rust SDK Reference

Complete API reference for the BluefinNetworkToken Rust SDK.


## BluefinNetworkTokenSDK

### Constructor

```rust
use bluefin_network_token_sdk::{BluefinNetworkTokenSDK, Value};

let client = BluefinNetworkTokenSDK::new(options);
```

Create a new SDK client instance. `options` is a `Value` map
(`Value::Noval` for none).

**Parameters:**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Static Functions

#### `test_sdk(testopts: Value, sdkopts: Value) -> Rc<BluefinNetworkTokenSDK>`

Create a test client with mock features active. Both arguments may be
`Value::Noval`.

```rust
use bluefin_network_token_sdk::{test_sdk, Value};

let client = test_sdk(Value::Noval, Value::Noval);
```


### Instance Methods

#### `network_token_bundle(entopts: Value) -> Rc<NetworkTokenBundleEntity>`

Create a new `NetworkTokenBundleEntity` instance. Pass `Value::Noval` for no
initial options.

#### `options_map() -> Value`

Return a deep copy of the current SDK options.

#### `get_utility() -> Rc<Utility>`

Return a copy of the SDK utility object.

#### `direct(fetchargs: Value) -> Result<Value, BluefinNetworkTokenError>`

Make a direct HTTP request to any API endpoint. `Ok` is a result `Value::Map`
with `ok`, `status`, `headers`, and `data` (or `err` on failure). This
escape hatch resolves to `Ok` even on a non-2xx response — branch on
`getp(&result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `prepare(fetchargs: Value) -> Result<Value, BluefinNetworkTokenError>`

Prepare a fetch definition without sending. Returns the fetchdef on `Ok`.


---

## NetworkTokenBundleEntity

```rust
let network_token_bundle = client.network_token_bundle(Value::Noval);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `std::collections::HashMap<String, Value>` | No |  |
| `cardNumber` | `String` | No |  |
| `expirationMonth` | `String` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `String` | No | Four-digit year in which the payment card expires. |
| `id` | `String` | No |  |
| `issuer` | `std::collections::HashMap<String, Value>` | No |  |
| `metadata` | `std::collections::HashMap<String, Value>` | No |  |
| `networkToken` | `std::collections::HashMap<String, Value>` | No |  |
| `networkTokenBundleId` | `String` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `String` | No |  |
| `securityCode` | `String` | No |  |

### Operations

#### `create(reqdata: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>`

Create a new entity with the given data. Returns the created entity data on `Ok` and `Err` on failure.

```rust
let result = client.network_token_bundle(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```

#### `load(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>`

Load a single entity matching the given criteria. Returns the entity data on `Ok` and `Err` on failure.

```rust
let result = client.network_token_bundle(Value::Noval).load(jo(vec![("id", Value::str("network_token_bundle_id"))]), Value::Noval).unwrap();
```

#### `remove(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>`

Remove the entity matching the given criteria. `Err` on failure.

```rust
let result = client.network_token_bundle(Value::Noval).remove(jo(vec![("id", Value::str("network_token_bundle_id"))]), Value::Noval).unwrap();
```

### Common Methods

#### `data(args: Option<&Value>) -> Value`

Get the entity data. Pass `Some(&map)` to set it.

#### `matchv(args: Option<&Value>) -> Value`

Get the entity match criteria. Pass `Some(&map)` to set it.

#### `make() -> Rc<dyn Entity>`

Create a new `NetworkTokenBundleEntity` instance with the same options.

#### `get_name() -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```rust
let client = BluefinNetworkTokenSDK::new(jo(vec![
    ("feature", jo(vec![
        ("test", jo(vec![("active", Value::Bool(true))])),
    ])),
]));
```


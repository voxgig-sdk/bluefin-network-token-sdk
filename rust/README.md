# BluefinNetworkToken Rust SDK



The Rust SDK for the BluefinNetworkToken API — an entity-oriented client following idiomatic Rust conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.network_token_bundle(Value::Noval)` — each
carrying a small, uniform set of operations (`load`, `create`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This crate is not yet published to crates.io. Depend on it from the GitHub
release tag (`rust/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-network-token-sdk/releases)) or
from a source checkout by adding it to your `Cargo.toml`:

```toml
[dependencies]
# From a source checkout:
voxgig-bluefin-network-token-sdk = { path = "../rust" }

# Or from the git release tag:
# voxgig-bluefin-network-token-sdk = { git = "<repo-url>", tag = "rust/vX.Y.Z" }
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```rust
use bluefin_network_token_sdk::{getp, jo, BluefinNetworkTokenSDK, Value};

let client = BluefinNetworkTokenSDK::new(jo(vec![
    ("apikey", Value::str(std::env::var("BLUEFIN_NETWORK_TOKEN_APIKEY").unwrap_or_default())),
]));
```

### 3. Load a networktokenbundle

`load()` returns the bare record and returns `Err` on failure.

```rust
match client.network_token_bundle(Value::Noval).load(jo(vec![("id", Value::str("example_id"))]), Value::Noval) {
    Ok(network_token_bundle) => println!("{:?}", network_token_bundle),
    Err(err) => eprintln!("load failed: {}", err),
}
```

### 4. Create, update, and remove

```rust
// Create — returns the bare created record
let created = client.network_token_bundle(Value::Noval).create(jo(vec![("card", Value::empty_map()), ("cardNumber", Value::str("example_cardNumber"))]), Value::Noval).unwrap();

// Remove
client.network_token_bundle(Value::Noval).remove(jo(vec![("id", Value::str("example_id"))]), Value::Noval).unwrap();
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const networktokenbundle = await client.NetworkTokenBundle().load({ id: "example_id" })
  console.log(networktokenbundle)
} catch (err) {
  console.error('load failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```rust
let result = client.direct(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("GET")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

if getp(&result, "ok") == Value::Bool(true) {
    println!("{:?}", getp(&result, "status"));  // 200
    println!("{:?}", getp(&result, "data"));    // response body
} else {
    // A non-2xx response carries status + data (the error body); a
    // transport-level failure carries err instead. Only one is present.
    println!("{:?} {:?}", getp(&result, "status"), getp(&result, "err"));
}
```

### Prepare a request without sending it

```rust
// prepare() returns the fetch definition on Ok and Err on failure.
let fetchdef = client.prepare(jo(vec![
    ("path", Value::str("/api/resource/{id}")),
    ("method", Value::str("DELETE")),
    ("params", jo(vec![("id", Value::str("example"))])),
])).unwrap();

println!("{:?}", getp(&fetchdef, "url"));
println!("{:?}", getp(&fetchdef, "method"));
println!("{:?}", getp(&fetchdef, "headers"));
```

### Use test mode

Create a mock client for unit testing — no server required:

```rust
let client = test_sdk(Value::Noval, Value::Noval);

// Entity ops return the bare record on Ok and Err on failure.
let network_token_bundle = client.network_token_bundle(Value::Noval).load(jo(vec![("id", Value::str("test01"))]), Value::Noval).unwrap();
// network_token_bundle contains the mock response record
```

### Point at a different server

Override the base URL to reach a local or staging server:

```rust
let client = BluefinNetworkTokenSDK::new(jo(vec![
    ("base", Value::str("http://localhost:8080")),
]));
```

### Run live tests

Create a `.env.local` file at the crate root:

```
BLUEFIN_NETWORK_TOKEN_TEST_LIVE=TRUE
BLUEFIN_NETWORK_TOKEN_APIKEY=<your-key>
```

Then run:

```bash
cd rust && cargo test
```


## Reference

### BluefinNetworkTokenSDK

```rust
use bluefin_network_token_sdk::{BluefinNetworkTokenSDK, Value};

let client = BluefinNetworkTokenSDK::new(options);
```

Creates a new SDK client. `options` is a `Value` map (`Value::Noval` for
none) carrying any of the following keys:

| Option | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `system` | `map` | System overrides (e.g. a custom fetcher). |

### test_sdk

```rust
use bluefin_network_token_sdk::{test_sdk, Value};

let client = test_sdk(testopts, sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be
`Value::Noval`.

### BluefinNetworkTokenSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Value` | Deep copy of the current SDK options. |
| `get_utility` | `() -> Rc<Utility>` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs: Value) -> Result<Value, BluefinNetworkTokenError>` | Build an HTTP request definition without sending. |
| `direct` | `(fetchargs: Value) -> Result<Value, BluefinNetworkTokenError>` | Build and send an HTTP request. `Ok` is a result map (branch on `ok`). |
| `network_token_bundle` | `(entopts: Value) -> Rc<NetworkTokenBundleEntity>` | Create a NetworkTokenBundle entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>` | Load a single entity by match criteria. |
| `create` | `(reqdata: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>` | Create a new entity. |
| `remove` | `(reqmatch: Value, ctrl: Value) -> Result<Value, BluefinNetworkTokenError>` | Remove an entity. |
| `data` | `(args: Option<&Value>) -> Value` | Get entity data (pass `Some(&map)` to set). |
| `matchv` | `(args: Option<&Value>) -> Value` | Get entity match criteria (pass `Some(&map)` to set). |
| `make` | `() -> Rc<dyn Entity>` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return `Result<Value, BluefinNetworkTokenError>` — the
bare result data on `Ok` (a `Value::Map` for single-entity ops, a
`Value::List` for `list`) and the branded error on `Err`.

The `direct()` escape hatch resolves to `Ok` even on a non-2xx response —
it returns a result `Value::Map` you branch on via `getp(&result, "ok")`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `number` | HTTP status code. |
| `headers` | `map` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `false` and `err` carries the error value.

### Entities

#### NetworkTokenBundle

| Field | Description |
| --- | --- |
| `card` |  |
| `cardNumber` |  |
| `expirationMonth` | Two-digit month in which the payment card expires. |
| `expirationYear` | Four-digit year in which the payment card expires. |
| `issuer` |  |
| `metadata` |  |
| `networkToken` |  |
| `networkTokenBundleId` | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` |  |
| `securityCode` |  |

Operations: Create, Load, Remove.

API path: `/network-token-bundle`



## Entities


### NetworkTokenBundle

Create an instance: `let network_token_bundle = client.network_token_bundle(Value::Noval);`

#### Operations

| Method | Description |
| --- | --- |
| `create(reqdata, ctrl)` | Create a new entity with the given data. |
| `load(reqmatch, ctrl)` | Load a single entity by match criteria. |
| `remove(reqmatch, ctrl)` | Remove the matching entity. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `std::collections::HashMap<String, Value>` |  |
| `cardNumber` | `String` |  |
| `expirationMonth` | `String` | Two-digit month in which the payment card expires. |
| `expirationYear` | `String` | Four-digit year in which the payment card expires. |
| `issuer` | `std::collections::HashMap<String, Value>` |  |
| `metadata` | `std::collections::HashMap<String, Value>` |  |
| `networkToken` | `std::collections::HashMap<String, Value>` |  |
| `networkTokenBundleId` | `String` | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `String` |  |
| `securityCode` | `String` |  |

#### Example: Load

```rust
let network_token_bundle = client.network_token_bundle(Value::Noval).load(jo(vec![("id", Value::str("network_token_bundle_id"))]), Value::Noval).unwrap();
```

#### Example: Create

```rust
let network_token_bundle = client.network_token_bundle(Value::Noval).create(jo(vec![
]), Value::Noval).unwrap();
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `Value`

The Rust SDK uses a single dynamic `Value` type throughout rather than a
typed struct per entity. `Value` is the vendored voxgig struct port (a
JSON-shaped enum: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Crate structure

```
rust/
├── lib.rs                       -- Crate root (module decls + re-exports)
├── core/                        -- Pipeline types, config, client (sdk.rs)
├── entity/                      -- Per-entity clients (one module each)
├── feature/                     -- Built-in features (base, test, log)
└── utility/                     -- Utilities + the vendored voxgig struct port
```

The public API is re-exported from the crate root, so `use bluefin_network_token_sdk::{...}`
reaches the SDK client, `Value`, and the `jo` / `ja` / `getp` helpers
directly. Import entity or utility modules only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const networktokenbundle = client.NetworkTokenBundle()
await networktokenbundle.load({ id: "example_id" })

// networktokenbundle.data() now returns the networktokenbundle data from the last `load`
// networktokenbundle.match() returns { id: "example_id" }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.

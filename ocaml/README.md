# BluefinNetworkToken OCaml SDK



The OCaml SDK for the BluefinNetworkToken API — an entity-oriented client
following idiomatic OCaml conventions (a dependency-free library that compiles
with the stock `ocamlc`).

The SDK exposes the API as capitalised, semantic **Entities** — for example `Sdk_client.network_token_bundle client Noval` — each
carrying a small, uniform set of operations (`load`, `create`, `remove`) instead of raw URL
paths and query strings. You work with named resources and verbs, which
keeps the cognitive load low.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to the opam registry. Install it from the
GitHub release tag (`ocaml/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/bluefin-network-token-sdk/releases))
or from a source checkout. The SDK is dependency-free and compiles with the
stock `ocamlc` — no opam packages, no dune:

```bash
cd ocaml && make build
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make (jo [("apikey", Str (Sys.getenv "BLUEFIN_NETWORK_TOKEN_APIKEY"))])
```

### 3. Load a network_token_bundle

`e_load` resolves to the ENTITY and raises on error; `e_data_get` gives the
record.

```ocaml
(try
   let network_token_bundle = (Sdk_client.network_token_bundle client Noval).e_load (jo [("id", (Str "example_id"))]) Noval in
   print_endline (stringify (network_token_bundle.e_data_get ()))
 with Sdk_error.E err -> Printf.eprintf "load failed: %s\n" (Sdk_error.message err))
```

### 4. Create, update, and remove

```ocaml
(* Create — resolves to the ENTITY; e_data_get gives the record *)
let created = (Sdk_client.network_token_bundle client Noval).e_create (jo [("card", (empty_map ())); ("cardNumber", (Str "example_cardNumber"))]) Noval in
print_endline (stringify (created.e_data_get ()));

(* Remove — resolves to the entity, marked deleted; it keeps its data *)
let removed = (Sdk_client.network_token_bundle client Noval).e_remove (jo [("id", (getp created "id"))]) Noval in
Printf.printf "deleted: %b\n" removed.e_deleted
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

```ocaml
let result = Sdk_client.direct client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "GET");
    ("params", jo [("id", Str "example")]);
]) in
(match getp result "ok" with
 | Bool true ->
   print_endline (stringify (getp result "status"));  (* 200 *)
   print_endline (stringify (getp result "data"))      (* response body *)
 | _ ->
   (* A non-2xx response carries status + data (the error body); a transport
      failure carries err instead. Read whichever is present. *)
   print_endline (stringify (getp result "status"));
   print_endline (stringify (getp result "err")))
```

### Prepare a request without sending it

```ocaml
(* prepare returns the fetch definition and raises on error. *)
let fetchdef = Sdk_client.prepare client (jo [
    ("path", Str "/api/resource/{id}");
    ("method", Str "DELETE");
    ("params", jo [("id", Str "example")]);
]) in
print_endline (stringify (getp fetchdef "url"));
print_endline (stringify (getp fetchdef "method"));
print_endline (stringify (getp fetchdef "headers"))
```

### Use test mode

Create a mock client for unit testing — no server required:

```ocaml
let () =
  let client = Sdk_client.test () in
  (* Entity ops resolve to the ENTITY and raise on error. *)
  let network_token_bundle = (Sdk_client.network_token_bundle client Noval).e_load (jo [("id", Str "test01")]) Noval in
  print_endline (stringify (network_token_bundle.e_data_get ()))  (* the mock response record *)
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ocaml
let mock_fetch = Func (fun _ _args _ _ ->
    jo [("status", Num 200.); ("statusText", Str "OK"); ("headers", empty_map ());
        ("json", json_thunk (jo [("id", Str "mock01")]))]) in
let client = Sdk_client.make (jo [
    ("base", Str "http://localhost:8080");
    ("system", jo [("fetch", mock_fetch)]);
]) in
ignore client
```

### Run live tests

Create a `.env.local` file at the project root:

```
BLUEFIN_NETWORK_TOKEN_TEST_LIVE=TRUE
BLUEFIN_NETWORK_TOKEN_APIKEY=<your-key>
```

Then run:

```bash
cd ocaml && make test
```


## Reference

### Sdk_client

```ocaml
open Voxgig_struct
open Sdk_helpers

let client = Sdk_client.make options
```

Creates a new SDK client from a `value` options map. Use `Sdk_client.make0 ()`
for defaults.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `map` | Feature activation flags. |
| `extend` | `list` | Additional feature instances to load. |
| `system` | `map` | System overrides (e.g. custom `fetch` function). |

### Sdk_client.test

```ocaml
let client = Sdk_client.test_with testopts sdkopts
```

Creates a test-mode client with mock transport. Both arguments may be `Noval`
(`Sdk_client.test ()` uses defaults).

### Sdk_client functions

| Function | Signature | Description |
| --- | --- | --- |
| `make` | `value -> sdk_client` | Construct a client from options. |
| `make0` | `unit -> sdk_client` | Construct a client with defaults. |
| `prepare` | `sdk_client -> value -> value` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `sdk_client -> value -> value` | Build and send an HTTP request. Returns a result map (branch on `ok`). |
| `network_token_bundle` | `sdk_client -> value -> entity_obj` | A NetworkTokenBundle entity accessor. |

### Entity interface

All entities are `entity_obj` records sharing the same fields.

| Field | Signature | Description |
| --- | --- | --- |
| `e_load` | `value -> value -> entity_obj` | Load a single entity by match criteria. Resolves to the entity. Raises on error. |
| `e_create` | `value -> value -> entity_obj` | Create a new entity. Resolves to the entity. Raises on error. |
| `e_remove` | `value -> value -> entity_obj` | Remove an entity. Resolves to the entity, marked deleted. Raises on error. |
| `e_data_get` | `unit -> value` | Get entity data. |
| `e_data_set` | `value -> unit` | Set entity data. |
| `e_match_get` | `unit -> value` | Get entity match criteria. |
| `e_match_set` | `value -> unit` | Set entity match criteria. |
| `e_make` | `unit -> entity_obj` | Create a new instance with the same options. |
| `e_name` | `string` | The entity name. |

### Result shape

Entity operations resolve to the ENTITY, not the raw record — `e_list` to
one entity per record — and raise `Sdk_error.E` on error. The record is
reached through `e_data_get`, which returns the entity's data container.
`e_remove` resolves to the entity marked deleted (`e_deleted`); it keeps the
data it held. Wrap calls in `try`/`with` to handle failures.

The `direct` escape hatch never raises — it returns a result `value` map
you branch on via `getp result "ok"`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Bool` | `Bool true` if the HTTP status is 2xx. |
| `status` | `Num` | HTTP status code. |
| `headers` | `Map` | Response headers. |
| `data` | `value` | Parsed JSON response body. |

On error, `ok` is `Bool false` and `err` carries the error value.

### Entities

#### NetworkTokenBundle

| Field | Description |
| --- | --- |
| `card` |  |
| `cardNumber` |  |
| `expirationMonth` | Two-digit month in which the payment card expires. |
| `expirationYear` | Four-digit year in which the payment card expires. |
| `id` |  |
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

Create an instance: `let network_token_bundle = Sdk_client.network_token_bundle client Noval`

#### Operations

| Method | Description |
| --- | --- |
| `e_create reqdata ctrl` | Create a new entity with the given data. Resolves to the entity. |
| `e_load reqmatch ctrl` | Load a single entity by match criteria. Resolves to the entity. |
| `e_remove reqmatch ctrl` | Remove the matching entity. Resolves to the entity, marked deleted. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `card` | `value map` |  |
| `cardNumber` | `string` |  |
| `expirationMonth` | `string` | Two-digit month in which the payment card expires. |
| `expirationYear` | `string` | Four-digit year in which the payment card expires. |
| `id` | `string` |  |
| `issuer` | `value map` |  |
| `metadata` | `value map` |  |
| `networkToken` | `value map` |  |
| `networkTokenBundleId` | `string` | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `string` |  |
| `securityCode` | `string` |  |

#### Example: Load

```ocaml
(* The op resolves to the ENTITY; the record is inside it. *)
let network_token_bundle = (Sdk_client.network_token_bundle client Noval).e_load (jo [("id", (Str "network_token_bundle_id"))]) Noval
let network_token_bundle_data = network_token_bundle.e_data_get ()
```

#### Example: Create

```ocaml
let network_token_bundle = (Sdk_client.network_token_bundle client Noval).e_create (jo [
]) Noval
let network_token_bundle_data = network_token_bundle.e_data_get ()
```

## Features

This SDK ships 12 optional features. Each is **inactive until you
switch it on**, so an SDK you have not configured behaves exactly as if none of
them existed — no retries, no cache, no logging, no measurable overhead.

Activate a feature by name in the client options, alongside the options shown
above:

| Feature | What it does |
|---|---|
| [`audit`](#audit) | Audit trail |
| [`clienttrack`](#clienttrack) | Client tracking |
| [`debug`](#debug) | Debug capture |
| [`idempotency`](#idempotency) | Idempotency |
| [`log`](#log) | Logging |
| [`metrics`](#metrics) | Metrics |
| [`paging`](#paging) | Paging |
| [`ratelimit`](#ratelimit) | Rate limiting |
| [`retry`](#retry) | Retry |
| [`telemetry`](#telemetry) | Telemetry |
| [`test`](#test) | Test transport |
| [`timeout`](#timeout) | Timeout |

> **Order matters for `ratelimit`, `retry`, `timeout`.** These wrap the
> transport, so each one wraps whatever is already installed: the order you
> activate them in IS the nesting order. Activating them as an ordered list
> rather than a map is what fixes that order.

### audit

Audit trail.

| Option | Default |
|---|---|
| `active` | `false` |
| `actor` | `'anonymous'` |
| `max` | `1000` |

Set `feature.audit.active` to enable it, then override any of the options above.

### clienttrack

Client tracking.

| Option | Default |
|---|---|
| `active` | `false` |
| `clientVersion` | `'0.0.1'` |

Set `feature.clienttrack.active` to enable it, then override any of the options above.

### debug

Debug capture.

| Option | Default |
|---|---|
| `active` | `false` |
| `max` | `100` |
| `redact` | `['authorization', 'cookie', 'set-cookie', 'api-key', 'apikey', 'x-api-key', 'idempotency-key']` |

Set `feature.debug.active` to enable it, then override any of the options above.

### idempotency

Idempotency.

| Option | Default |
|---|---|
| `active` | `false` |
| `header` | `'Idempotency-Key'` |
| `methods` | `['POST', 'PUT', 'PATCH', 'DELETE']` |
| `ops` | `['create', 'update', 'remove']` |

Set `feature.idempotency.active` to enable it, then override any of the options above.

### log

Logging.

| Option | Default |
|---|---|
| `active` | `true` |

Set `feature.log.active` to enable it, then override any of the options above.

### metrics

Metrics.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.metrics.active` to enable it, then override any of the options above.

### paging

Paging.

| Option | Default |
|---|---|
| `active` | `false` |
| `afterVar` | `'after'` |
| `cursorParam` | `'cursor'` |
| `firstVar` | `'first'` |
| `limitParam` | `'limit'` |
| `pageParam` | `'page'` |
| `startPage` | `1` |

Set `feature.paging.active` to enable it, then override any of the options above.

### ratelimit

Rate limiting.

| Option | Default |
|---|---|
| `active` | `false` |
| `burst` | `5` |
| `rate` | `5` |

Set `feature.ratelimit.active` to enable it, then override any of the options above.

`ratelimit` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### retry

Retry.

| Option | Default |
|---|---|
| `active` | `false` |
| `factor` | `2` |
| `maxDelay` | `2000` |
| `minDelay` | `50` |
| `retries` | `2` |
| `statuses` | `[408, 425, 429, 500, 502, 503, 504]` |

Set `feature.retry.active` to enable it, then override any of the options above.

`retry` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.

### telemetry

Telemetry.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.telemetry.active` to enable it, then override any of the options above.

### test

Test transport.

| Option | Default |
|---|---|
| `active` | `false` |

Set `feature.test.active` to enable it, then override any of the options above.

### timeout

Timeout.

| Option | Default |
|---|---|
| `active` | `false` |
| `ms` | `30000` |

Set `feature.timeout.active` to enable it, then override any of the options above.

`timeout` wraps the transport, so its position among the other
transport features decides what it sees. A feature activated later wraps one
activated earlier.


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

- **AuditFeature**: Audit trail
- **ClienttrackFeature**: Client tracking
- **DebugFeature**: Debug capture
- **IdempotencyFeature**: Idempotency
- **LogFeature**: Logging
- **MetricsFeature**: Metrics
- **PagingFeature**: Paging
- **RatelimitFeature**: Rate limiting
- **RetryFeature**: Retry
- **TelemetryFeature**: Telemetry
- **TestFeature**: Test transport
- **TimeoutFeature**: Timeout

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as `value`

The OCaml SDK uses a single dynamic `value` type throughout rather than a
typed record per entity. `value` is the vendored voxgig struct port (a
JSON-shaped variant: `Str`, `Num`, `Bool`, `List`, `Map`, `Null`,
`Noval`). This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Build request maps with the `jo` / `ja` helpers and read fields back with
`getp`; use `to_map` to safely coerce a value to a map.

### Module structure

```
ocaml/
├── sdk_client.ml               -- Main SDK client (constructors + accessors)
├── sdk_config.ml               -- Embedded API config + feature factory
├── sdk_schema.ml               -- Generated option + entity specs
├── sdk_error.ml                -- Branded error re-exports
├── sdk_entity_*.ml             -- Per-entity implementations (one each)
├── sdk_types.ml                -- Core pipeline types
├── sdk_helpers.ml              -- jo / ja / getp and friends
├── sdk_runtime.ml              -- Operation pipeline runner
├── sdk_features.ml             -- Built-in features (base, test, log)
├── utility/                    -- Vendored voxgig struct port
└── test/                       -- Test suites
```

The public surface lives in `Sdk_client` (the constructors and per-entity
accessors); `Sdk_helpers` carries the `jo` / `ja` / `getp` value
helpers. Open the runtime modules directly only when needed.

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

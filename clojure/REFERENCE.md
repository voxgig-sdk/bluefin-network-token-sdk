# BluefinNetworkToken Clojure SDK Reference

Complete API reference for the BluefinNetworkToken Clojure SDK.


## Client

### make-sdk

```clojure
(require '[sdk.api :as api]
         '[voxgig.struct :as vs])

(def client (api/make-sdk options))
```

Create a new SDK client instance. `options` is a `voxgig.struct` map.

**Options:**

| Key | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides (e.g. custom fetch). |


### Test client

#### `(api/test-sdk testopts sdkopts)`

Create a test client with mock features active. Both arguments may be `nil`.

```clojure
(def client (api/test-sdk nil nil))
```


### Client functions

#### `(api/network_token_bundle client data)`

Create a new `NetworkTokenBundle` entity instance. Pass `nil` for no initial data.

#### `(api/options-map client) -> map`

Return a deep copy of the current SDK options.

#### `(api/get-utility client) -> utility`

Return a copy of the SDK utility object.

#### `(api/direct client fetchargs) -> map`

Make a direct HTTP request to any API endpoint. Returns a result `map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `(vs/getprop result "ok")`.

**Fetch args:**

| Key | Type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

**Returns:** a result `map`.

#### `(api/prepare client fetchargs) -> map`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## NetworkTokenBundle

```clojure
(require '[sdk.entity.network_token_bundle :as e-network_token_bundle])

(def network_token_bundle (api/network_token_bundle client nil))
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `map` | No |  |
| `cardNumber` | `string` | No |  |
| `expirationMonth` | `string` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `string` | No | Four-digit year in which the payment card expires. |
| `issuer` | `map` | No |  |
| `metadata` | `map` | No |  |
| `networkToken` | `map` | No |  |
| `networkTokenBundleId` | `string` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `string` | No |  |
| `securityCode` | `string` | No |  |

### Operations

#### `(create ent reqdata ctrl) -> map`

Create a new entity with the given data. Returns the created entity data and raises on error.

```clojure
(def result
  (e-network_token_bundle/create (api/network_token_bundle client nil)
    (vs/jm
      )
    nil))
```

#### `(load ent reqmatch ctrl) -> map`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```clojure
(def result (e-network_token_bundle/load (api/network_token_bundle client nil) (vs/jm "id" "network_token_bundle_id") nil))
```

#### `(remove ent reqmatch ctrl) -> map`

Remove the entity matching the given criteria. Raises on error.

```clojure
(def result (e-network_token_bundle/remove (api/network_token_bundle client nil) (vs/jm "id" "network_token_bundle_id") nil))
```

### Common Members

State accessors are stored on the entity map and called via keyword lookup.

#### `((:data-get ent)) -> map`

Get the entity data.

#### `((:data-set ent) data)`

Set the entity data.

#### `((:match-get ent)) -> map`

Get the entity match criteria.

#### `((:match-set ent) match)`

Set the entity match criteria.

#### `((:make ent)) -> entity`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `((:get-name ent)) -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```clojure
(def client
  (api/make-sdk
    (vs/jm "feature"
      (vs/jm
        "test" (vs/jm "active" true)
        ))))
```


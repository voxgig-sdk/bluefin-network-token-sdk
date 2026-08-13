# BluefinNetworkToken C SDK Reference

Complete API reference for the BluefinNetworkToken C SDK.


## BluefinNetworkTokenSDK

### Constructor

```c
#include "core/api.h"

BluefinNetworkTokenSDK* client = bluefinnetworktoken_sdk_new(options);
```

Create a new SDK client instance. `options` is a `voxgig_value*` map
(`NULL` for none).

**Parameters (`options` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL for API requests. |
| `prefix` | `string` | URL prefix appended after base. |
| `suffix` | `string` | URL suffix appended after path. |
| `headers` | `map` | Custom headers for all requests. |
| `feature` | `map` | Feature configuration. |
| `system` | `map` | System overrides. |


### Test Constructor

#### `BluefinNetworkTokenSDK* test_sdk(voxgig_value* testopts, voxgig_value* sdkopts)`

Create a test client with mock features active. Both arguments may be
`NULL`.

```c
BluefinNetworkTokenSDK* client = test_sdk(NULL, NULL);
```


### Entity Accessors

#### `Entity* bluefinnetworktoken_network_token_bundle(BluefinNetworkTokenSDK* client, voxgig_value* entopts)`

Create a new `NetworkTokenBundle` entity instance. Pass `NULL` for no initial
options.

#### `voxgig_value* sdk_direct(BluefinNetworkTokenSDK* client, voxgig_value* fetchargs, PNError** err)`

Make a direct HTTP request to any API endpoint. Returns a result map with
`ok`, `status`, `headers`, and `data` (or `err` on failure). This escape
hatch never sets `*err` for a non-2xx response — branch on
`getp(result, "ok")`.

**Parameters (`fetchargs` map keys):**

| Key | Value type | Description |
| --- | --- | --- |
| `path` | `string` | URL path with optional `{param}` placeholders. |
| `method` | `string` | HTTP method (default: `"GET"`). |
| `params` | `map` | Path parameter values. |
| `query` | `map` | Query string parameters. |
| `headers` | `map` | Request headers (merged with defaults). |
| `body` | `any` | Request body (maps are JSON-serialized). |

#### `voxgig_value* sdk_prepare(BluefinNetworkTokenSDK* client, voxgig_value* fetchargs, PNError** err)`

Prepare a fetch definition without sending. Returns the fetchdef and sets
`*err` on failure.


---

## NetworkTokenBundle

```c
Entity* network_token_bundle = bluefinnetworktoken_network_token_bundle(client, NULL);
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `voxgig_value* (map)` | No |  |
| `cardNumber` | `char*` | No |  |
| `expirationMonth` | `char*` | No |  |
| `expirationYear` | `char*` | No |  |
| `issuer` | `voxgig_value* (map)` | No |  |
| `metadata` | `voxgig_value* (map)` | No |  |
| `networkToken` | `voxgig_value* (map)` | No |  |
| `networkTokenBundleId` | `char*` | No |  |
| `networkTokenBundleState` | `char*` | No |  |
| `securityCode` | `char*` | No |  |

### Operations

#### `vt->create(Entity* e, voxgig_value* reqdata, voxgig_value* ctrl, PNError** err)`

Create a new entity with the given data. Returns the created entity data and sets `*err` on failure.

```c
Entity* network_token_bundle = bluefinnetworktoken_network_token_bundle(client, NULL);
voxgig_value* result = network_token_bundle->vt->create(network_token_bundle, NULL, NULL, &err);
```

#### `vt->load(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Load a single entity matching the given criteria. Returns the entity data and sets `*err` on failure.

```c
Entity* network_token_bundle = bluefinnetworktoken_network_token_bundle(client, NULL);
voxgig_value* result = network_token_bundle->vt->load(network_token_bundle, cmap(1, "id", v_str("network_token_bundle_id")), NULL, &err);
```

#### `vt->remove(Entity* e, voxgig_value* reqmatch, voxgig_value* ctrl, PNError** err)`

Remove the entity matching the given criteria. Sets `*err` on failure.

```c
Entity* network_token_bundle = bluefinnetworktoken_network_token_bundle(client, NULL);
voxgig_value* result = network_token_bundle->vt->remove(network_token_bundle, cmap(1, "id", v_str("network_token_bundle_id")), NULL, &err);
```

### Common Methods

#### `voxgig_value* vt->data(Entity* e, voxgig_value* args)`

Get the entity data. Pass a map to set it.

#### `voxgig_value* vt->matchv(Entity* e, voxgig_value* args)`

Get the entity match criteria. Pass a map to set it.

#### `Entity* vt->make(Entity* e)`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `const char* vt->get_name(Entity* e)`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```c
BluefinNetworkTokenSDK* client = bluefinnetworktoken_sdk_new(cmap(1,
    "feature", cmap(1,
        "test", cmap(1, "active", v_bool(true)))
));
```


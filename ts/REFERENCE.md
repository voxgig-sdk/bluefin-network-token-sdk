# BluefinNetworkToken TypeScript SDK Reference

Complete API reference for the BluefinNetworkToken TypeScript SDK.


## BluefinNetworkTokenSDK

### Constructor

```ts
new BluefinNetworkTokenSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinNetworkTokenSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = BluefinNetworkTokenSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `BluefinNetworkTokenSDK` instance in test mode.


### Instance Methods

#### `NetworkTokenBundle(data?: object)`

Create a new `NetworkTokenBundle` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `NetworkTokenBundleEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `BluefinNetworkTokenSDK.test()`.

**Returns:** `BluefinNetworkTokenSDK` instance in test mode.


---

## NetworkTokenBundleEntity

```ts
const network_token_bundle = client.NetworkTokenBundle()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Record<string, any>` | No |  |
| `cardNumber` | `string` | No |  |
| `expirationMonth` | `string` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `string` | No | Four-digit year in which the payment card expires. |
| `id` | `string` | No |  |
| `issuer` | `Record<string, any>` | No |  |
| `metadata` | `Record<string, any>` | No |  |
| `networkToken` | `Record<string, any>` | No |  |
| `networkTokenBundleId` | `string` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `string` | No |  |
| `securityCode` | `string` | No |  |

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `payment_credential` | `/network-token-bundle/{networkTokenBundleId}/payment-credentials` | `client.NetworkTokenBundle().load({ $action: 'payment_credential', ... })` |

An action returns that action's OWN response, which is not necessarily a
NetworkTokenBundle record — check the API definition for its shape.

```ts
const result = await client.NetworkTokenBundle().load({
  $action: 'payment_credential',
  /* ...the action's own arguments */
})
```

### Operations

#### `create(data: object, ctrl?: object)`

Create a new entity with the given data.

```ts
const result = await client.NetworkTokenBundle().create({
})
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.NetworkTokenBundle().load({ id: 'network_token_bundle_id' })
```

#### `remove(match: object, ctrl?: object)`

Remove the entity matching the given criteria.

```ts
const result = await client.NetworkTokenBundle().remove({ id: 'network_token_bundle_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `NetworkTokenBundleEntity` instance with the same client and
options.

#### `client()`

Return the parent `BluefinNetworkTokenSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new BluefinNetworkTokenSDK({
  feature: {
    test: { active: true },
  }
})
```


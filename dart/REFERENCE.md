# BluefinNetworkToken Dart SDK Reference

Complete API reference for the BluefinNetworkToken Dart SDK.

## BluefinNetworkTokenSDK

### Constructor

```dart
import 'package:bluefin_network_token_sdk/BluefinNetworkTokenSDK.dart';

final client = BluefinNetworkTokenSDK(options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Map` | SDK configuration options. |
| `options['apikey']` | `String` | API key for authentication. |
| `options['base']` | `String` | Base URL for API requests. |
| `options['prefix']` | `String` | URL prefix appended after base. |
| `options['suffix']` | `String` | URL suffix appended after path. |
| `options['headers']` | `Map` | Custom headers for all requests. |
| `options['feature']` | `Map` | Feature configuration. |
| `options['system']` | `Map` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinNetworkTokenSDK.test([testopts, sdkopts])`

Create a test client with mock features active. Both arguments may be `null`.

```dart
final client = BluefinNetworkTokenSDK.test();
```


### Instance Methods

#### `NetworkTokenBundle([entopts])`

Create a new `NetworkTokenBundleEntity` instance. Pass no argument for no initial data.

#### `options() -> Map`

Return a deep copy of the current SDK options.

#### `utility() -> Utility`

Return the SDK utility object.

#### `direct([fetchargs]) -> Future<Map>`

Make a direct HTTP request to any API endpoint. Returns a result `Map` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never throws — branch on `result['ok']`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs['path']` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs['method']` | `String` | HTTP method (default: `'GET'`). |
| `fetchargs['params']` | `Map` | Path parameter values. |
| `fetchargs['query']` | `Map` | Query string parameters. |
| `fetchargs['headers']` | `Map` | Request headers (merged with defaults). |
| `fetchargs['body']` | `dynamic` | Request body (maps are JSON-serialized). |

**Returns:** `Future<Map>`

#### `prepare([fetchargs]) -> Future`

Prepare a fetch definition without sending. Returns the `fetchdef` (or an error value on failure).


---

## NetworkTokenBundleEntity

```dart
final network_token_bundle = client.NetworkTokenBundle();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `Map<String, dynamic>` | No |  |
| `cardNumber` | `String` | No |  |
| `expirationMonth` | `String` | No |  |
| `expirationYear` | `String` | No |  |
| `issuer` | `Map<String, dynamic>` | No |  |
| `metadata` | `Map<String, dynamic>` | No |  |
| `networkToken` | `Map<String, dynamic>` | No |  |
| `networkTokenBundleId` | `String` | No |  |
| `networkTokenBundleState` | `String` | No |  |
| `securityCode` | `String` | No |  |

### Operations

#### `create(reqdata, [ctrl]) -> Future<dynamic>`

Create a new entity with the given data. Returns the created entity data and throws on error.

```dart
final result = await client.NetworkTokenBundle().create({
});
```

#### `load(reqmatch, [ctrl]) -> Future<dynamic>`

Load a single entity matching the given criteria. Returns the entity data and throws on error.

```dart
final result = await client.NetworkTokenBundle().load({'id': 'network_token_bundle_id'});
```

#### `remove(reqmatch, [ctrl]) -> Future<dynamic>`

Remove the entity matching the given criteria. Throws on error.

```dart
final result = await client.NetworkTokenBundle().remove({'id': 'network_token_bundle_id'});
```

### Common Methods

#### `data([d]) -> Map`

Get the entity data, or set it when passed an argument.

#### `match([m]) -> Map`

Get the entity match criteria, or set it when passed an argument.

#### `make() -> Entity`

Create a new `NetworkTokenBundleEntity` instance with the same options.

#### `entopts() -> Map`

Return the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```dart
final client = BluefinNetworkTokenSDK({
  'feature': {
    'test': {'active': true},
  },
});
```


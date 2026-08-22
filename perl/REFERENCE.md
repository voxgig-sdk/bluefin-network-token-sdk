# BluefinNetworkToken Perl SDK Reference

Complete API reference for the BluefinNetworkToken Perl SDK.


## BluefinNetworkTokenSDK

### Constructor

```perl
use lib 'lib';
use BluefinNetworkTokenSDK;

my $client = BluefinNetworkTokenSDK->new($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `hashref` | SDK configuration options. |
| `$options->{apikey}` | `string` | API key for authentication. |
| `$options->{base}` | `string` | Base URL for API requests. |
| `$options->{prefix}` | `string` | URL prefix appended after base. |
| `$options->{suffix}` | `string` | URL suffix appended after path. |
| `$options->{headers}` | `hashref` | Custom headers for all requests. |
| `$options->{feature}` | `hashref` | Feature configuration. |
| `$options->{system}` | `hashref` | System overrides (e.g. custom fetch). |


### Static Methods

#### `BluefinNetworkTokenSDK->test($testopts, $sdkopts)`

Create a test client with mock features active. Both arguments may be `undef`.

```perl
my $client = BluefinNetworkTokenSDK->test();
```


### Instance Methods

#### `NetworkTokenBundle($data)`

Create a new `NetworkTokenBundle` entity instance. Pass `undef` for no initial data.

#### `options_map() -> hashref`

Return a deep copy of the current SDK options.

#### `get_utility() -> utility`

Return a copy of the SDK utility object.

#### `direct($fetchargs) -> hashref`

Make a direct HTTP request to any API endpoint. Returns a result `hashref` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never dies — branch on `$result->{ok}`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs->{path}` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs->{method}` | `string` | HTTP method (default: `'GET'`). |
| `$fetchargs->{params}` | `hashref` | Path parameter values. |
| `$fetchargs->{query}` | `hashref` | Query string parameters. |
| `$fetchargs->{headers}` | `hashref` | Request headers (merged with defaults). |
| `$fetchargs->{body}` | `any` | Request body (hashrefs are JSON-serialized). |

**Returns:** `hashref`

#### `prepare($fetchargs) -> hashref`

Prepare a fetch definition without sending. Returns the `fetchdef` and dies on error.


---

## NetworkTokenBundle entity

```perl
my $network_token_bundle = $client->NetworkTokenBundle;
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `card` | `hashref` | No |  |
| `cardNumber` | `string` | No |  |
| `expirationMonth` | `string` | No | Two-digit month in which the payment card expires. |
| `expirationYear` | `string` | No | Four-digit year in which the payment card expires. |
| `issuer` | `hashref` | No |  |
| `metadata` | `hashref` | No |  |
| `networkToken` | `hashref` | No |  |
| `networkTokenBundleId` | `string` | No | Unique identifier for the Instrument Identifier token used in the transaction. |
| `networkTokenBundleState` | `string` | No |  |
| `securityCode` | `string` | No |  |

### Operations

#### `create($reqdata, $ctrl) -> hashref`

Create a new entity with the given data. Returns the created entity data and dies on error.

```perl
my $result = $client->NetworkTokenBundle->create({
});
```

#### `load($reqmatch, $ctrl) -> hashref`

Load a single entity matching the given criteria. Returns the entity data and dies on error.

```perl
my $result = $client->NetworkTokenBundle->load({ 'id' => 'network_token_bundle_id' });
```

#### `remove($reqmatch, $ctrl) -> hashref`

Remove the entity matching the given criteria. Dies on error.

```perl
my $result = $client->NetworkTokenBundle->remove({ 'id' => 'network_token_bundle_id' });
```

### Common Methods

#### `data_get() -> hashref`

Get the entity data.

#### `data_set($data)`

Set the entity data.

#### `match_get() -> hashref`

Get the entity match criteria.

#### `match_set($match)`

Set the entity match criteria.

#### `make() -> entity`

Create a new `NetworkTokenBundle` entity instance with the same options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```perl
my $client = BluefinNetworkTokenSDK->new({
    'feature' => {
        'test' => { 'active' => 1 },
    },
});
```


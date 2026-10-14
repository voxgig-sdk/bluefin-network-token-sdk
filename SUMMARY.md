# Network Token Bundle

The purpose of the ShieldConex API&#39;s are to provide ability to tokenize/detokenize data

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 1 entities and 4 HTTP routes. There are 23 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### NetworkTokenBundle

Results: Network Token Creation Details; Network Token details response; Payment Credentials details response; Network Token delete response.

SDK operations: `create`, `load`, `remove`.

Key fields to recognise:

- `expirationMonth`: Two-digit month in which the payment card expires. Format: `MM`. Valid values: `01` through `12`. Leading 0 is required. #### Barclays and Streamline For Maestro (UK Domestic) and Maestro (International) cards on Barclays and Streamline, this must be a valid value (`01` through `12`) but is not required to be a valid expiration date. In other words, an expiration date that is in the past does not cause CyberSource to reject your request. However, an invalid expiration date might cause the issuer to reject your request. #### Encoded Account Numbers For encoded account numbers (_type_=039), if there is no expiration date on the card, use `12`. #### FDMS Nashville Required field. #### All other processors Required if `pointOfSaleInformation.entryMode=keyed`. However, this field is optional if your account is configured for relaxed requirements for address data and expiration date. **Important** It is your responsibility to determine whether a field is required for the transaction you are requesting. #### Google Pay transactions For PAN-based Google Pay transactions, this field is returned in the API response.
- `expirationYear`: Four-digit year in which the payment card expires. Format: `YYYY`. #### Barclays and Streamline For Maestro (UK Domestic) and Maestro (International) cards on Barclays and Streamline, this must be a valid value (`1900` through `3000`) but is not required to be a valid expiration date. In other words, an expiration date that is in the past does not cause CyberSource to reject your request. However, an invalid expiration date might cause the issuer to reject your request. #### Encoded Account Numbers For encoded account numbers (**_type_**`=039`), if there is no expiration date on the card, use `2021`. #### FDMS Nashville Required field. #### FDC Nashville Global and FDMS South You can send in 2 digits or 4 digits. If you send in 2 digits, they must be the last 2 digits of the year. #### All other processors Required if `pointOfSaleInformation.entryMode=keyed`. However, this field is optional if your account is configured for relaxed requirements for address data and expiration date. **Important** It is your responsibility to determine whether a field is required for the transaction you are requesting. #### Google Pay transactions For PAN-based Google Pay transactions, this field is returned in the API response.
- `networkTokenBundleId`: Unique identifier for the Network Token Bundle token used in the transaction.
- `networkTokenBundleState`: 

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| NetworkTokenBundle | `create` | `POST /network-token-bundle` | Required |
| NetworkTokenBundle | `load` | `GET /network-token-bundle/{networkTokenBundleId}` | Required |
| NetworkTokenBundle | `load` | `GET /network-token-bundle/{networkTokenBundleId}/payment-credentials` | Required |
| NetworkTokenBundle | `remove` | `DELETE /network-token-bundle/{networkTokenBundleId}` | Required |

## Connect to the API

- API server: `https://secure-cert.shieldconex.com/api`

The default credential is sent in the `Authorization` header with the `Basic` prefix.

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| C | `c/` | Build from source |
| Clojure | `clojure/` | Build from source |
| C++ | `cpp/` | Build from source |
| C# | `csharp/` | Build from source |
| Dart | `dart/` | Build from source |
| Elixir | `elixir/` | Build from source |
| Golang | `go/` | Build from source |
| Haskell | `haskell/` | Build from source |
| Java | `java/` | Build from source |
| JavaScript | `js/` | Build from source |
| Kotlin | `kotlin/` | Build from source |
| Lean | `lean/` | Build from source |
| Lua | `lua/` | Build from source |
| OCaml | `ocaml/` | Build from source |
| Perl | `perl/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| Rust | `rust/` | Build from source |
| Scala | `scala/` | Build from source |
| Swift | `swift/` | Build from source |
| TypeScript | `ts/` | Build from source |
| Zig | `zig/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `bluefin-network-token_list`: List records for an entity. No active entity supports this operation.
- `bluefin-network-token_load`: Load one record for an entity. Supported entities: `network_token_bundle`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `audit`: Structured audit trail of operations
- `clienttrack`: Client identity and per-request correlation headers
- `debug`: Request/response capture ring buffer for debugging
- `idempotency`: Idempotency keys for safe retries of mutating operations
- `log`: Structured request and response logging
- `metrics`: Statistics capture: per-operation counters and latency
- `paging`: Pagination signals for list operations
- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `telemetry`: Distributed tracing spans with W3C trace-context propagation
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.


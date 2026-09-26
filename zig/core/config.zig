// Generated API configuration (mirrors go/rust core/config).

const std = @import("std");
const h = @import("helpers.zig");
const types = @import("types.zig");
const Value = h.Value;
const Feature = types.Feature;

pub fn make_config() Value {
    return h.jo(&.{
        .{ "main", h.jo(&.{
            .{ "name", h.vstr("BluefinNetworkToken") },
            .{ "slug", h.vstr("bluefin-network-token") },
            .{ "version", h.vstr("0.1.1") },
            .{ "target", h.vstr("zig") },
        }) },
        .{ "feature", h.jo(&.{
            .{ "audit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "actor", h.vstr("anonymous") },
                    .{ "max", h.vnum(1000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sink", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "clienttrack", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "clientVersion", h.vstr("0.0.1") },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clientName", h.vstr("`$STRING`") },
                    .{ "clientVersion", h.vstr("`$STRING`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "sessionId", h.vstr("`$STRING`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "debug", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "max", h.vnum(100) },
                    .{ "redact", h.ja(&.{
                        h.vstr("authorization"),
                        h.vstr("cookie"),
                        h.vstr("set-cookie"),
                        h.vstr("api-key"),
                        h.vstr("apikey"),
                        h.vstr("x-api-key"),
                        h.vstr("idempotency-key"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "onEntry", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "idempotency", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "header", h.vstr("Idempotency-Key") },
                    .{ "methods", h.ja(&.{
                        h.vstr("POST"),
                        h.vstr("PUT"),
                        h.vstr("PATCH"),
                        h.vstr("DELETE"),
                    }) },
                    .{ "ops", h.ja(&.{
                        h.vstr("create"),
                        h.vstr("update"),
                        h.vstr("remove"),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "keygen", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "log", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(true) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "level", h.vstr("`$STRING`") },
                    .{ "logger", h.vstr("`$ANY`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "metrics", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "paging", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "afterVar", h.vstr("after") },
                    .{ "cursorParam", h.vstr("cursor") },
                    .{ "firstVar", h.vstr("first") },
                    .{ "limitParam", h.vstr("limit") },
                    .{ "pageParam", h.vstr("page") },
                    .{ "startPage", h.vnum(1) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "limit", h.vstr("`$NUMBER`") },
                    .{ "ops", h.vstr("`$LIST`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "ratelimit", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "burst", h.vnum(5) },
                    .{ "rate", h.vnum(5) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "now", h.vstr("`$FUNCTION`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "retry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "factor", h.vnum(2) },
                    .{ "maxDelay", h.vnum(2000) },
                    .{ "minDelay", h.vnum(50) },
                    .{ "retries", h.vnum(2) },
                    .{ "statuses", h.ja(&.{
                        h.vnum(408),
                        h.vnum(425),
                        h.vnum(429),
                        h.vnum(500),
                        h.vnum(502),
                        h.vnum(503),
                        h.vnum(504),
                    }) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "jitter", h.vstr("`$BOOLEAN`") },
                    .{ "sleep", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
            .{ "telemetry", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "exporter", h.vstr("`$FUNCTION`") },
                    .{ "headers", h.vstr("`$MAP`") },
                    .{ "idgen", h.vstr("`$FUNCTION`") },
                    .{ "now", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("none") },
            }) },
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "entity", h.vstr("`$MAP`") },
                    .{ "net", h.vstr("`$MAP`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("base") },
            }) },
            .{ "timeout", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                    .{ "ms", h.vnum(30000) },
                }) },
                .{ "optspec", h.jo(&.{
                    .{ "clearTimer", h.vstr("`$FUNCTION`") },
                    .{ "setTimer", h.vstr("`$FUNCTION`") },
                }) },
                .{ "strict", h.vbool(false) },
                .{ "transport", h.vstr("wrap") },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://secure-cert.shieldconex.com/api") },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
                .{ "basic", h.vbool(true) },
            }) },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "network_token_bundle", h.omap() },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "network_token_bundle", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "name", h.vstr("card") },
                        .{ "title", h.vstr("Card") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("cardNumber") },
                        .{ "title", h.vstr("Card Number") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("expirationMonth") },
                        .{ "title", h.vstr("Expiration Month") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Two-digit month in which the payment card expires.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("expirationYear") },
                        .{ "title", h.vstr("Expiration Year") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Four-digit year in which the payment card expires.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("id") },
                        .{ "title", h.vstr("Id") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("issuer") },
                        .{ "title", h.vstr("Issuer") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("metadata") },
                        .{ "title", h.vstr("Metadata") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("networkToken") },
                        .{ "title", h.vstr("Network Token") },
                        .{ "type", h.vstr("`$OBJECT`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("networkTokenBundleId") },
                        .{ "title", h.vstr("Network Token Bundle Id") },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "short", h.vstr("Unique identifier for the Instrument Identifier token used in the transaction.") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("networkTokenBundleState") },
                        .{ "title", h.vstr("Network Token Bundle State") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                    h.jo(&.{
                        .{ "name", h.vstr("securityCode") },
                        .{ "title", h.vstr("Security Code") },
                        .{ "type", h.vstr("`$STRING`") },
                    }),
                }) },
                .{ "id", h.jo(&.{
                    .{ "field", h.vstr("id") },
                    .{ "name", h.vstr("id") },
                }) },
                .{ "name", h.vstr("network_token_bundle") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/network-token-bundle") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("network-token-bundle") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                }) },
                                .{ "rename", h.omap() },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("network-token-bundle") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "networkTokenBundleId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                            }),
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}/payment-credentials") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("network-token-bundle") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                    h.jo(&.{
                                        .{ "lit", h.vstr("payment-credentials") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                    h.vstr("{id}"),
                                    h.vstr("payment-credentials"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "networkTokenBundleId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "$action", h.vstr("payment_credential") },
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}") },
                                .{ "segments", h.ja(&.{
                                    h.jo(&.{
                                        .{ "lit", h.vstr("network-token-bundle") },
                                    }),
                                    h.jo(&.{
                                        .{ "var", h.vstr("id") },
                                    }),
                                }) },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "networkTokenBundleId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("header") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "kind", h.vstr("param") },
                                            .{ "reqd", h.vbool(true) },
                                        }),
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                            }),
                        }) },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

// SHARED CONFIG (sdkgen rung L2).
//
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client. Above the
// size threshold make_config re-parses the whole embedded JSON, so this is the
// difference between parsing the model once and once per client.
//
// Value nodes are arena-allocated and reference-stable, so the shared value is
// genuinely one structure, not a copy.
var shared_config_val: ?Value = null;

/// The process-wide config, built once on first use.
///
/// The returned Value SHARES its nodes: treat it as read-only. Callers that
/// need to mutate should use make_config, which always returns a fresh copy.
pub fn shared_config() Value {
    if (shared_config_val) |c| return c;
    const c = make_config();
    shared_config_val = c;
    return c;
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
    if (std.mem.eql(u8, name, "cost")) return @import("../feature/cost.zig").CostFeature.make();
    if (std.mem.eql(u8, name, "debug")) return @import("../feature/debug.zig").DebugFeature.make();
    if (std.mem.eql(u8, name, "idempotency")) return @import("../feature/idempotency.zig").IdempotencyFeature.make();
    if (std.mem.eql(u8, name, "log")) return @import("../feature/log.zig").LogFeature.make();
    if (std.mem.eql(u8, name, "metrics")) return @import("../feature/metrics.zig").MetricsFeature.make();
    if (std.mem.eql(u8, name, "netsim")) return @import("../feature/netsim.zig").NetsimFeature.make();
    if (std.mem.eql(u8, name, "paging")) return @import("../feature/paging.zig").PagingFeature.make();
    if (std.mem.eql(u8, name, "proxy")) return @import("../feature/proxy.zig").ProxyFeature.make();
    if (std.mem.eql(u8, name, "ratelimit")) return @import("../feature/ratelimit.zig").RatelimitFeature.make();
    if (std.mem.eql(u8, name, "rbac")) return @import("../feature/rbac.zig").RbacFeature.make();
    if (std.mem.eql(u8, name, "retry")) return @import("../feature/retry.zig").RetryFeature.make();
    if (std.mem.eql(u8, name, "streaming")) return @import("../feature/streaming.zig").StreamingFeature.make();
    if (std.mem.eql(u8, name, "telemetry")) return @import("../feature/telemetry.zig").TelemetryFeature.make();
    if (std.mem.eql(u8, name, "test")) return @import("../feature/test.zig").TestFeature.make();
    if (std.mem.eql(u8, name, "timeout")) return @import("../feature/timeout.zig").TimeoutFeature.make();
    return @import("../feature/base.zig").BaseFeature.make();
}

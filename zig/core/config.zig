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
        }) },
        .{ "feature", h.jo(&.{
            .{ "test", h.jo(&.{
                .{ "options", h.jo(&.{
                    .{ "active", h.vbool(false) },
                }) },
            }) },
        }) },
        .{ "options", h.jo(&.{
            .{ "base", h.vstr("https://secure-cert.shieldconex.com/api") },
            .{ "headers", h.jo(&.{
                .{ "content-type", h.vstr("application/json") },
            }) },
            .{ "entity", h.jo(&.{
                .{ "network_token_bundle", h.omap() },
            }) },
            .{ "auth", h.jo(&.{
                .{ "prefix", h.vstr("Basic") },
            }) },
        }) },
        .{ "entity", h.jo(&.{
            .{ "network_token_bundle", h.jo(&.{
                .{ "fields", h.ja(&.{
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("card") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(0) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("cardNumber") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(1) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expirationMonth") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(2) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("expirationYear") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(3) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("issuer") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(4) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("metadata") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(5) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("networkToken") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$OBJECT`") },
                        .{ "index$", h.vnum(6) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("networkTokenBundleId") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(7) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("networkTokenBundleState") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(8) },
                    }),
                    h.jo(&.{
                        .{ "active", h.vbool(true) },
                        .{ "name", h.vstr("securityCode") },
                        .{ "req", h.vbool(false) },
                        .{ "type", h.vstr("`$STRING`") },
                        .{ "index$", h.vnum(9) },
                    }),
                }) },
                .{ "name", h.vstr("network_token_bundle") },
                .{ "op", h.jo(&.{
                    .{ "create", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("create") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("POST") },
                                .{ "orig", h.vstr("/network-token-bundle") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("create") },
                    }) },
                    .{ "load", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("load") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "networkTokenBundleId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("GET") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}/payment-credentials") },
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
                                .{ "select", h.jo(&.{
                                    .{ "$action", h.vstr("payment_credential") },
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(1) },
                            }),
                        }) },
                        .{ "key$", h.vstr("load") },
                    }) },
                    .{ "remove", h.jo(&.{
                        .{ "input", h.vstr("data") },
                        .{ "name", h.vstr("remove") },
                        .{ "points", h.ja(&.{
                            h.jo(&.{
                                .{ "active", h.vbool(true) },
                                .{ "args", h.jo(&.{
                                    .{ "header", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("header") },
                                            .{ "name", h.vstr("scx_client_reference") },
                                            .{ "orig", h.vstr("scx_client_reference") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                        }),
                                    }) },
                                    .{ "params", h.ja(&.{
                                        h.jo(&.{
                                            .{ "active", h.vbool(true) },
                                            .{ "kind", h.vstr("param") },
                                            .{ "name", h.vstr("id") },
                                            .{ "orig", h.vstr("network_token_bundle_id") },
                                            .{ "reqd", h.vbool(true) },
                                            .{ "type", h.vstr("`$STRING`") },
                                            .{ "index$", h.vnum(0) },
                                        }),
                                    }) },
                                }) },
                                .{ "kind", h.vstr("http") },
                                .{ "method", h.vstr("DELETE") },
                                .{ "orig", h.vstr("/network-token-bundle/{networkTokenBundleId}") },
                                .{ "parts", h.ja(&.{
                                    h.vstr("network-token-bundle"),
                                    h.vstr("{id}"),
                                }) },
                                .{ "rename", h.jo(&.{
                                    .{ "param", h.jo(&.{
                                        .{ "networkTokenBundleId", h.vstr("id") },
                                    }) },
                                }) },
                                .{ "select", h.jo(&.{
                                    .{ "exist", h.ja(&.{
                                        h.vstr("id"),
                                        h.vstr("scx_client_reference"),
                                    }) },
                                }) },
                                .{ "transform", h.jo(&.{
                                    .{ "req", h.vstr("`reqdata`") },
                                    .{ "res", h.vstr("`body`") },
                                }) },
                                .{ "index$", h.vnum(0) },
                            }),
                        }) },
                        .{ "key$", h.vstr("remove") },
                    }) },
                }) },
                .{ "relations", h.jo(&.{
                    .{ "ancestors", h.olist() },
                }) },
            }) },
        }) },
    });
}

pub fn make_feature(name: []const u8) Feature {
    if (std.mem.eql(u8, name, "audit")) return @import("../feature/audit.zig").AuditFeature.make();
    if (std.mem.eql(u8, name, "cache")) return @import("../feature/cache.zig").CacheFeature.make();
    if (std.mem.eql(u8, name, "clienttrack")) return @import("../feature/clienttrack.zig").ClienttrackFeature.make();
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

// network_token_bundle entity test - basic flow (generated from the API model).

using System.Text.Json;

using Voxgig.Struct;
using Xunit;

namespace BluefinNetworkTokenSdk.Test;

public class NetworkTokenBundleEntityTest
{
    [Fact]
    public void Instance()
    {
        var testsdk = BluefinNetworkTokenSDK.TestSDK(null, null);
        var ent = testsdk.NetworkTokenBundle();
        Assert.NotNull(ent);
    }

    [Fact]
    public void Basic()
    {
        var setup = NetworkTokenBundleBasicSetup(null);
        // Per-op sdk-test-control.json skip - basic test exercises a flow
        // with multiple ops; skipping any op skips the whole flow.
        var _mode = setup.Live ? "live" : "unit";
        foreach (var _op in new[] { "create", "load", "remove" })
        {
            var (_shouldSkip, _) = TestRunner.IsControlSkipped(
                "entityOp", "network_token_bundle." + _op, _mode);
            if (_shouldSkip)
            {
                return; // skipped via sdk-test-control.json
            }
        }
        // The basic flow consumes synthetic IDs from the fixture. In live
        // mode without an *_ENTID env override, those IDs hit the live API
        // and 4xx; set BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live.
        if (setup.SyntheticOnly)
        {
            return;
        }
        var client = setup.Client;

        // CREATE
        var networkTokenBundleRef01Ent = client.NetworkTokenBundle();
        var networkTokenBundleRef01Data = Helpers.ToMapAny(StructUtils.GetProp(
            StructUtils.GetPath(setup.Data, StructUtils.Jt("new", "network_token_bundle")),
            "network_token_bundle_ref01"));

        var networkTokenBundleRef01DataResult = networkTokenBundleRef01Ent.Create(networkTokenBundleRef01Data, null);
        networkTokenBundleRef01Data = Helpers.ToMapAny(networkTokenBundleRef01DataResult is IEntity ce ? ce.Data() : networkTokenBundleRef01DataResult);
        Assert.True(networkTokenBundleRef01Data != null, "expected create result to be a map");
        Assert.True(networkTokenBundleRef01Data!["id"] != null, "expected created entity to have an id");

        // LOAD
        var networkTokenBundleRef01MatchDt0 = new Dictionary<string, object?>
        {
            ["id"] = networkTokenBundleRef01Data!["id"],
        };
        var networkTokenBundleRef01DataDt0Loaded = networkTokenBundleRef01Ent.Load(networkTokenBundleRef01MatchDt0, null);
        var networkTokenBundleRef01DataDt0LoadResult = Helpers.ToMapAny(networkTokenBundleRef01DataDt0Loaded is IEntity le ? le.Data() : networkTokenBundleRef01DataDt0Loaded);
        Assert.True(networkTokenBundleRef01DataDt0LoadResult != null, "expected load result to be a map");
        Assert.True(StructRunner.DeepEqual(networkTokenBundleRef01DataDt0LoadResult!["id"], networkTokenBundleRef01Data["id"]),
            "expected load result id to match");

        // REMOVE
        var networkTokenBundleRef01MatchRm0 = new Dictionary<string, object?>
        {
            ["id"] = networkTokenBundleRef01Data!["id"],
        };
        networkTokenBundleRef01Ent.Remove(networkTokenBundleRef01MatchRm0, null);

    }

    private static EntityTestSetup NetworkTokenBundleBasicSetup(
        Dictionary<string, object?>? extra)
    {
        TestRunner.LoadEnvLocal();

        var entityDataFile = Path.Combine(TestRunner.TestDir(),
            "..", "..", ".sdk", "test", "entity", "network_token_bundle",
            "NetworkTokenBundleTestData.json");

        var entityDataEl = JsonSerializer.Deserialize<JsonElement>(
            File.ReadAllText(entityDataFile));
        var entityData = StructRunner.ConvertElement(entityDataEl)
            as Dictionary<string, object?>
            ?? throw new InvalidOperationException(
                "failed to parse network_token_bundle test data");

        var options = new Dictionary<string, object?>
        {
            ["entity"] = entityData["existing"],
        };

        var client = BluefinNetworkTokenSDK.TestSDK(options, extra);

        // Generate idmap via transform, matching the TS pattern.
        var idmap = StructUtils.Transform(
            new List<object?> { "network_token_bundle01", "network_token_bundle02", "network_token_bundle03" },
            new Dictionary<string, object?>
            {
                ["`$PACK`"] = new List<object?>
                {
                    "",
                    new Dictionary<string, object?>
                    {
                        ["`$KEY`"] = "`$COPY`",
                        ["`$VAL`"] = new List<object?> { "`$FORMAT`", "upper", "`$COPY`" },
                    },
                },
            });

        // Detect ENTID env override before EnvOverride consumes it. When
        // live mode is on without a real override, the basic test runs
        // against synthetic IDs from the fixture and 4xx's.
        var entidEnvRaw = Environment.GetEnvironmentVariable(
            "BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID") ?? "";
        var idmapOverridden = entidEnvRaw != "" &&
            entidEnvRaw.Trim().StartsWith("{");

        var env = TestRunner.EnvOverride(new Dictionary<string, object?>
        {
            ["BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"] = idmap,
            ["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"] = "FALSE",
            ["BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"] = "FALSE",
            ["BLUEFIN_NETWORK_TOKEN_APIKEY"] = "",
        });

        var idmapResolved = Helpers.ToMapAny(env["BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"])
            ?? Helpers.ToMapAny(idmap)
            ?? new Dictionary<string, object?>();

        if (Equals(env["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"], "TRUE"))
        {
            // 'extra ?? new ...', not a bare 'extra': Merge returns null when
            // the last entry is null, and BasicSetup is normally called with no
            // argument at all - so a bare 'extra' silently discarded the apikey
            // and server values above and handed the SDK null.
            var extraOpts = extra ?? new Dictionary<string, object?>();
            var mergedOpts = StructUtils.Merge(new List<object?>
            {
                // FIRST, so the generated fields below win: sdk-test-control.json's
                // test.client.options adds to the live client, it does not redirect it.
                TestRunner.LiveClientOptions(),
                new Dictionary<string, object?>
                {
                    ["apikey"] = env["BLUEFIN_NETWORK_TOKEN_APIKEY"],
                },
                extraOpts,
            });
            client = new BluefinNetworkTokenSDK(Helpers.ToMapAny(mergedOpts));
        }

        var live = Equals(env["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"], "TRUE");
        return new EntityTestSetup
        {
            Client = client,
            Data = entityData,
            Idmap = idmapResolved,
            Env = env,
            Explain = Equals(env["BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"], "TRUE"),
            Live = live,
            SyntheticOnly = live && !idmapOverridden,
            Now = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds(),
        };
    }
}

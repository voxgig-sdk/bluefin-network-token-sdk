package sdktest

import (
	"encoding/json"
	"os"
	"path/filepath"
	"runtime"
	"strings"
	"testing"
	"time"

	sdk "github.com/voxgig-sdk/bluefin-network-token-sdk/go"
	"github.com/voxgig-sdk/bluefin-network-token-sdk/go/core"

	vs "github.com/voxgig-sdk/bluefin-network-token-sdk/go/utility/struct"
)

func TestNetworkTokenBundleEntity(t *testing.T) {
	t.Run("instance", func(t *testing.T) {
		testsdk := sdk.TestSDK(nil, nil)
		ent := testsdk.NetworkTokenBundle(nil)
		if ent == nil {
			t.Fatal("expected non-nil NetworkTokenBundleEntity")
		}
	})

	t.Run("basic", func(t *testing.T) {
		setup := network_token_bundleBasicSetup(nil)
		// Per-op sdk-test-control.json skip — basic test exercises a flow
		// with multiple ops; skipping any op skips the whole flow.
		_mode := "unit"
		if setup.live {
			_mode = "live"
		}
		for _, _op := range []string{"create", "load", "remove"} {
			if _shouldSkip, _reason := isControlSkipped("entityOp", "network_token_bundle." + _op, _mode); _shouldSkip {
				if _reason == "" {
					_reason = "skipped via sdk-test-control.json"
				}
				t.Skip(_reason)
				return
			}
		}
		// The basic flow consumes synthetic IDs from the fixture. In live mode
		// without an *_ENTID env override, those IDs hit the live API and 4xx.
		if setup.syntheticOnly {
			t.Skip("live entity test uses synthetic IDs from fixture — set BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live")
			return
		}
		client := setup.client

		// CREATE
		networkTokenBundleRef01Ent := client.NetworkTokenBundle(nil)
		networkTokenBundleRef01Data := core.ToMapAny(vs.GetProp(
			vs.GetPath([]any{"new", "network_token_bundle"}, setup.data), "network_token_bundle_ref01"))

		networkTokenBundleRef01DataResult, err := networkTokenBundleRef01Ent.Create(networkTokenBundleRef01Data, nil)
		if err != nil {
			t.Fatalf("create failed: %v", err)
		}
		networkTokenBundleRef01Data = core.ToMapAny(entityData(networkTokenBundleRef01DataResult))
		if networkTokenBundleRef01Data == nil {
			t.Fatal("expected create result to be a map")
		}
		if networkTokenBundleRef01Data["id"] == nil {
			t.Fatal("expected created entity to have an id")
		}

		// LOAD
		networkTokenBundleRef01MatchDt0 := map[string]any{
			"id": networkTokenBundleRef01Data["id"],
		}
		networkTokenBundleRef01DataDt0Loaded, err := networkTokenBundleRef01Ent.Load(networkTokenBundleRef01MatchDt0, nil)
		if err != nil {
			t.Fatalf("load failed: %v", err)
		}
		networkTokenBundleRef01DataDt0LoadResult := core.ToMapAny(entityData(networkTokenBundleRef01DataDt0Loaded))
		if networkTokenBundleRef01DataDt0LoadResult == nil {
			t.Fatal("expected load result to be a map")
		}
		if networkTokenBundleRef01DataDt0LoadResult["id"] != networkTokenBundleRef01Data["id"] {
			t.Fatal("expected load result id to match")
		}

		// REMOVE
		networkTokenBundleRef01MatchRm0 := map[string]any{
			"id": networkTokenBundleRef01Data["id"],
		}
		_, err = networkTokenBundleRef01Ent.Remove(networkTokenBundleRef01MatchRm0, nil)
		if err != nil {
			t.Fatalf("remove failed: %v", err)
		}

	})
}

func network_token_bundleBasicSetup(extra map[string]any) *entityTestSetup {
	loadEnvLocal()

	_, filename, _, _ := runtime.Caller(0)
	dir := filepath.Dir(filename)

	entityDataFile := filepath.Join(dir, "..", "..", ".sdk", "test", "entity", "network_token_bundle", "NetworkTokenBundleTestData.json")

	entityDataSource, err := os.ReadFile(entityDataFile)
	if err != nil {
		panic("failed to read network_token_bundle test data: " + err.Error())
	}

	var entityData map[string]any
	if err := json.Unmarshal(entityDataSource, &entityData); err != nil {
		panic("failed to parse network_token_bundle test data: " + err.Error())
	}

	options := map[string]any{}
	options["entity"] = entityData["existing"]

	client := sdk.TestSDK(options, extra)

	// Generate idmap via transform, matching TS pattern.
	idmap := vs.Transform(
		[]any{"network_token_bundle01", "network_token_bundle02", "network_token_bundle03"},
		map[string]any{
			"`$PACK`": []any{"", map[string]any{
				"`$KEY`": "`$COPY`",
				"`$VAL`": []any{"`$FORMAT`", "upper", "`$COPY`"},
			}},
		},
	)

	// Detect ENTID env override before envOverride consumes it. When live
	// mode is on without a real override, the basic test runs against synthetic
	// IDs from the fixture and 4xx's. Surface this so the test can skip.
	entidEnvRaw := os.Getenv("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID")
	idmapOverridden := entidEnvRaw != "" && strings.HasPrefix(strings.TrimSpace(entidEnvRaw), "{")

	env := envOverride(map[string]any{
		"BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID": idmap,
		"BLUEFIN_NETWORK_TOKEN_TEST_LIVE":      "FALSE",
		"BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN":   "FALSE",
		"BLUEFIN_NETWORK_TOKEN_APIKEY":         "NONE",
	})

	idmapResolved := core.ToMapAny(env["BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"])
	if idmapResolved == nil {
		idmapResolved = core.ToMapAny(idmap)
	}

	if env["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"] == "TRUE" {
		mergedOpts := vs.Merge([]any{
			map[string]any{
				"apikey": env["BLUEFIN_NETWORK_TOKEN_APIKEY"],
			},
			extra,
		})
		client = sdk.NewBluefinNetworkTokenSDK(core.ToMapAny(mergedOpts))
	}

	live := env["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"] == "TRUE"
	return &entityTestSetup{
		client:        client,
		data:          entityData,
		idmap:         idmapResolved,
		env:           env,
		explain:       env["BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"] == "TRUE",
		live:          live,
		syntheticOnly: live && !idmapOverridden,
		now:           time.Now().UnixMilli(),
	}
}

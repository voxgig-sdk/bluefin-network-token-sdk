package voxgig.bluefinnetworktokensdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Assumptions;
import org.junit.jupiter.api.Test;

import voxgig.bluefinnetworktokensdk.core.Helpers;
import voxgig.bluefinnetworktokensdk.core.SdkEntity;
import voxgig.bluefinnetworktokensdk.core.BluefinNetworkTokenSDK;
import voxgig.bluefinnetworktokensdk.utility.Json;
import voxgig.bluefinnetworktokensdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class NetworkTokenBundleEntityTest {

  @Test
  public void instance() {
    BluefinNetworkTokenSDK testsdk = BluefinNetworkTokenSDK.testSDK();
    SdkEntity ent = testsdk.networkTokenBundle(null);
    assertNotNull(ent, "expected non-null network_token_bundle entity");
  }

  @Test
  public void basic() {
    RunnerSupport.EntityTestSetup setup = networkTokenBundleBasicSetup(null);
    // Per-op sdk-test-control.json skip — basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    String mode = setup.live ? "live" : "unit";
    for (String op : new String[] { "create", "load", "remove" }) {
      String reason = RunnerSupport.skipReason("entityOp", "network_token_bundle." + op, mode);
      Assumptions.assumeTrue(reason == null,
          reason == null || "".equals(reason)
              ? "skipped via sdk-test-control.json" : reason);
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    Assumptions.assumeFalse(setup.syntheticOnly,
        "live entity test uses synthetic IDs from fixture — set BLUEFINNETWORKTOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live");
    BluefinNetworkTokenSDK client = setup.client;

    // CREATE
    SdkEntity networkTokenBundleRef01Ent = client.networkTokenBundle(null);
    Map<String, Object> networkTokenBundleRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.network_token_bundle"), "network_token_bundle_ref01"));

    Object networkTokenBundleRef01DataResult = networkTokenBundleRef01Ent.create(networkTokenBundleRef01Data, null);
    networkTokenBundleRef01Data = Helpers.toMapAny(networkTokenBundleRef01DataResult);
    assertNotNull(networkTokenBundleRef01Data, "expected create result to be a map");

    // LOAD
    Map<String, Object> networkTokenBundleRef01MatchDt0 = new LinkedHashMap<>();
    Object networkTokenBundleRef01DataDt0Loaded = networkTokenBundleRef01Ent.load(networkTokenBundleRef01MatchDt0, null);
    assertNotNull(networkTokenBundleRef01DataDt0Loaded, "expected load result to be non-null");

    // REMOVE
    Map<String, Object> networkTokenBundleRef01MatchRm0 = new LinkedHashMap<>();
    networkTokenBundleRef01MatchRm0.put("id", networkTokenBundleRef01Data.get("id"));
    networkTokenBundleRef01Ent.remove(networkTokenBundleRef01MatchRm0, null);

  }

  static RunnerSupport.EntityTestSetup networkTokenBundleBasicSetup(Map<String, Object> extra) {
    RunnerSupport.loadEnvLocal();

    Map<String, Object> entityData;
    try {
      String entityDataSource = Files.readString(Path.of(
          "..", ".sdk", "test", "entity", "network_token_bundle", "NetworkTokenBundleTestData.json"));
      entityData = Helpers.toMapAny(Json.parse(entityDataSource));
    }
    catch (Exception e) {
      throw new AssertionError("failed to read network_token_bundle test data: " + e.getMessage(), e);
    }

    Map<String, Object> options = new LinkedHashMap<>();
    options.put("entity", entityData.get("existing"));

    BluefinNetworkTokenSDK client = BluefinNetworkTokenSDK.testSDK(options, extra);

    // Generate idmap via transform, matching TS pattern.
    List<Object> idnames = new ArrayList<>();
    idnames.add("network_token_bundle01");
    idnames.add("network_token_bundle02");
    idnames.add("network_token_bundle03");
    Object idmap = Struct.transform(idnames, Json.parse(
        "{\"`$PACK`\": [\"\", {"
        + "\"`$KEY`\": \"`$COPY`\","
        + "\"`$VAL`\": [\"`$FORMAT`\", \"upper\", \"`$COPY`\"]"
        + "}]}"));

    // Detect ENTID env override before envOverride consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's. Surface this so the test
    // can skip.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFINNETWORKTOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFINNETWORKTOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID", idmap);
    envm.put("BLUEFINNETWORKTOKEN_TEST_LIVE", "FALSE");
    envm.put("BLUEFINNETWORKTOKEN_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFINNETWORKTOKEN_APIKEY", "NONE");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFINNETWORKTOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFINNETWORKTOKEN_TEST_LIVE"));
    if (live) {
      Map<String, Object> liveOpts = new LinkedHashMap<>();
      liveOpts.put("apikey", env.get("BLUEFINNETWORKTOKEN_APIKEY"));
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extra));
      client = new BluefinNetworkTokenSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFINNETWORKTOKEN_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}

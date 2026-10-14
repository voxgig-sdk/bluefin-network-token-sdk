package voxgig.bluefinnetworktokensdk.sdktest;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
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

import voxgig.bluefinnetworktokensdk.core.Config;
import voxgig.bluefinnetworktokensdk.core.Context;
import voxgig.bluefinnetworktokensdk.core.Helpers;
import voxgig.bluefinnetworktokensdk.core.SdkEntity;
import voxgig.bluefinnetworktokensdk.core.SdkError;
import voxgig.bluefinnetworktokensdk.core.BluefinNetworkTokenSDK;
import voxgig.bluefinnetworktokensdk.feature.BaseFeature;
import voxgig.bluefinnetworktokensdk.utility.Json;
import voxgig.bluefinnetworktokensdk.utility.struct.Struct;

@SuppressWarnings({"unchecked", "unused"})
public class NetworkTokenBundleEntityTest {

  // main.kit.test.live.strict is true (the default is true): a live
  // request that fails, or a live test missing an input it needs,
  // fails the test.
  // An account with no record for a test to read skips it either way.
  static final boolean LIVE_STRICT = true;

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
    BluefinNetworkTokenSDK client = setup.client;

    // CREATE
    SdkEntity networkTokenBundleRef01Ent = client.networkTokenBundle(null);
    Map<String, Object> networkTokenBundleRef01Data = Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.network_token_bundle"), "network_token_bundle_ref01"));

    Object networkTokenBundleRef01DataResult = networkTokenBundleRef01Ent.create(networkTokenBundleRef01Data, null);
    networkTokenBundleRef01Data = Helpers.toMapAny(networkTokenBundleRef01DataResult instanceof SdkEntity ? ((SdkEntity) networkTokenBundleRef01DataResult).data() : networkTokenBundleRef01DataResult);
    assertNotNull(networkTokenBundleRef01Data, "expected create result to be a map");
    assertNotNull(networkTokenBundleRef01Data.get("id"), "expected created entity to have an id");

    // LOAD
    Map<String, Object> networkTokenBundleRef01MatchDt0 = new LinkedHashMap<>();
    networkTokenBundleRef01MatchDt0.put("id", networkTokenBundleRef01Data.get("id"));
    Object networkTokenBundleRef01DataDt0Loaded = networkTokenBundleRef01Ent.load(networkTokenBundleRef01MatchDt0, null);
    Map<String, Object> networkTokenBundleRef01DataDt0LoadResult = Helpers.toMapAny(networkTokenBundleRef01DataDt0Loaded instanceof SdkEntity ? ((SdkEntity) networkTokenBundleRef01DataDt0Loaded).data() : networkTokenBundleRef01DataDt0Loaded);
    assertNotNull(networkTokenBundleRef01DataDt0LoadResult, "expected load result to be a map");
    assertEquals(networkTokenBundleRef01Data.get("id"), networkTokenBundleRef01DataDt0LoadResult.get("id"),
        "expected load result id to match");

    // REMOVE
    Map<String, Object> networkTokenBundleRef01MatchRm0 = new LinkedHashMap<>();
    networkTokenBundleRef01MatchRm0.put("id", networkTokenBundleRef01Data.get("id"));
    networkTokenBundleRef01Ent.remove(networkTokenBundleRef01MatchRm0, null);

  }

  static boolean hasFeature(String name) {
    Map<String, Object> fm = Helpers.toMapAny(Config.makeConfig().get("feature"));
    return fm != null && fm.get(name) != null;
  }

  @Test
  public void validate() {
    Assumptions.assumeTrue(hasFeature("validate"), "feature not present in this SDK: validate");
    BluefinNetworkTokenSDK client = BluefinNetworkTokenSDK.testSDK(null,
        Struct.jm("feature", Struct.jm("validate", Struct.jm("active", true))));
    SdkError err = assertThrows(SdkError.class, () ->
        client.networkTokenBundle(null).load(Struct.jm("id", 1), null));
    assertEquals("validate_failed", err.code);
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

    // Whether *_ENTID supplied the idmap, read before envOverride consumes
    // it: without it, the ids a live flow binds are the fixture's synthetic ones.
    String entidEnvRaw = RunnerSupport.getenv("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID");
    boolean idmapOverridden = entidEnvRaw != null
        && entidEnvRaw.trim().startsWith("{");

    Map<String, Object> envm = new LinkedHashMap<>();
    envm.put("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID", idmap);
    envm.put("BLUEFIN_NETWORK_TOKEN_TEST_LIVE", "FALSE");
    envm.put("BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN", "FALSE");
    envm.put("BLUEFIN_NETWORK_TOKEN_APIKEY", "");
    Map<String, Object> env = RunnerSupport.envOverride(envm);

    Map<String, Object> idmapResolved = Helpers.toMapAny(env.get("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"));
    if (idmapResolved == null) {
      idmapResolved = Helpers.toMapAny(idmap);
    }

    boolean live = "TRUE".equals(env.get("BLUEFIN_NETWORK_TOKEN_TEST_LIVE"));
    if (live) {
      // sdk-test-control.json's test.client.options seeds the live
      // client; the generated fields below overwrite anything they name.
      Map<String, Object> liveOpts =
          new LinkedHashMap<>(RunnerSupport.liveClientOptions());
      liveOpts.put("apikey", env.get("BLUEFIN_NETWORK_TOKEN_APIKEY"));
      // An empty map, not a null one: merge answers null when its last
      // entry is null, and basicSetup is normally called with no extras -
      // so a bare null silently discarded the apikey and server values
      // above.
      Map<String, Object> extraOpts =
          extra == null ? new LinkedHashMap<>() : extra;
      Object mergedOpts = Struct.merge(Struct.jt(liveOpts, extraOpts));
      client = new BluefinNetworkTokenSDK(Helpers.toMapAny(mergedOpts));
    }

    RunnerSupport.EntityTestSetup setup = new RunnerSupport.EntityTestSetup();
    setup.client = client;
    setup.data = entityData;
    setup.idmap = idmapResolved;
    setup.env = env;
    setup.explain = "TRUE".equals(env.get("BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"));
    setup.live = live;
    setup.syntheticOnly = live && !idmapOverridden;
    setup.now = System.currentTimeMillis();
    return setup;
  }
}

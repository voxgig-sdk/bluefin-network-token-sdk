package voxgig.bluefinnetworktokensdk.sdktest

import java.nio.file.Files
import java.nio.file.Paths

import org.junit.jupiter.api.Assertions.assertEquals
import org.junit.jupiter.api.Assertions.assertFalse
import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Assertions.assertTrue
import org.junit.jupiter.api.Assumptions
import org.junit.jupiter.api.Test

import voxgig.bluefinnetworktokensdk.core.Helpers
import voxgig.bluefinnetworktokensdk.core.SdkEntity
import voxgig.bluefinnetworktokensdk.core.BluefinNetworkTokenSDK
import voxgig.bluefinnetworktokensdk.utility.Json
import voxgig.bluefinnetworktokensdk.utility.struct.Struct

@Suppress("UNCHECKED_CAST", "UNUSED_VARIABLE", "UNUSED_VALUE")
class NetworkTokenBundleEntityTest {

  @Test
  fun instance() {
    val testsdk = BluefinNetworkTokenSDK.testSDK()
    val ent = testsdk.networkTokenBundle(null)
    assertNotNull(ent, "expected non-null network_token_bundle entity")
  }

  @Test
  fun basic() {
    val setup = networkTokenBundleBasicSetup(null)
    // Per-op sdk-test-control.json skip.
    val mode = if (setup.live) "live" else "unit"
    for (op in arrayOf<String>("create", "load", "remove")) {
      val reason = RunnerSupport.skipReason("entityOp", "network_token_bundle.$op", mode)
      Assumptions.assumeTrue(
        reason == null,
        if (reason == null || "" == reason) "skipped via sdk-test-control.json" else reason,
      )
    }
    Assumptions.assumeFalse(
      setup.syntheticOnly,
      "live entity test uses synthetic IDs from fixture — set BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live",
    )
    val client = setup.client

    // CREATE
    val networkTokenBundleRef01Ent = client.networkTokenBundle(null)
    var networkTokenBundleRef01Data: MutableMap<String, Any?> = (Helpers.toMapAny(Struct.getprop(
        Struct.getpath(setup.data, "new.network_token_bundle"), "network_token_bundle_ref01")) ?: linkedMapOf())

    val networkTokenBundleRef01DataResult = networkTokenBundleRef01Ent.create(networkTokenBundleRef01Data, null)
    networkTokenBundleRef01Data = Helpers.toMapAny(if (networkTokenBundleRef01DataResult is SdkEntity) networkTokenBundleRef01DataResult.data() else networkTokenBundleRef01DataResult) ?: linkedMapOf()
    assertNotNull(networkTokenBundleRef01Data, "expected create result to be a map")
    assertNotNull(networkTokenBundleRef01Data["id"], "expected created entity to have an id")

    // LOAD
    val networkTokenBundleRef01MatchDt0 = linkedMapOf<String, Any?>()
    networkTokenBundleRef01MatchDt0["id"] = networkTokenBundleRef01Data["id"]
    val networkTokenBundleRef01DataDt0Loaded = networkTokenBundleRef01Ent.load(networkTokenBundleRef01MatchDt0, null)
    val networkTokenBundleRef01DataDt0LoadResult = Helpers.toMapAny(if (networkTokenBundleRef01DataDt0Loaded is SdkEntity) networkTokenBundleRef01DataDt0Loaded.data() else networkTokenBundleRef01DataDt0Loaded) ?: linkedMapOf()
    assertNotNull(networkTokenBundleRef01DataDt0LoadResult, "expected load result to be a map")
    assertEquals(networkTokenBundleRef01Data["id"], networkTokenBundleRef01DataDt0LoadResult["id"],
        "expected load result id to match")

    // REMOVE
    val networkTokenBundleRef01MatchRm0 = linkedMapOf<String, Any?>()
    networkTokenBundleRef01MatchRm0["id"] = networkTokenBundleRef01Data["id"]
    networkTokenBundleRef01Ent.remove(networkTokenBundleRef01MatchRm0, null)

  }

  companion object {
    fun networkTokenBundleBasicSetup(extra: MutableMap<String, Any?>?): RunnerSupport.EntityTestSetup {
      RunnerSupport.loadEnvLocal()

      val entityData: MutableMap<String, Any?>
      try {
        val entityDataSource = Files.readString(Paths.get(
            "..", ".sdk", "test", "entity", "network_token_bundle", "NetworkTokenBundleTestData.json"))
        entityData = Helpers.toMapAny(Json.parse(entityDataSource)) ?: linkedMapOf()
      } catch (e: Exception) {
        throw AssertionError("failed to read network_token_bundle test data: " + e.message, e)
      }

      val options = linkedMapOf<String, Any?>()
      options["entity"] = entityData["existing"]

      var client = BluefinNetworkTokenSDK.testSDK(options, extra)

      // Generate idmap via transform, matching TS pattern.
      val idnames = mutableListOf<Any?>()
      idnames.add("network_token_bundle01")
      idnames.add("network_token_bundle02")
      idnames.add("network_token_bundle03")
      val idmap = Struct.transform(idnames, Json.parse(
          "{\"`\$PACK`\": [\"\", {" +
          "\"`\$KEY`\": \"`\$COPY`\"," +
          "\"`\$VAL`\": [\"`\$FORMAT`\", \"upper\", \"`\$COPY`\"]" +
          "}]}"))

      // Detect ENTID env override before envOverride consumes it.
      val entidEnvRaw = RunnerSupport.getenv("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID")
      val idmapOverridden = entidEnvRaw != null && entidEnvRaw.trim().startsWith("{")

      val envm = linkedMapOf<String, Any?>()
      envm["BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"] = idmap
      envm["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"] = "FALSE"
      envm["BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"] = "FALSE"
      envm["BLUEFIN_NETWORK_TOKEN_APIKEY"] = "NONE"
      val env = RunnerSupport.envOverride(envm)

      var idmapResolved = Helpers.toMapAny(env["BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"])
      if (idmapResolved == null) {
        idmapResolved = Helpers.toMapAny(idmap) ?: linkedMapOf()
      }

      val live = "TRUE" == env["BLUEFIN_NETWORK_TOKEN_TEST_LIVE"]
      if (live) {
        val liveOpts = linkedMapOf<String, Any?>()
        liveOpts["apikey"] = env["BLUEFIN_NETWORK_TOKEN_APIKEY"]
        val mergedOpts = Struct.merge(Struct.jt(liveOpts, extra))
        client = BluefinNetworkTokenSDK(Helpers.toMapAny(mergedOpts))
      }

      val setup = RunnerSupport.EntityTestSetup()
      setup.client = client
      setup.data = entityData
      setup.idmap = idmapResolved
      setup.env = env
      setup.explain = "TRUE" == env["BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN"]
      setup.live = live
      setup.syntheticOnly = live && !idmapOverridden
      setup.now = System.currentTimeMillis()
      return setup
    }
  }
}

// Generated basic-flow test for the network_token_bundle entity (model-driven;
// mirrors the java TestEntity generator). A dependency-free scala-cli test
// object driven by SdkEntityTestMain. Runs against the in-memory test
// transport seeded with the shipped NetworkTokenBundleTestData.json fixtures.

import java.util.{ArrayList, LinkedHashMap, List => JList, Map => JMap}

import voxgig.bluefinnetworktokensdk.core.{Helpers, BluefinNetworkTokenSDK}
import voxgig.bluefinnetworktokensdk.utility.struct.Struct

object NetworkTokenBundleEntityTest {

  def run(rep: SdkTestReport): Unit = {
    rep.scope("network_token_bundle.instance") {
      val testsdk = BluefinNetworkTokenSDK.testSDK()
      val ent = testsdk.networkTokenBundle(null)
      rep.check("network_token_bundle.instance", ent != null, "expected non-null network_token_bundle entity")
    }

    rep.scope("network_token_bundle.basic") {
      val entityData = Helpers.toMapAny(SdkTestSupport.readJson(
          "../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json"))
      val options = new LinkedHashMap[String, Object]()
      options.put("entity", entityData.get("existing"))
      val client = BluefinNetworkTokenSDK.testSDK(options, null)

      val idmap = new LinkedHashMap[String, Object]()
      idmap.put("network_token_bundle01", "NETWORK_TOKEN_BUNDLE01")
      idmap.put("network_token_bundle02", "NETWORK_TOKEN_BUNDLE02")
      idmap.put("network_token_bundle03", "NETWORK_TOKEN_BUNDLE03")
      val now = System.currentTimeMillis()

      // CREATE
      val networkTokenBundleRef01Ent = client.networkTokenBundle(null)
      var networkTokenBundleRef01Data = Helpers.toMapAny(Struct.getprop(
          Struct.getpath(entityData, "new.network_token_bundle"), "network_token_bundle_ref01"))
      val networkTokenBundleRef01DataResult = networkTokenBundleRef01Ent.create(networkTokenBundleRef01Data, null)
      networkTokenBundleRef01Data = Helpers.toMapAny(networkTokenBundleRef01DataResult)
      rep.check("network_token_bundle.create.map", networkTokenBundleRef01Data != null, "expected create result to be a map")

      // LOAD
      val networkTokenBundleRef01MatchDt0 = new LinkedHashMap[String, Object]()
      val networkTokenBundleRef01DataDt0Loaded = networkTokenBundleRef01Ent.load(networkTokenBundleRef01MatchDt0, null)
      rep.check("network_token_bundle.load.nonnull", networkTokenBundleRef01DataDt0Loaded != null, "expected load result to be non-null")

      // REMOVE
      val networkTokenBundleRef01MatchRm0 = new LinkedHashMap[String, Object]()
      networkTokenBundleRef01MatchRm0.put("id", networkTokenBundleRef01Data.get("id"))
      networkTokenBundleRef01Ent.remove(networkTokenBundleRef01MatchRm0, null)
    }
  }
}

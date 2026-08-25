// Generated basic-flow test for the network_token_bundle entity (model-driven,
// unit mode; mirrors the rust/go TestEntity generator).

#include "runner_support.hpp"

using namespace sdk;
using namespace sdk::rs;

struct NetworkTokenBundleSetup {
  std::shared_ptr<BluefinNetworkTokenSDK> client;
  Value data;
  Value idmap;
  Value env;
  bool live = false;
  bool synthetic_only = false;
  long long now = 0;
};

static NetworkTokenBundleSetup network_token_bundle_basic_setup(const Value& extra) {
  load_env_local();

  std::string entity_data_file = "../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json";
  Value entity_data = vs::parse_json(read_file(entity_data_file));

  Value options = vmap({{"entity", getp(entity_data, "existing")}});
  auto client = BluefinNetworkTokenSDK::testSDK(options, extra);

  // idmap via transform (upper-cased id name synthetics), matching the donors.
  Value idmap = Struct::transform(
      vlist({Value("network_token_bundle01"), Value("network_token_bundle02"), Value("network_token_bundle03")}),
      vmap({{"`$PACK`", vlist({
        Value(""),
        vmap({
          {"`$KEY`", Value("`$COPY`")},
          {"`$VAL`", vlist({Value("`$FORMAT`"), Value("upper"), Value("`$COPY`")})}
        })
      })}}));
  if (!idmap.is_map()) idmap = vmap();

  Value env = env_override(vmap({
    {"BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID", idmap},
    {"BLUEFIN_NETWORK_TOKEN_TEST_LIVE", Value("FALSE")},
    {"BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN", Value("FALSE")}
  }));

  Value idmap_resolved = Helpers::toMapAny(getp(env, "BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"));
  if (!idmap_resolved.is_map()) idmap_resolved = idmap;

  bool live = getp(env, "BLUEFIN_NETWORK_TOKEN_TEST_LIVE") == Value("TRUE");

  NetworkTokenBundleSetup s;
  s.client = client;
  s.data = entity_data;
  s.idmap = idmap_resolved;
  s.env = env;
  s.live = live;
  s.synthetic_only = false;
  s.now = now_ms();
  return s;
}

static void network_token_bundle_entity_instance() {
  auto testsdk = BluefinNetworkTokenSDK::testSDK();
  auto ent = testsdk->network_token_bundle();
  ASSERT_EQ(ent->getName(), std::string("network_token_bundle"), "entity name");
}


static void network_token_bundle_entity_basic() {
  auto setup = network_token_bundle_basic_setup(Value::undef());
  std::string mode = setup.live ? "live" : "unit";
  for (const std::string& op : std::vector<std::string>{"create", "load", "remove"}) {
    auto sk = is_control_skipped("entityOp", std::string("network_token_bundle.") + op, mode);
    if (sk.first) { std::cerr << "skip: " << (sk.second.empty()? "sdk-test-control.json" : sk.second) << "\n"; return; }
  }
  auto client = setup.client;
  // CREATE
  auto network_token_bundle_ref01_ent = client->network_token_bundle();
  Value network_token_bundle_ref01_data = Helpers::toMapAny(getp(Struct::getpath(setup.data, {"new", "network_token_bundle"}), "network_token_bundle_ref01"));
  if (!network_token_bundle_ref01_data.is_map()) network_token_bundle_ref01_data = vmap();
  {
    Value network_token_bundle_ref01_data_result = network_token_bundle_ref01_ent->create(Struct::clone(network_token_bundle_ref01_data), Value::undef())->data();
    network_token_bundle_ref01_data = Helpers::toMapAny(network_token_bundle_ref01_data_result);
    if (!network_token_bundle_ref01_data.is_map()) network_token_bundle_ref01_data = vmap();
    ASSERT_TRUE(network_token_bundle_ref01_data.is_map(), "expected create result to be a map");
    ASSERT_TRUE(!getp(network_token_bundle_ref01_data, "id").is_undef(), "expected created entity to have an id");
  }

  // LOAD
  Value network_token_bundle_ref01_match_dt0 = vmap({{"id", getp(network_token_bundle_ref01_data, "id")}});
  Value network_token_bundle_ref01_data_dt0_loaded = network_token_bundle_ref01_ent->load(Struct::clone(network_token_bundle_ref01_match_dt0), Value::undef())->data();
  Value network_token_bundle_ref01_data_dt0_load_result = Helpers::toMapAny(network_token_bundle_ref01_data_dt0_loaded);
  ASSERT_TRUE(network_token_bundle_ref01_data_dt0_load_result.is_map(), "expected load result to be a map");
  ASSERT_EQ_VAL(getp(network_token_bundle_ref01_data_dt0_load_result, "id"), getp(network_token_bundle_ref01_data, "id"), "expected load result id to match");

  // REMOVE
  {
    Value network_token_bundle_ref01_match_rm0 = vmap({{"id", getp(network_token_bundle_ref01_data, "id")}});
    network_token_bundle_ref01_ent->remove(Struct::clone(network_token_bundle_ref01_match_rm0), Value::undef());
  }

}

int main() {
  T_RUN(network_token_bundle_entity_instance);
  T_RUN(network_token_bundle_entity_basic);
  return sdktest::summary("network_token_bundle_entity_test");
}

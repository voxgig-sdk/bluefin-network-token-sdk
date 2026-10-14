# NetworkTokenBundle entity test (offline, mock transport)

defmodule BluefinNetworkToken.NetworkTokenBundleEntityTest do
  use ExUnit.Case

  alias Voxgig.Struct, as: S
  alias BluefinNetworkToken.Helpers, as: H
  alias BluefinNetworkToken.Json

  defp fixture do
    Json.parse(File.read!("../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json"))
  end

  defp mk_sdk do
    existing = H.or_(S.getpath(fixture(), "existing"), S.jm([]))
    BluefinNetworkToken.test(S.jm(["entity", existing]))
  end

  defp first_id do
    existing = H.or_(S.getpath(fixture(), "existing.network_token_bundle"), S.jm([]))
    keys = S.keysof(existing)
    if keys == [], do: nil, else: hd(keys)
  end

  test "should create instance" do
    sdk = BluefinNetworkToken.test()
    ent = BluefinNetworkToken.network_token_bundle(sdk)
    assert ent != nil
  end

  test "should load an existing record" do
    id = first_id()

    if id != nil do
      sdk = mk_sdk()
      ent = BluefinNetworkToken.network_token_bundle(sdk)
      loaded = BluefinNetworkToken.Entity.NetworkTokenBundle.load(ent, S.jm(["id", id]))
      rec = BluefinNetworkToken.EntityBase.data_get(loaded)
      assert S.ismap(rec)
      assert S.getprop(rec, "id") == id
    end
  end

  test "should create then read back" do
    sdk = BluefinNetworkToken.test(S.jm(["entity", S.jm(["network_token_bundle", S.jm([])])]))
    ent = BluefinNetworkToken.network_token_bundle(sdk)
    created = BluefinNetworkToken.Entity.NetworkTokenBundle.create(ent, S.jm(["name", "test-create"]))
    made = BluefinNetworkToken.EntityBase.data_get(created)
    assert S.ismap(made)
    assert S.getprop(made, "id") != nil
  end

  test "should refuse an invalid request" do
    if BluefinNetworkToken.FeatureHarness.has_feature("validate") do
      client = BluefinNetworkToken.test(nil, S.jm(["feature", S.jm(["validate", S.jm(["active", true])])]))

      err =
        assert_raise BluefinNetworkToken.Error, fn ->
          BluefinNetworkToken.Entity.NetworkTokenBundle.load(BluefinNetworkToken.network_token_bundle(client), S.jm(["id", 1]))
        end

      assert err.code == "validate_failed"
    end
  end
end

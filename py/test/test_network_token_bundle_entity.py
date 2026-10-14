# NetworkTokenBundle entity test

import json
import os
import time

import pytest

from bluefinnetworktoken_sdk.utility.voxgig_struct import voxgig_struct as vs
from bluefinnetworktoken_sdk import BluefinNetworkTokenSDK
from bluefinnetworktoken_sdk.core import helpers
from bluefinnetworktoken_sdk.config import shared_config
from bluefinnetworktoken_sdk.feature.base_feature import BluefinNetworkTokenBaseFeature

_TEST_DIR = os.path.dirname(os.path.abspath(__file__))
from test import runner



# main.kit.test.live.strict is true (the default is true): a live
# request that fails, or a live test missing an input it needs,
# fails the test.
# An account with no record for a test to read skips it either way.
LIVE_STRICT = True


class TestNetworkTokenBundleEntity:

    def test_should_create_instance(self):
        testsdk = BluefinNetworkTokenSDK.test(None, None)
        ent = testsdk.NetworkTokenBundle(None)
        assert ent is not None

    def test_should_refuse_an_invalid_request(self):
        if "validate" not in (shared_config().get("feature") or {}):
            pytest.skip("feature not present in this SDK: validate")
        client = BluefinNetworkTokenSDK.test(
            None, {"feature": {"validate": {"active": True}}})
        with pytest.raises(Exception) as err:
            client.NetworkTokenBundle(None).load({"id": 1}, None)
        assert "validate_failed" == getattr(err.value, "code", None)

    def test_should_run_basic_flow(self):
        setup = _network_token_bundle_basic_setup(None)
        # Per-op sdk-test-control.json skip — basic test exercises a flow with
        # multiple ops; skipping any one skips the whole flow (steps depend
        # on each other).
        _live = setup.get("live", False)
        for _op in ["create", "load", "remove"]:
            _skip, _reason = runner.is_control_skipped("entityOp", "network_token_bundle." + _op, "live" if _live else "unit")
            if _skip:
                pytest.skip(_reason or "skipped via sdk-test-control.json")
                return
        client = setup["client"]

        # CREATE
        network_token_bundle_ref01_ent = client.NetworkTokenBundle(None)
        network_token_bundle_ref01_data = helpers.to_map(vs.getprop(
            vs.getpath(setup["data"], "new.network_token_bundle"), "network_token_bundle_ref01"))

        network_token_bundle_ref01_data = helpers.to_map(runner.entity_data(network_token_bundle_ref01_ent.create(network_token_bundle_ref01_data, None)))
        assert network_token_bundle_ref01_data is not None
        assert network_token_bundle_ref01_data["id"] is not None

        # LOAD
        network_token_bundle_ref01_match_dt0 = {
            "id": network_token_bundle_ref01_data["id"],
        }
        network_token_bundle_ref01_data_dt0_loaded = network_token_bundle_ref01_ent.load(network_token_bundle_ref01_match_dt0, None)
        network_token_bundle_ref01_data_dt0_load_result = helpers.to_map(runner.entity_data(network_token_bundle_ref01_data_dt0_loaded))
        assert network_token_bundle_ref01_data_dt0_load_result is not None
        assert network_token_bundle_ref01_data_dt0_load_result["id"] == network_token_bundle_ref01_data["id"]

        # REMOVE
        network_token_bundle_ref01_match_rm0 = {
            "id": network_token_bundle_ref01_data["id"],
        }
        network_token_bundle_ref01_ent.remove(network_token_bundle_ref01_match_rm0, None)



def _network_token_bundle_basic_setup(extra):
    runner.load_env_local()

    entity_data_file = os.path.join(_TEST_DIR, "../../.sdk/test/entity/network_token_bundle/NetworkTokenBundleTestData.json")
    with open(entity_data_file, "r", encoding="utf-8") as f:
        entity_data_source = f.read()

    entity_data = json.loads(entity_data_source)

    options = {}
    options["entity"] = entity_data.get("existing")

    client = BluefinNetworkTokenSDK.test(options, extra)

    # Generate idmap via transform.
    idmap = vs.transform(
        ["network_token_bundle01", "network_token_bundle02", "network_token_bundle03"],
        {
            "`$PACK`": ["", {
                "`$KEY`": "`$COPY`",
                "`$VAL`": ["`$FORMAT`", "upper", "`$COPY`"],
            }],
        }
    )

    # Whether *_ENTID supplied the idmap, read before env_override consumes
    # it: without it, the ids a live flow binds are the fixture's synthetic ones.
    _entid_env_raw = os.environ.get(
        "BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID")
    _idmap_overridden = _entid_env_raw is not None and _entid_env_raw.strip().startswith("{")

    env = runner.env_override({
        "BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID": idmap,
        "BLUEFIN_NETWORK_TOKEN_TEST_LIVE": "FALSE",
        "BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN": "FALSE",
        "BLUEFIN_NETWORK_TOKEN_APIKEY": "",
    })

    idmap_resolved = helpers.to_map(
        env.get("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID"))
    if idmap_resolved is None:
        idmap_resolved = helpers.to_map(idmap)

    if env.get("BLUEFIN_NETWORK_TOKEN_TEST_LIVE") == "TRUE":
        merged_opts = vs.merge([
            # FIRST, so the generated fields below win: sdk-test-control.json's
            # test.client.options adds to the live client, it does not
            # redirect it.
            runner.live_client_options(),
            {
                "apikey": env.get("BLUEFIN_NETWORK_TOKEN_APIKEY"),
            },
            extra or {},
        ])
        client = BluefinNetworkTokenSDK(helpers.to_map(merged_opts))

    _live = env.get("BLUEFIN_NETWORK_TOKEN_TEST_LIVE") == "TRUE"
    return {
        "client": client,
        "data": entity_data,
        "idmap": idmap_resolved,
        "env": env,
        "explain": env.get("BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN") == "TRUE",
        "live": _live,
        "synthetic_only": _live and not _idmap_overridden,
        "now": int(time.time() * 1000),
    }

// Generated basic-flow test for the network_token_bundle entity (model-driven;
// mirrors the go TestEntity generator).

#![allow(unused_variables, unused_mut, unused_imports)]

mod common;

use std::rc::Rc;

use common::*;

use bluefin_network_token_sdk::core::helpers::{getp, getpath, ja, jo, now_ms, setp, to_map};
use bluefin_network_token_sdk::utility::voxgigstruct as vs;
use bluefin_network_token_sdk::{test_sdk, Entity, BluefinNetworkTokenEntity, BluefinNetworkTokenSDK, Value};

#[test]
fn network_token_bundle_entity_instance() {
    let testsdk = test_sdk(Value::Noval, Value::Noval);
    let ent = testsdk.network_token_bundle(Value::Noval);
    assert_eq!(ent.get_name(), "network_token_bundle");
}

#[test]
fn network_token_bundle_entity_basic() {
    let setup = network_token_bundle_basic_setup(Value::Noval);
    // Per-op sdk-test-control.json skip — the basic test exercises a flow
    // with multiple ops; skipping any op skips the whole flow.
    let mode = if setup.live { "live" } else { "unit" };
    for op in ["create", "load", "remove"] {
        let (skip, reason) = is_control_skipped("entityOp", &format!("network_token_bundle.{}", op), mode);
        if skip {
            let reason = if reason.is_empty() {
                "skipped via sdk-test-control.json".to_string()
            } else {
                reason
            };
            eprintln!("skip: {}", reason);
            return;
        }
    }
    // The basic flow consumes synthetic IDs from the fixture. In live mode
    // without an *_ENTID env override, those IDs hit the live API and 4xx.
    if setup.synthetic_only {
        eprintln!("skip: live entity test uses synthetic IDs from fixture — set BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID JSON to run live");
        return;
    }
    let client = setup.client.clone();
    // CREATE
    let network_token_bundle_ref01_ent = client.network_token_bundle(Value::Noval);
    let network_token_bundle_ref01_data = to_map(&getp(
        &getpath(&["new", "network_token_bundle"], &setup.data),
        "network_token_bundle_ref01",
    ));

    let network_token_bundle_ref01_data_result = network_token_bundle_ref01_ent
        .create(network_token_bundle_ref01_data.clone(), Value::Noval)
        .expect("create failed");
    let network_token_bundle_ref01_data = to_map(&network_token_bundle_ref01_data_result.data(None));
    assert!(
        matches!(network_token_bundle_ref01_data, Value::Map(_)),
        "expected create result to be a map"
    );
    assert!(
        !getp(&network_token_bundle_ref01_data, "id").is_noval(),
        "expected created entity to have an id"
    );

    // LOAD
    let network_token_bundle_ref01_match_dt0 = jo(vec![("id", getp(&network_token_bundle_ref01_data, "id"))]);
    let network_token_bundle_ref01_data_dt0_loaded = network_token_bundle_ref01_ent
        .load(network_token_bundle_ref01_match_dt0.clone(), Value::Noval)
        .expect("load failed");
    let network_token_bundle_ref01_data_dt0_load_result = to_map(&network_token_bundle_ref01_data_dt0_loaded.data(None));
    assert!(
        matches!(network_token_bundle_ref01_data_dt0_load_result, Value::Map(_)),
        "expected load result to be a map"
    );
    assert_eq!(
        getp(&network_token_bundle_ref01_data_dt0_load_result, "id"),
        getp(&network_token_bundle_ref01_data, "id"),
        "expected load result id to match"
    );

    // REMOVE
    let network_token_bundle_ref01_match_rm0 = jo(vec![("id", getp(&network_token_bundle_ref01_data, "id"))]);
    network_token_bundle_ref01_ent
        .remove(network_token_bundle_ref01_match_rm0.clone(), Value::Noval)
        .expect("remove failed");

}

fn network_token_bundle_basic_setup(extra: Value) -> EntityTestSetup {
    load_env_local();

    let mut entity_data_file = manifest_dir();
    entity_data_file.push("..");
    entity_data_file.push(".sdk");
    entity_data_file.push("test");
    entity_data_file.push("entity");
    entity_data_file.push("network_token_bundle");
    entity_data_file.push("NetworkTokenBundleTestData.json");

    let entity_data = read_json(&entity_data_file);

    let options = jo(vec![("entity", getp(&entity_data, "existing"))]);

    let client = test_sdk(options, extra.clone());

    // Generate idmap via transform, matching the TS pattern.
    let idmap = vs::transform(
        &ja(vec![Value::str("network_token_bundle01"), Value::str("network_token_bundle02"), Value::str("network_token_bundle03")]),
        &jo(vec![(
            "`$PACK`",
            ja(vec![
                Value::str(""),
                jo(vec![
                    ("`$KEY`", Value::str("`$COPY`")),
                    (
                        "`$VAL`",
                        ja(vec![
                            Value::str("`$FORMAT`"),
                            Value::str("upper"),
                            Value::str("`$COPY`"),
                        ]),
                    ),
                ]),
            ]),
        )]),
        None,
    )
    .unwrap_or_else(|_| Value::empty_map());

    // Detect ENTID env override before env_override consumes it. When live
    // mode is on without a real override, the basic test runs against
    // synthetic IDs from the fixture and 4xx's.
    let entid_env_raw = std::env::var("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID").unwrap_or_default();
    let idmap_overridden =
        !entid_env_raw.trim().is_empty() && entid_env_raw.trim().starts_with('{');

    let env = env_override(jo(vec![
        ("BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID", idmap.clone()),
        ("BLUEFIN_NETWORK_TOKEN_TEST_LIVE", Value::str("FALSE")),
        ("BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN", Value::str("FALSE")),
        ("BLUEFIN_NETWORK_TOKEN_APIKEY", Value::str("")),
    ]));

    let idmap_resolved = match to_map(&getp(&env, "BLUEFIN_NETWORK_TOKEN_TEST_NETWORK_TOKEN_BUNDLE_ENTID")) {
        Value::Map(m) => Value::Map(m),
        _ => to_map(&idmap),
    };

    let live = getp(&env, "BLUEFIN_NETWORK_TOKEN_TEST_LIVE") == Value::str("TRUE");

    let client = if live {
        let merged = vs::merge(
            // live_client_options() FIRST, so the generated entries below win:
            // sdk-test-control.json's test.client.options adds to the live
            // client, it does not redirect it.
            &ja(vec![
                live_client_options(),
                jo(vec![("apikey", getp(&env, "BLUEFIN_NETWORK_TOKEN_APIKEY"))]),
                // A NON-NODE later entry REPLACES the accumulated map in
                // vs::merge, and the normal call passes Value::Noval - so a
                // a bare extra discarded live_client_options() and the
                // apikey/server map above it, and the live client was
                // constructed with nothing.
                match extra {
                    Value::Map(m) => Value::Map(m),
                    _ => Value::empty_map(),
                },
            ]),
            None,
        );
        BluefinNetworkTokenSDK::new(to_map(&merged))
    } else {
        client
    };

    EntityTestSetup {
        client,
        data: entity_data,
        idmap: idmap_resolved,
        env: env.clone(),
        explain: getp(&env, "BLUEFIN_NETWORK_TOKEN_TEST_EXPLAIN") == Value::str("TRUE"),
        live,
        synthetic_only: live && !idmap_overridden,
        now: now_ms(),
    }
}

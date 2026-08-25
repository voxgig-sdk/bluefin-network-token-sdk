(* Generated network_token_bundle entity test. *)

open Voxgig_struct
open Sdk_types
open Sdk_helpers
open Testutil

let () =
  test "network_token_bundle.entity_instance" (fun () ->
      let client = Sdk_client.test () in
      let ent = Sdk_client.network_token_bundle client Noval in
      check_str "name" ent.e_name "network_token_bundle")

let () =
  test "network_token_bundle.seeded_ops" (fun () ->
      let record = jo [("id", Str "network_token_bundle01")] in
      let seed = jo [("network_token_bundle",
                      jo [("network_token_bundle01", record)])] in
      let client = Sdk_client.test_with (jo [("entity", seed)]) Noval in
      let ent = Sdk_client.network_token_bundle client Noval in
      ignore ent;
      let loaded = ent.e_load (jo [("id", Str "network_token_bundle01")]) Noval in
      let loaded_data = loaded.e_data_get () in
      check "load data is a map" (ismap loaded_data);
      check_vstr "load id" (getp loaded_data "id") "network_token_bundle01";
      ())

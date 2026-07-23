// Generated instance test for the network_token_bundle entity.

#include "ctest.h"

int main(void) {
  BluefinNetworkTokenSDK* sdk = test_sdk(NULL, NULL);
  CHECK(sdk != NULL, "sdk constructed");

  Entity* e = bluefinnetworktoken_network_token_bundle(sdk, NULL);
  CHECK(e != NULL, "entity instance");
  CHECK_STR_EQ(e->vt->get_name(e), "network_token_bundle", "entity get_name");

  TEST_SUMMARY("network_token_bundle_entity");
}

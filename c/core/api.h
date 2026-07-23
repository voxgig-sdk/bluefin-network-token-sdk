// BluefinNetworkToken SDK public API (generated).

#ifndef BLUEFIN_NETWORK_TOKEN_API_H
#define BLUEFIN_NETWORK_TOKEN_API_H

#include "sdk.h"

// NetworkTokenBundle entity.
Entity* network_token_bundle_entity_new(BluefinNetworkTokenSDK* client, voxgig_value* entopts);
Entity* bluefin_network_token_network_token_bundle(BluefinNetworkTokenSDK* client, voxgig_value* entopts);
voxgig_value* network_token_bundle_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFIN_NETWORK_TOKEN_API_H

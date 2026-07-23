// BluefinNetworkToken SDK public API (generated).

#ifndef BLUEFINNETWORKTOKEN_API_H
#define BLUEFINNETWORKTOKEN_API_H

#include "sdk.h"

// NetworkTokenBundle entity.
Entity* network_token_bundle_entity_new(BluefinNetworkTokenSDK* client, voxgig_value* entopts);
Entity* bluefinnetworktoken_network_token_bundle(BluefinNetworkTokenSDK* client, voxgig_value* entopts);
voxgig_value* network_token_bundle_stream(Entity* e, const char* action, voxgig_value* args, voxgig_value* callopts, PNError** err);

#endif // BLUEFINNETWORKTOKEN_API_H

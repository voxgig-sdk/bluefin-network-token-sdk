import { BluefinNetworkTokenEntityBase } from '../BluefinNetworkTokenEntityBase';
import type { BluefinNetworkTokenSDK } from '../BluefinNetworkTokenSDK';
import type { Control } from '../types';
import type { NetworkTokenBundle, NetworkTokenBundleLoadMatch, NetworkTokenBundleCreateData, NetworkTokenBundleRemoveMatch } from '../BluefinNetworkTokenTypes';
declare class NetworkTokenBundleEntity extends BluefinNetworkTokenEntityBase<NetworkTokenBundle> {
    constructor(client: BluefinNetworkTokenSDK, entopts: any);
    make(this: NetworkTokenBundleEntity): NetworkTokenBundleEntity;
    load(this: any, reqmatch?: NetworkTokenBundleLoadMatch, ctrl?: Control): Promise<NetworkTokenBundleEntity>;
    create(this: any, reqdata?: NetworkTokenBundleCreateData, ctrl?: Control): Promise<NetworkTokenBundleEntity>;
    remove(this: any, reqmatch?: NetworkTokenBundleRemoveMatch, ctrl?: Control): Promise<NetworkTokenBundleEntity>;
}
export { NetworkTokenBundleEntity };

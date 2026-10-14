import { NetworkTokenBundleEntity } from './entity/NetworkTokenBundleEntity';
export type * from './BluefinNetworkTokenTypes';
import { inspect } from 'node:util';
import type { Context, Feature } from './types';
import { config } from './Config';
import { BluefinNetworkTokenEntityBase } from './BluefinNetworkTokenEntityBase';
import { Utility } from './utility/Utility';
import { BaseFeature } from './feature/base/BaseFeature';
declare const stdutil: Utility;
type DirectResult = {
    ok: false;
    err: any;
    status?: undefined;
    headers?: undefined;
    data?: undefined;
} | {
    ok: boolean;
    status: number;
    headers: any;
    data: any;
    err?: any;
};
declare class BluefinNetworkTokenSDK {
    _mode: string;
    _options: any;
    _utility: Utility;
    _features: Feature[];
    _rootctx: Context;
    constructor(options?: any);
    options(): any;
    utility(): any;
    prepare(fetchargs?: any): Promise<any>;
    direct(fetchargs?: any): Promise<DirectResult>;
    _rawRequest(fetchargs?: any): Promise<DirectResult>;
    graphql(query: string, variables?: any, ctrl?: any): Promise<any>;
    NetworkTokenBundle(entopts?: Record<string, any>): NetworkTokenBundleEntity;
    static test(testoptsarg?: any, sdkoptsarg?: any): BluefinNetworkTokenSDK;
    tester(testopts?: any, sdkopts?: any): BluefinNetworkTokenSDK;
    toJSON(): {
        name: string;
    };
    toString(): string;
    [inspect.custom](): string;
}
declare const SDK: typeof BluefinNetworkTokenSDK;
export { stdutil, config, BaseFeature, BluefinNetworkTokenEntityBase, BluefinNetworkTokenSDK, SDK, };
export type { DirectResult };

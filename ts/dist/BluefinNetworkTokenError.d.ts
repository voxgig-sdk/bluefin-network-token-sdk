import { Context } from './Context';
declare class BluefinNetworkTokenError extends Error {
    isBluefinNetworkTokenError: boolean;
    sdk: string;
    code: string;
    ctx: Context;
    status: number;
    get notFound(): boolean;
    constructor(code: string, msg: string, ctx: Context);
}
export { BluefinNetworkTokenError };

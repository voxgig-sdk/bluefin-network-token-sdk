"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.BluefinNetworkTokenError = void 0;
class BluefinNetworkTokenError extends Error {
    isBluefinNetworkTokenError = true;
    sdk = 'BluefinNetworkToken';
    code;
    ctx;
    status = -1;
    // `err.notFound` rather than a magic number at every call site.
    get notFound() { return 404 === this.status; }
    constructor(code, msg, ctx) {
        super(msg);
        this.code = code;
        this.ctx = ctx;
    }
}
exports.BluefinNetworkTokenError = BluefinNetworkTokenError;
//# sourceMappingURL=BluefinNetworkTokenError.js.map
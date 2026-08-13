# BluefinNetworkToken SDK utility: make_context

from bluefinnetworktoken_sdk.core.context import BluefinNetworkTokenContext


def make_context_util(ctxmap, basectx):
    return BluefinNetworkTokenContext(ctxmap, basectx)

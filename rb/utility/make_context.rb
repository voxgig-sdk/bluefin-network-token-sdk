# BluefinNetworkToken SDK utility: make_context
require_relative '../core/context'
module BluefinNetworkTokenUtilities
  MakeContext = ->(ctxmap, basectx) {
    BluefinNetworkTokenContext.new(ctxmap, basectx)
  }
end

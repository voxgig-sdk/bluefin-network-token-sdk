# BluefinNetworkToken SDK utility: prepare_body
require_relative 'media'
module BluefinNetworkTokenUtilities
  PrepareBody = ->(ctx) {
    return nil unless ctx.op.input == "data"
    return BluefinNetworkTokenUtilities.raw_body(ctx.reqdata) if BluefinNetworkTokenUtilities.raw_request?(ctx.point)
    ctx.utility.transform_request.call(ctx)
  }
end

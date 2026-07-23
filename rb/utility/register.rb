# BluefinNetworkToken SDK utility registration
require_relative '../core/utility_type'
require_relative 'clean'
require_relative 'done'
require_relative 'make_error'
require_relative 'feature_add'
require_relative 'feature_hook'
require_relative 'feature_init'
require_relative 'fetcher'
require_relative 'make_fetch_def'
require_relative 'make_context'
require_relative 'make_options'
require_relative 'make_request'
require_relative 'make_response'
require_relative 'make_result'
require_relative 'make_point'
require_relative 'make_spec'
require_relative 'make_url'
require_relative 'param'
require_relative 'prepare_auth'
require_relative 'prepare_body'
require_relative 'prepare_headers'
require_relative 'prepare_method'
require_relative 'prepare_params'
require_relative 'prepare_path'
require_relative 'prepare_query'
require_relative 'result_basic'
require_relative 'result_body'
require_relative 'result_headers'
require_relative 'transform_request'
require_relative 'transform_response'

BluefinNetworkTokenUtility.registrar = ->(u) {
  u.clean = BluefinNetworkTokenUtilities::Clean
  u.done = BluefinNetworkTokenUtilities::Done
  u.make_error = BluefinNetworkTokenUtilities::MakeError
  u.feature_add = BluefinNetworkTokenUtilities::FeatureAdd
  u.feature_hook = BluefinNetworkTokenUtilities::FeatureHook
  u.feature_init = BluefinNetworkTokenUtilities::FeatureInit
  u.fetcher = BluefinNetworkTokenUtilities::Fetcher
  u.make_fetch_def = BluefinNetworkTokenUtilities::MakeFetchDef
  u.make_context = BluefinNetworkTokenUtilities::MakeContext
  u.make_options = BluefinNetworkTokenUtilities::MakeOptions
  u.make_request = BluefinNetworkTokenUtilities::MakeRequest
  u.make_response = BluefinNetworkTokenUtilities::MakeResponse
  u.make_result = BluefinNetworkTokenUtilities::MakeResult
  u.make_point = BluefinNetworkTokenUtilities::MakePoint
  u.make_spec = BluefinNetworkTokenUtilities::MakeSpec
  u.make_url = BluefinNetworkTokenUtilities::MakeUrl
  u.param = BluefinNetworkTokenUtilities::Param
  u.prepare_auth = BluefinNetworkTokenUtilities::PrepareAuth
  u.prepare_body = BluefinNetworkTokenUtilities::PrepareBody
  u.prepare_headers = BluefinNetworkTokenUtilities::PrepareHeaders
  u.prepare_method = BluefinNetworkTokenUtilities::PrepareMethod
  u.prepare_params = BluefinNetworkTokenUtilities::PrepareParams
  u.prepare_path = BluefinNetworkTokenUtilities::PreparePath
  u.prepare_query = BluefinNetworkTokenUtilities::PrepareQuery
  u.result_basic = BluefinNetworkTokenUtilities::ResultBasic
  u.result_body = BluefinNetworkTokenUtilities::ResultBody
  u.result_headers = BluefinNetworkTokenUtilities::ResultHeaders
  u.transform_request = BluefinNetworkTokenUtilities::TransformRequest
  u.transform_response = BluefinNetworkTokenUtilities::TransformResponse
}

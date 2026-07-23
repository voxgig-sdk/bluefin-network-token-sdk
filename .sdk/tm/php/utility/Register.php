<?php
declare(strict_types=1);

// BluefinNetworkToken SDK utility registration

require_once __DIR__ . '/../core/UtilityType.php';
require_once __DIR__ . '/Clean.php';
require_once __DIR__ . '/Done.php';
require_once __DIR__ . '/MakeError.php';
require_once __DIR__ . '/FeatureAdd.php';
require_once __DIR__ . '/FeatureHook.php';
require_once __DIR__ . '/FeatureInit.php';
require_once __DIR__ . '/Fetcher.php';
require_once __DIR__ . '/MakeFetchDef.php';
require_once __DIR__ . '/MakeContext.php';
require_once __DIR__ . '/MakeOptions.php';
require_once __DIR__ . '/MakeRequest.php';
require_once __DIR__ . '/MakeResponse.php';
require_once __DIR__ . '/MakeResult.php';
require_once __DIR__ . '/MakePoint.php';
require_once __DIR__ . '/MakeSpec.php';
require_once __DIR__ . '/MakeUrl.php';
require_once __DIR__ . '/Param.php';
require_once __DIR__ . '/PrepareAuth.php';
require_once __DIR__ . '/PrepareBody.php';
require_once __DIR__ . '/PrepareHeaders.php';
require_once __DIR__ . '/PrepareMethod.php';
require_once __DIR__ . '/PrepareParams.php';
require_once __DIR__ . '/PreparePath.php';
require_once __DIR__ . '/PrepareQuery.php';
require_once __DIR__ . '/ResultBasic.php';
require_once __DIR__ . '/ResultBody.php';
require_once __DIR__ . '/ResultHeaders.php';
require_once __DIR__ . '/TransformRequest.php';
require_once __DIR__ . '/TransformResponse.php';

BluefinNetworkTokenUtility::setRegistrar(function (BluefinNetworkTokenUtility $u): void {
    $u->clean = [BluefinNetworkTokenClean::class, 'call'];
    $u->done = [BluefinNetworkTokenDone::class, 'call'];
    $u->make_error = [BluefinNetworkTokenMakeError::class, 'call'];
    $u->feature_add = [BluefinNetworkTokenFeatureAdd::class, 'call'];
    $u->feature_hook = [BluefinNetworkTokenFeatureHook::class, 'call'];
    $u->feature_init = [BluefinNetworkTokenFeatureInit::class, 'call'];
    $u->fetcher = [BluefinNetworkTokenFetcher::class, 'call'];
    $u->make_fetch_def = [BluefinNetworkTokenMakeFetchDef::class, 'call'];
    $u->make_context = [BluefinNetworkTokenMakeContext::class, 'call'];
    $u->make_options = [BluefinNetworkTokenMakeOptions::class, 'call'];
    $u->make_request = [BluefinNetworkTokenMakeRequest::class, 'call'];
    $u->make_response = [BluefinNetworkTokenMakeResponse::class, 'call'];
    $u->make_result = [BluefinNetworkTokenMakeResult::class, 'call'];
    $u->make_point = [BluefinNetworkTokenMakePoint::class, 'call'];
    $u->make_spec = [BluefinNetworkTokenMakeSpec::class, 'call'];
    $u->make_url = [BluefinNetworkTokenMakeUrl::class, 'call'];
    $u->param = [BluefinNetworkTokenParam::class, 'call'];
    $u->prepare_auth = [BluefinNetworkTokenPrepareAuth::class, 'call'];
    $u->prepare_body = [BluefinNetworkTokenPrepareBody::class, 'call'];
    $u->prepare_headers = [BluefinNetworkTokenPrepareHeaders::class, 'call'];
    $u->prepare_method = [BluefinNetworkTokenPrepareMethod::class, 'call'];
    $u->prepare_params = [BluefinNetworkTokenPrepareParams::class, 'call'];
    $u->prepare_path = [BluefinNetworkTokenPreparePath::class, 'call'];
    $u->prepare_query = [BluefinNetworkTokenPrepareQuery::class, 'call'];
    $u->result_basic = [BluefinNetworkTokenResultBasic::class, 'call'];
    $u->result_body = [BluefinNetworkTokenResultBody::class, 'call'];
    $u->result_headers = [BluefinNetworkTokenResultHeaders::class, 'call'];
    $u->transform_request = [BluefinNetworkTokenTransformRequest::class, 'call'];
    $u->transform_response = [BluefinNetworkTokenTransformResponse::class, 'call'];
});

<?php
declare(strict_types=1);

// BluefinNetworkToken SDK utility: result_headers

class BluefinNetworkTokenResultHeaders
{
    public static function call(BluefinNetworkTokenContext $ctx): ?BluefinNetworkTokenResult
    {
        $response = $ctx->response;
        $result = $ctx->result;
        if ($result) {
            if ($response && is_array($response->headers)) {
                $result->headers = $response->headers;
            } else {
                $result->headers = [];
            }
        }
        return $result;
    }
}

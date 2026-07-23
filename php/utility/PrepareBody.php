<?php
declare(strict_types=1);

// BluefinNetworkToken SDK utility: prepare_body

class BluefinNetworkTokenPrepareBody
{
    public static function call(BluefinNetworkTokenContext $ctx): mixed
    {
        if ($ctx->op->input === 'data') {
            return ($ctx->utility->transform_request)($ctx);
        }
        return null;
    }
}

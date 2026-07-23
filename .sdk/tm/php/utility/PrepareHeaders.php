<?php
declare(strict_types=1);

// BluefinNetworkToken SDK utility: prepare_headers

class BluefinNetworkTokenPrepareHeaders
{
    public static function call(BluefinNetworkTokenContext $ctx): array
    {
        $options = $ctx->client->options_map();
        $headers = \Voxgig\Struct\Struct::getprop($options, 'headers');
        if (!$headers) {
            return [];
        }
        $out = \Voxgig\Struct\Struct::clone($headers);
        return is_array($out) ? $out : [];
    }
}

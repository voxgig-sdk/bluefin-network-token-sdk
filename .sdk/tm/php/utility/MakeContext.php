<?php
declare(strict_types=1);

// BluefinNetworkToken SDK utility: make_context

require_once __DIR__ . '/../core/Context.php';

class BluefinNetworkTokenMakeContext
{
    public static function call(array $ctxmap, ?BluefinNetworkTokenContext $basectx): BluefinNetworkTokenContext
    {
        return new BluefinNetworkTokenContext($ctxmap, $basectx);
    }
}

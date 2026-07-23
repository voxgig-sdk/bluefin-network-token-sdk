<?php
declare(strict_types=1);

// BluefinNetworkToken SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';


class BluefinNetworkTokenFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinNetworkTokenBaseFeature();
            case "test":
                return new BluefinNetworkTokenTestFeature();
            default:
                return new BluefinNetworkTokenBaseFeature();
        }
    }
}

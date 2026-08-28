<?php
declare(strict_types=1);

// BluefinNetworkToken SDK feature factory

require_once __DIR__ . '/feature/BaseFeature.php';
require_once __DIR__ . '/feature/AuditFeature.php';
require_once __DIR__ . '/feature/ClienttrackFeature.php';
require_once __DIR__ . '/feature/IdempotencyFeature.php';
require_once __DIR__ . '/feature/LogFeature.php';
require_once __DIR__ . '/feature/MetricsFeature.php';
require_once __DIR__ . '/feature/PagingFeature.php';
require_once __DIR__ . '/feature/RatelimitFeature.php';
require_once __DIR__ . '/feature/RetryFeature.php';
require_once __DIR__ . '/feature/TelemetryFeature.php';
require_once __DIR__ . '/feature/TestFeature.php';
require_once __DIR__ . '/feature/TimeoutFeature.php';


class BluefinNetworkTokenFeatures
{
    public static function make_feature(string $name)
    {
        switch ($name) {
            case "base":
                return new BluefinNetworkTokenBaseFeature();
            case "audit":
                return new BluefinNetworkTokenAuditFeature();
            case "clienttrack":
                return new BluefinNetworkTokenClienttrackFeature();
            case "idempotency":
                return new BluefinNetworkTokenIdempotencyFeature();
            case "log":
                return new BluefinNetworkTokenLogFeature();
            case "metrics":
                return new BluefinNetworkTokenMetricsFeature();
            case "paging":
                return new BluefinNetworkTokenPagingFeature();
            case "ratelimit":
                return new BluefinNetworkTokenRatelimitFeature();
            case "retry":
                return new BluefinNetworkTokenRetryFeature();
            case "telemetry":
                return new BluefinNetworkTokenTelemetryFeature();
            case "test":
                return new BluefinNetworkTokenTestFeature();
            case "timeout":
                return new BluefinNetworkTokenTimeoutFeature();
            default:
                return new BluefinNetworkTokenBaseFeature();
        }
    }

    /**
     * Does a generated feature class back this name? False for a name only
     * an options extend instance can supply (the station adopt path) - the
     * constructor uses this to skip make_feature for such names instead of
     * adding a stray BaseFeature.
     */
    public static function has_feature(string $name): bool
    {
        switch ($name) {
            case "base":
            case "audit":
            case "clienttrack":
            case "idempotency":
            case "log":
            case "metrics":
            case "paging":
            case "ratelimit":
            case "retry":
            case "telemetry":
            case "test":
            case "timeout":
                return true;
            default:
                return false;
        }
    }
}

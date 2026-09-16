# BluefinNetworkToken SDK feature factory

from bluefinnetworktoken_sdk.feature.base_feature import BluefinNetworkTokenBaseFeature
from bluefinnetworktoken_sdk.feature.audit_feature import BluefinNetworkTokenAuditFeature
from bluefinnetworktoken_sdk.feature.clienttrack_feature import BluefinNetworkTokenClienttrackFeature
from bluefinnetworktoken_sdk.feature.debug_feature import BluefinNetworkTokenDebugFeature
from bluefinnetworktoken_sdk.feature.idempotency_feature import BluefinNetworkTokenIdempotencyFeature
from bluefinnetworktoken_sdk.feature.log_feature import BluefinNetworkTokenLogFeature
from bluefinnetworktoken_sdk.feature.metrics_feature import BluefinNetworkTokenMetricsFeature
from bluefinnetworktoken_sdk.feature.paging_feature import BluefinNetworkTokenPagingFeature
from bluefinnetworktoken_sdk.feature.ratelimit_feature import BluefinNetworkTokenRatelimitFeature
from bluefinnetworktoken_sdk.feature.retry_feature import BluefinNetworkTokenRetryFeature
from bluefinnetworktoken_sdk.feature.telemetry_feature import BluefinNetworkTokenTelemetryFeature
from bluefinnetworktoken_sdk.feature.test_feature import BluefinNetworkTokenTestFeature
from bluefinnetworktoken_sdk.feature.timeout_feature import BluefinNetworkTokenTimeoutFeature


_FEATURES = {
    "base": lambda: BluefinNetworkTokenBaseFeature(),
    "audit": lambda: BluefinNetworkTokenAuditFeature(),
    "clienttrack": lambda: BluefinNetworkTokenClienttrackFeature(),
    "debug": lambda: BluefinNetworkTokenDebugFeature(),
    "idempotency": lambda: BluefinNetworkTokenIdempotencyFeature(),
    "log": lambda: BluefinNetworkTokenLogFeature(),
    "metrics": lambda: BluefinNetworkTokenMetricsFeature(),
    "paging": lambda: BluefinNetworkTokenPagingFeature(),
    "ratelimit": lambda: BluefinNetworkTokenRatelimitFeature(),
    "retry": lambda: BluefinNetworkTokenRetryFeature(),
    "telemetry": lambda: BluefinNetworkTokenTelemetryFeature(),
    "test": lambda: BluefinNetworkTokenTestFeature(),
    "timeout": lambda: BluefinNetworkTokenTimeoutFeature(),
}


def _make_feature(name):
    factory = _FEATURES.get(name)
    if factory is not None:
        return factory()
    return _FEATURES["base"]()


# True when this SDK was generated with the named feature class - the
# constructor's tolerance for extend-carried features reads this (an
# active name with no generated class must not become a BaseFeature
# stray when an extend instance carries it).
def _has_feature(name):
    return name in _FEATURES

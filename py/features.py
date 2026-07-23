# BluefinNetworkToken SDK feature factory

from feature.base_feature import BluefinNetworkTokenBaseFeature
from feature.test_feature import BluefinNetworkTokenTestFeature


def _make_feature(name):
    features = {
        "base": lambda: BluefinNetworkTokenBaseFeature(),
        "test": lambda: BluefinNetworkTokenTestFeature(),
    }
    factory = features.get(name)
    if factory is not None:
        return factory()
    return features["base"]()

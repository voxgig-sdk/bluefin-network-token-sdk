# ProjectName SDK exists test

import pytest
from bluefinnetworktoken_sdk import BluefinNetworkTokenSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = BluefinNetworkTokenSDK.test(None, None)
        assert testsdk is not None

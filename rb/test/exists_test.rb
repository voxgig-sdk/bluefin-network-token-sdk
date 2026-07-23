# BluefinNetworkToken SDK exists test

require "minitest/autorun"
require_relative "../BluefinNetworkToken_sdk"

class ExistsTest < Minitest::Test
  def test_create_test_sdk
    testsdk = BluefinNetworkTokenSDK.test(nil, nil)
    assert !testsdk.nil?
  end
end

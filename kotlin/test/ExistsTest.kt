package voxgig.bluefinnetworktokensdk.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import voxgig.bluefinnetworktokensdk.core.BluefinNetworkTokenSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinNetworkTokenSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}

package KOTLINPACKAGE.sdktest

import org.junit.jupiter.api.Assertions.assertNotNull
import org.junit.jupiter.api.Test

import KOTLINPACKAGE.core.BluefinNetworkTokenSDK

class ExistsTest {

  @Test
  fun testMode() {
    val testsdk = BluefinNetworkTokenSDK.testSDK()
    assertNotNull(testsdk, "expected non-nil SDK")
  }
}

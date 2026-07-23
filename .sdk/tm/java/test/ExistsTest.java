package JAVAPACKAGE.sdktest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Test;

import JAVAPACKAGE.core.BluefinNetworkTokenSDK;

public class ExistsTest {

  @Test
  public void testMode() {
    BluefinNetworkTokenSDK testsdk = BluefinNetworkTokenSDK.testSDK();
    assertNotNull(testsdk, "expected non-nil SDK");
  }
}

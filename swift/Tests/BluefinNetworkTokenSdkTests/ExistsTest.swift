// BluefinNetworkToken SDK exists test.

import XCTest

@testable import BluefinNetworkTokenSdk

final class ExistsTest: XCTestCase {
  func testMode() {
    let testsdk = BluefinNetworkTokenSDK.testSDK(nil, nil)
    XCTAssertEqual(testsdk.mode, "test")
  }
}

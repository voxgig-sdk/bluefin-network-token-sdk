// network_token_bundle entity test (generated from the API model).

import XCTest

@testable import BluefinNetworkTokenSdk

final class NetworkTokenBundleEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinNetworkTokenSDK.testSDK(nil, nil)
    let ent = sdk.NetworkTokenBundle()
    XCTAssertEqual(ent.getName(), "network_token_bundle")
  }
}

// network_token_bundle entity test (generated from the API model).

import XCTest

@testable import BluefinNetworkTokenSdk

final class NetworkTokenBundleEntityTest: XCTestCase {
  func testInstance() {
    let sdk = BluefinNetworkTokenSDK.testSDK(nil, nil)
    let ent = sdk.NetworkTokenBundle()
    XCTAssertEqual(ent.getName(), "network_token_bundle")
  }

  // An invalid request fails with validate's own error, before it is sent.
  func testValidate() throws {
    try XCTSkipUnless(NetworkTokenBundleEntityTest.hasFeature("validate"), "feature not present in this SDK: validate")
    let client = BluefinNetworkTokenSDK.testSDK(nil, vm(("feature", .map(vm(("validate", .map(vm(("active", .bool(true))))))))))
    var err: Error? = nil
    do { _ = try client.NetworkTokenBundle().load(vm(("id", .int(1))), nil) } catch { err = error }
    XCTAssertEqual((err as? BluefinNetworkTokenError)?.code, "validate_failed",
      "expected validate_failed, got \(String(describing: err))")
  }

  // True when this SDK was generated with the named feature.
  static func hasFeature(_ name: String) -> Bool {
    gp(SdkConfig.makeConfig(), "feature").asMap?.entries[name] != nil
  }
}

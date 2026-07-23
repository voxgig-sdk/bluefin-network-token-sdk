// swift-tools-version:5.9
//
// BluefinNetworkToken SDK - SwiftPM manifest. Zero runtime dependencies (Foundation +
// the vendored Voxgig Struct port under Sources/ProjectNameSDK/Struct).
import PackageDescription

let package = Package(
    name: "BluefinNetworkTokenSdk",
    products: [
        .library(name: "BluefinNetworkTokenSdk", targets: ["BluefinNetworkTokenSdk"]),
    ],
    targets: [
        .target(
            name: "BluefinNetworkTokenSdk",
            path: "Sources/ProjectNameSDK"),
        .testTarget(
            name: "BluefinNetworkTokenSdkTests",
            dependencies: ["BluefinNetworkTokenSdk"],
            path: "Tests/ProjectNameSDKTests"),
    ]
)

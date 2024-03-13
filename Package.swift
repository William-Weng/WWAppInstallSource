// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWAppInstallSource",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(name: "WWAppInstallSource", targets: ["WWAppInstallSource"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "WWAppInstallSource", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

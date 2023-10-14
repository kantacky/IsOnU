// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "IsOnU",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "IsOnU", targets: ["IsOnU"]),
    ],
    targets: [
        .target(name: "IsOnU"),
        .testTarget(
            name: "IsOnUTests",
            dependencies: ["IsOnU"]
        ),
    ]
)

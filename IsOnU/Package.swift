// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "IsOnU",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Assets", targets: ["Assets"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "IsOnU", targets: ["IsOnU"]),
        .library(name: "AnonymousClient", targets: ["AnonymousClient"]),
        .library(name: "FirebaseError", targets: ["FirebaseError"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk.git", .upToNextMajor(from: "10.16.0")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", exact: "1.2.0"),
        .package(url: "https://github.com/apple/swift-algorithms.git", exact: "1.1.0"),
        .package(url: "https://github.com/pointfreeco/swift-case-paths", exact: "1.0.0"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", exact: "1.0.0"),
    ],
    targets: [
        .target(
            name: "AnonymousClient",
            dependencies: [
                "FirebaseError",
                .dependencies,
                .firebaseAuth
            ]
        ),
        .target(name: "Assets"),
        .target(
            name: "FirebaseError",
            dependencies: [
                .firebaseAuth,
                .firebaseFirestore
            ]
        ),
        .target(name: "Models"),
        .target(
            name: "IsOnU",
            dependencies: [
                "Assets",
                .composableArchitecture,
                .firebaseAuth,
            ],
            resources: [
                .process("./GoogleService-Info.plist"),
            ]
        ),
        .testTarget(
            name: "IsOnUTests",
            dependencies: ["IsOnU"]
        ),
    ]
)

extension Target.Dependency {
    static var algorithms: Self { .product(name: "Algorithms", package: "swift-algorithms") }
    static var composableArchitecture: Self { .product(name: "ComposableArchitecture", package: "swift-composable-architecture") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var firebaseAuth: Self { .product(name: "FirebaseAuth", package: "firebase-ios-sdk") }
    static var firebaseFirestore: Self { .product(name: "FirebaseFirestore", package: "firebase-ios-sdk") }
}

// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "IsOnU",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "Models", targets: ["Models"]),
        .library(name: "IsOnU", targets: ["IsOnU"]),
        .library(name: "AnonymousClient", targets: ["AnonymousClient"]),
        .library(name: "FirebaseError", targets: ["FirebaseError"]),
        .library(name: "ShakingClient", targets: ["ShakingClient"]),
        .library(name: "PersistableTimerClient", targets: ["PersistableTimerClient"])
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
            name: "Models"
        ),
        .target(
            name: "IsOnU",
            dependencies: [
                "ShakingClient",
                .product(name: "FirebaseAuth", package: "firebase-ios-sdk"),
            ],
            resources: [
                .process("./GoogleService-Info.plist"),
            ]
        ),
        .target(
            name: "AnonymousClient",
            dependencies: [
                "FirebaseError",
                .dependencies,
                .firebaseAuth
            ]
        ),
        .target(
            name: "FirebaseError",
            dependencies: [
                .firebaseAuth,
                .firebaseFirestore
            ]
        ),
        .target(
            name: "ShakingClient",
            dependencies: [
                .composableArchitecture,
                .dependencies
            ]
        ),
        .target(
            name: "PersistableTimerClient",
            dependencies: [
                .composableArchitecture,
                .dependencies,
            ]
        ),
        .testTarget(
            name: "IsOnUTests",
            dependencies: ["IsOnU"]
        ),
    ]
)

extension Target.Dependency {
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var composableArchitecture: Self { .product(name: "ComposableArchitecture", package: "swift-composable-architecture") }
    static var firebaseFirestore: Self { .product(name: "FirebaseFirestore", package: "firebase-ios-sdk") }
    static var firebaseAuth: Self { .product(name: "FirebaseAuth", package: "firebase-ios-sdk") }
    static var algorithms: Self { .product(name: "Algorithms", package: "swift-algorithms") }
}

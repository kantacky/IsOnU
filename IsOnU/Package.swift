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
        .library(name: "FirestoreClient", targets: ["FirestoreClient"]),
        .library(name: "Infrastructure", targets: ["Infrastructure"]),
    ],
    dependencies: [
        .package(url: "https://github.com/firebase/firebase-ios-sdk", .upToNextMajor(from: "10.16.0")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/pointfreeco/swift-case-paths", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/onevcat/APNGKit", .upToNextMajor(from: "2.0.0")),
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
        .target(
            name: "Assets",
            dependencies: [
                .apngKit,
            ]
        ),
        .target(
            name: "FirebaseError",
            dependencies: [
                .firebaseFirestore,
                .dependencies,
                .composableArchitecture,
            ]
        ),
        .target(
            name: "FirestoreClient",
            dependencies: [
                "Models",
                .firebaseFirestore,
                .dependencies,
                .composableArchitecture,
            ]
        ),
        .target(
            name: "Infrastructure",
            dependencies: [
                "Models",
                "FirestoreClient",
                .firebaseFirestore,
                .firebaseFirestoreSwift,
                .dependencies,
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
    static var apngKit: Self { .product(name: "APNGKit", package: "APNGKit") }
    static var composableArchitecture: Self { .product(name: "ComposableArchitecture", package: "swift-composable-architecture") }
    static var dependencies: Self { .product(name: "Dependencies", package: "swift-dependencies") }
    static var firebaseAuth: Self { .product(name: "FirebaseAuth", package: "firebase-ios-sdk") }
    static var firebaseFirestore: Self { .product(name: "FirebaseFirestore", package: "firebase-ios-sdk") }
    static var firebaseFirestoreSwift: Self { .product(name: "FirebaseFirestoreSwift", package: "firebase-ios-sdk") }
}

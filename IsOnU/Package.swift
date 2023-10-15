// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "IsOnU",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "AuthClient", targets: ["AuthClient"]),
        .library(name: "Assets", targets: ["Assets"]),
        .library(name: "Audience", targets: ["Audience"]),
        .library(name: "FirebaseError", targets: ["FirebaseError"]),
        .library(name: "FirestoreClient", targets: ["FirestoreClient"]),
        .library(name: "IsOnU", targets: ["IsOnU"]),
        .library(name: "Member", targets: ["Member"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Speaker", targets: ["Speaker"]),
        .library(name: "ViewComponents", targets: ["ViewComponents"]),
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
            name: "AuthClient",
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
            name: "Audience",
            dependencies: [
                "Models",
                "ViewComponents",
                .composableArchitecture,
            ]
        ),
        .target(
            name: "FirebaseError",
            dependencies: [
                .firebaseAuth,
            ]
        ),
        .target(
            name: "FirestoreClient",
            dependencies: [
                "Models",
                .dependencies,
                .firebaseFirestore,
                .firebaseFirestoreSwift,
            ]
        ),
        .target(
            name: "Member",
            dependencies: [
                "Models",
                "ViewComponents",
                .composableArchitecture,
            ]
        ),
        .target(
            name: "Models",
            dependencies: [
                "Assets",
            ]
        ),
        .target(
            name: "IsOnU",
            dependencies: [
                "AuthClient",
                "Assets",
                "Audience",
                "Member",
                "Speaker",
                "ViewComponents",
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
        .target(
            name: "Speaker",
            dependencies: [
                "Assets",
                "Models",
                "FirestoreClient",
                "ViewComponents",
                .composableArchitecture,
            ]
        ),
        .target(
            name: "ViewComponents",
            dependencies: [
                "Assets",
                "Models",
            ]
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

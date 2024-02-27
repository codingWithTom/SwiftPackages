// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TomPackage",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TomPackage",
            targets: ["TomPackage"]),
        .library(name: "BuiltTomPackage", targets: ["BuiltTomPackage"]),
        .library(name: "TomBridge", targets: ["TomBridge"])
    ],
    dependencies: [
      .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.4"),
      .package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.21.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TomPackage",
            dependencies: [.product(name: "Lottie", package: "lottie-spm")]),
        .target(name: "TomBridge",
                dependencies: [.target(name: "BuiltTomPackage"),
                               .product(name: "Lottie", package: "lottie-spm"),
                               .product(name: "FirebaseAuth", package: "firebase-ios-sdk")]),
        .binaryTarget(name: "BuiltTomPackage", path: "BuiltTomPackage.xcframework"),
        .testTarget(
            name: "TomPackageTests",
            dependencies: ["TomPackage"]),
    ]
)

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
    ],
    dependencies: [
      .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.4")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TomPackage",
            dependencies: [.product(name: "Lottie", package: "lottie-spm")],
            resources: [.copy("Resources/Animation.json")]),
        .testTarget(
            name: "TomPackageTests",
            dependencies: ["TomPackage"]),
    ]
)

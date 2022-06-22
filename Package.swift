// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Validator",
    products: [
        .library(
            name: "Validator",
            targets: ["Validator"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/Quick/Nimble.git", .upToNextMajor(from: "10.0.0"))
    ],
    targets: [
        .target(
            name: "Validator",
            dependencies: [
                
            ]
        ),
        .testTarget(
            name: "ValidatorTests",
            dependencies: [
                "Validator",
                "Quick",
                "Nimble"
            ]
        )
    ]
)

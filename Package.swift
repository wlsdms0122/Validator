// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Validator",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "Validator",
            targets: ["Validator"]
        )
    ],
    targets: [
        .target(
            name: "Validator"
        ),
        .testTarget(
            name: "ValidatorTests",
            dependencies: [
                "Validator"
            ]
        )
    ]
)

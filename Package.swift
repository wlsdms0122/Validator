// swift-tools-version: 5.10
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

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
                "Validator"
            ]
        )
    ]
)

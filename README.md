# Validator

The `Validator` is an abstraction of simple validation logic.

-   [Validator](#validator)
-   [Requirements](#requirements)
-   [Installation](#installation)
    -   [Swift Package Manager](#swift-package-manager)
-   [Getting Started](#getting-started)
    -   [AnyValidator](#anyvalidator)
    -   [Operator](#operator)
-   [Contribution](#contribution)
-   [License](#license)

# Requirements

-   iOS 13.0+
-   macOS 10.15+

# Installation

## Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/wlsdms0122/Validator.git", .upToNextMajor(from: "1.0.0"))
]
```

# Getting Started

The `Validator` protocol is very simple. There is an associated type that is validated and a function that performs the validation.

```swift
public protocol Validator<Input> {
    associatedtype Input

    func validate(_ input: Input) -> Bool
}
```

This package provides several validators. Most of them are related to strings.

### AnyValidator

Use `AnyValidator` to wrap a validator whose type has details you don’t want to expose across API boundaries, such as different modules.

You can use Validator's `eraseToAnyValidator()` operator to wrap a validator with `AnyValidator`.

### Operators

This package provides operators for validators. Now it provide a `combine(_:)` method. It combine two validators.

# Contribution

Any ideas, issues, opinions are welcome.

# License

Validator is available under the MIT license. See the LICENSE file for more info.

//
//  Validator.swift
//  
//
//  Created by jsilver on 2022/01/25.
//

import Foundation

public protocol Validator<Input> {
    associatedtype Input
    
    func validate(_ input: Input) -> Bool
}

// MARK: - AnyValidator
public struct AnyValidator<Input>: Validator {
    // MARK: - Property
    private let _validate: (Input) -> Bool
    
    // MARK: - Initializer
    public init<V: Validator>(_ validator: V) where V.Input == Input {
        _validate = { validator.validate($0) }
    }
    
    // MARK: - Public
    public func validate(_ input: Input) -> Bool {
        _validate(input)
    }
    
    // MARK: - Private
}

// MARK: - Extensions
public extension Validator {
    func eraseToAnyValidator() -> AnyValidator<Input> {
        .init(self)
    }
}

public extension Validator where Self == EmailValidator {
    static var email: Self { EmailValidator() }
}

public extension Validator where Self == PhoneNumberValidator {
    static var phoneNumber: Self { PhoneNumberValidator() }
}

public extension Validator {
    static func regex(_ pattern: String) -> Self where Self == RegexValidator { RegexValidator(regex: pattern) }
    static func count(_ count: Int, _ compare: @escaping (Int, Int) -> Bool) -> Self where Self == StringCountValidator { StringCountValidator(count: count, compare) }
    static func range<Value: Comparable>(_ range: Range<Value>) -> Self where Self == RangeValidator<Value> { RangeValidator<Value>(range: range) }
}

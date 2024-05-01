//
//  SomeValidator.swift
//
//
//  Created by jsilver on 5/2/24.
//

import Foundation

public struct SomeValidator<Input>: Validator {
    // MARK: - Property
    private let _validate: (Input) -> Bool
    
    // MARK: - Initializer
    public init(_ validate: @escaping (Input) -> Bool) {
        self._validate = validate
    }
    
    // MARK: - Public
    public func validate(_ input: Input) -> Bool {
        _validate(input)
    }
    
    // MARK: - Private
}

public extension Validator {
    static func `some`<Input>(_ validate: @escaping (Input) -> Bool) -> Self where Self == SomeValidator<Input> {
        SomeValidator(validate)
    }
}

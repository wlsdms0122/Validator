//
//  AnyValidator.swift
//  
//
//  Created by jsilver on 5/2/24.
//

import Foundation

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

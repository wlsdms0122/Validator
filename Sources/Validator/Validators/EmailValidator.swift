//
//  FiEmailValidatorle.swift
//  
//
//  Created by jsilver on 2022/01/27.
//

import Foundation

public struct EmailValidator: Validator {
    // MARK: - Property
    private let validator = RegexValidator(regex: "^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
    
    // MARK: - Initializer
    public init() {
        
    }
    
    // MARK: - Public
    public func validate(_ input: String) -> Bool {
        validator.validate(input)
    }
    
    // MARK: - Private
}

public extension Validator where Self == EmailValidator {
    static var email: Self { EmailValidator() }
}

//
//  RegexValidator.swift
//  
//
//  Created by jsilver on 2022/01/27.
//

import Foundation

public struct RegexValidator: Validator {
    // MARK: - Property
    let pattern: String
    
    // MARK: - Initializer
    public init(regex pattern: String) {
        self.pattern = pattern
    }
    
    // MARK: - Public
    public func validate(_ input: String) -> Bool {
        input.regex(pattern)
    }
    
    // MARK: - Private
}

public extension Validator {
    static func regex(_ pattern: String) -> Self where Self == RegexValidator {
        RegexValidator(regex: pattern)
    }
}

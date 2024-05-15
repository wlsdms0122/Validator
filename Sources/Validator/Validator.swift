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

public extension Validator {
    func eraseToAnyValidator() -> AnyValidator<Input> {
        AnyValidator(self)
    }
    
    func combine<V: Validator>(_ validator: V) -> some Validator<Input> where V.Input == Input {
        Validators._CombineValidator(self, validator)
    }
}

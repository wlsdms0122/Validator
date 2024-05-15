//
//  Validators.swift
//
//
//  Created by jsilver on 5/2/24.
//

import Foundation

enum Validators {
    struct _CombineValidator<A: Validator, B: Validator>: Validator where A.Input == B.Input {
        typealias Input = A.Input
        
        // MARK: - Property
        private let a: A
        private let b: B
        
        // MARK: - Initializer
        public init(_ a: A, _ b: B) {
            self.a = a
            self.b = b
        }
        
        // MARK: - Public
        public func validate(_ input: Input) -> Bool {
            a.validate(input) && b.validate(input)
        }
        
        // MARK: - Private
    }
}

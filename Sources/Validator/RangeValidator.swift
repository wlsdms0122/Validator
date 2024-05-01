//
//  RangeValidator.swift
//
//
//  Created by jsilver on 5/1/24.
//

import Foundation

public struct RangeValidator<Value: Comparable>: Validator {
    // MARK: - Property
    private let range: Range<Value>
    
    // MARK: - Initializer
    public init(range: Range<Value>) {
        self.range = range
    }
    
    // MARK: - Public
    public func validate(_ input: Value) -> Bool {
        range.contains(input)
    }
    
    // MARK: - Private
}

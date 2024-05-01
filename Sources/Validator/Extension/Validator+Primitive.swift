//
//  String+Validate.swift
//  
//
//  Created by jsilver on 2022/01/26.
//

import Foundation

public extension Numeric {
    func validate<V: Validator>(_ validator: V) -> Bool where V.Input == Self {
        validator.validate(self)
    }
}

public extension String {
    func validate<V: Validator>(_ validator: V) -> Bool where V.Input == Self {
        validator.validate(self)
    }
}

//
//  String+Regex.swift
//  
//
//  Created by jsilver on 2022/01/25.
//

import Foundation

public extension String {
    func regex(
        _ pattern: String,
        regexOptions: NSRegularExpression.Options = [],
        matchingOptions: NSRegularExpression.MatchingOptions = []
    ) -> [RegExr.Match] {
        RegExr(pattern).match(in: self, regexOptions: regexOptions, matchingOptions: matchingOptions)
    }
    
    func regex(
        _ pattern: String,
        regexOptions: NSRegularExpression.Options = [],
        matchingOptions: NSRegularExpression.MatchingOptions = []
    ) -> Bool {
        let match = regex(pattern, regexOptions: regexOptions, matchingOptions: matchingOptions)
            .first { $0.string == self }
        
        return match != nil
    }
}

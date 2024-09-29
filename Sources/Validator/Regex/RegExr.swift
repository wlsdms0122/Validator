//
//  RegExr.swift
//
//
//  Created by JSilver on 9/24/24.
//

import Foundation

public struct RegExr {
    // MARK: - Property
    public let pattern: String
    
    // MARK: - Initializer
    public init(_ pattern: String) {
        self.pattern = pattern
    }
    
    // MARK: - Public
    public func match(
        in string: String,
        regexOptions: NSRegularExpression.Options = [],
        matchingOptions: NSRegularExpression.MatchingOptions = []
    ) -> [Match] {
        let range = (string as NSString).range(of: string)
        guard range.length > 0 else { return [] }
        
        guard let regex = try? NSRegularExpression(
            pattern: pattern,
            options: regexOptions
        ) else { return [] }
        
        return regex.matches(
            in: string,
            options: matchingOptions,
            range: range
        )
            .compactMap { match in Match(origin: string, result: match) }
    }
    
    // MARK: - Private
}

public extension RegExr {
    struct Match {
        // MARK: - Property
        public let originString: String
        
        public let result: NSTextCheckingResult
        public let range: Range<String.Index>
        
        public var string: String { String(originString[range]) }
        
        // MARK: - Initializer
        init?(origin string: String, result: NSTextCheckingResult) {
            guard let range = Range(result.range, in: string) else { return nil }
            
            self.originString = string
            self.result = result
            self.range = range
        }
        
        // MARK: - Public
        
        // MARK: - Private
    }
}

//
//  ValidatorTests.swift
//  
//
//  Created by jsilver on 2022/01/25.
//

import XCTest
@testable import Validator

final class ValidatorTests: XCTestCase {
    // MARK: - Property
    
    // MARK: - Lifecycle
    
    // MARK: - Test
    func test_that_return_true_when_validate_right_email_formats() {
        // Given
        let validator = EmailValidator()
        let emails = [
            "chalttoek@gmail.com",
            "chalttoek@naver.com",
            "chalttoek@daum.net",
            "chalttoek@nate.com",
            "chaltteok@a.com",
            "chaltteok@a.net",
            "chaltteok@a.org",
            "chaltteok@a.io",
            "chaltteok@a.me",
            "chaltteok@a.co.kr",
            "chaltteok@a.go",
            "_chalttoek@gmail.com",
            "prettyandsimple@example.com",
            "very.common@example.com",
            "disposable.style.email.with+symbol@example.com",
            "other.email-with-dash@example.com",
            "x@example.com",
            "example-indeed@strange-example.com",
            "#!$%&'*+-/=?^_`{}|~@example.org",
            "example@s.solutions",
        ]
        
        // When
        
        // Then
        emails.forEach { XCTAssertTrue(validator.validate($0), $0) }
    }
    
    
    func test_that_return_true_when_validate_wrong_email_formats() {
        // Given
        let validator = EmailValidator()
        let emails = [
            "chalttoek@_gmail.com"
        ]
        
        // When
        let result = emails.allSatisfy { !validator.validate($0) }
        
        // Then
        XCTAssertTrue(result)
    }
    
    func test_that_return_true_when_validate_right_range() {
        // Given
        let validator = RangeValidator<Int>(range: 10..<20)
        
        // When
        let result = validator.validate(15)
        
        // Then
        XCTAssertTrue(result)
    }
    
    func test_that_return_false_when_validate_wrong_range() {
        // Given
        let validator = RangeValidator<Int>(range: 10..<20)
        
        // When
        let result = validator.validate(5)
        
        // Then
        XCTAssertFalse(result)
    }
    
    func test_that_return_true_when_chained_validators_all_validated() {
        // Given
        let validator: some Validator<Int> = .range(10..<20)
            .combine(.some { $0.isMultiple(of: 2) })
        
        print(type(of: validator))
        
        // When
        let result = validator.validate(10)
        
        // Then
        XCTAssertTrue(result)
    }
}

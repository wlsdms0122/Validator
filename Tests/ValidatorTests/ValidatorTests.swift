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
}

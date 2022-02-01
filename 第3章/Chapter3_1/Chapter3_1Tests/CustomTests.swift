//
//  CustomTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/31.
//

import XCTest
@testable import Chapter3_1

class CustomTests: XCTestCase {
    
    // MARK: - Helpers
    
    // 「文字列が空であること」を判定する独自のアサーション
    func assertEmpty(_ string: String,
                     file: StaticString = #file,
                     line: UInt = #line) {
        XCTAssertTrue(string.isEmpty, "\"\(string)\" is not empty", file: file, line: line)
    }
    
    // MARK: - Tests
    
    func testAssertEmpty() {
//        assertEmpty("hello")
        assertEmpty("")
    }
    
}

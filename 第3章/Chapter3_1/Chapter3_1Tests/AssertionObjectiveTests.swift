//
//  AssertionObjectiveTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1

class AssertionObjectiveTests: XCTestCase {
    
    class Cat {
    }
    
    func testEqual() {
        let cat1 = Cat()
        let cat2 = cat1
        XCTAssertTrue(cat1 === cat2)
    }
    
    func testNotEqual() {
        let cat1 = Cat()
        let cat2 = Cat()
        
        XCTAssertFalse(cat1 === cat2)
    }
    
}

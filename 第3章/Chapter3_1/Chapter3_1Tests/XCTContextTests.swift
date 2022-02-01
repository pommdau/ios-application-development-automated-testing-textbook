//
//  XCTContextTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//


import XCTest
@testable import Chapter3_1

class XCTContextTests: XCTestCase {
    
    // MARK: - Helpers
    
    func safeDivision(_ x: Int, _ y: Int) -> Int? {
        if y == 0 {
            return nil
        } else {
            return x / y
        }
    }
    
    // MARK: - Tests
    
    func testSafeDivision() {
        XCTAssertEqual(safeDivision(6, 3), 2)
        XCTAssertEqual(safeDivision(6, 2), 3)
        XCTAssertNil(safeDivision(6, 0))
    }
    
    func testSafeDivisionRunActivity() {
        
        XCTContext.runActivity(named: "通常の割り算") { _ in
            XCTContext.runActivity(named: "6 / 3 = 2") { _ in
                XCTAssertEqual(safeDivision(6, 3), 2)
            }
            
            XCTContext.runActivity(named: "6 / 2 = 3") { _ in
                XCTAssertEqual(safeDivision(6, 2), 3)
            }
        }
        
        XCTContext.runActivity(named: "0除算") { _ in
            XCTAssertNil(safeDivision(6, 0))
        }
        
    }
    
}

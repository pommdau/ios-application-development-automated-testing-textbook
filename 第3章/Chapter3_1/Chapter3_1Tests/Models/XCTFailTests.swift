//
//  XCTFailTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1

class XCTFailTests: XCTestCase {
    
    // MARK: - Helpers
    
    func executeClosure(_ condition: Bool, handler: () -> Void) {
        if condition {
            handler()
        }
    }
    
    // MARK: - Tests
    
    func testXCTFailTests() {
        
        executeClosure(false) {
            XCTFail("conditoinがfalseのときはクロージャが呼び出されないこと")
            return // 後続の処理を実行したくない場合
        }
        
    }
    
}

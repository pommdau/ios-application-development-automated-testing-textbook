//
//  ExceptionTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1

class ExceptionTests: XCTestCase {
    
    // MARK: - Helpers
    
    enum DownloadError: Error {
        case connectionError
        case unknownError(code: Int)
    }
    
    // MARK: - Tests
    
    func testXCTFailTests() {
        
        executeClosure(false) {
            XCTFail("conditoinがfalseのときはクロージャが呼び出されないこと")
            return // 後続の処理を実行したくない場合
        }
        
    }
    
}

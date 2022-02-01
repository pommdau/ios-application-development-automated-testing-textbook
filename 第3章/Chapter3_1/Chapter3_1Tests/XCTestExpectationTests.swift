//
//  XCTestExpectationTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//


import XCTest
@testable import Chapter3_1

class XCTestExpectationTests: XCTestCase {
    
    // MARK: - Helpers
    
    func echo(message: String, _ handler: @escaping (String) -> Void) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 0.5)
            
            DispatchQueue.main.async {
                handler("\(message)!")
            }
        }
    }
    
    // MARK: - Tests
    
    func testEcho() {
        
        let exp: XCTestExpectation = expectation(description: "wait for finish")

        echo(message: "Hello") { message in
            XCTAssertEqual(message, "Hello!")
            
            exp.fulfill()
        }

        wait(for: [exp], timeout: 3)
    }
    
}

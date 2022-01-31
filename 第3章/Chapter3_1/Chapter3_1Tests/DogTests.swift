//
//  DogTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1

struct Dog {
    var name: String
    var age: Int
}

extension Dog: Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
}

class DogTests: XCTestCase {

    func testEqual() {
        let dog1 = Dog(name: "ポチ", age: 3)
        let dog2 = Dog(name: "ポチ", age: 3)
        XCTAssertEqual(dog1, dog2)
    }
    
    func testNotEqual() {
        let dog1 = Dog(name: "ポチ", age: 3)
        let dog2 = Dog(name: "ジョン", age: 4)
        XCTAssertNotEqual(dog1, dog2)
    }
    
}

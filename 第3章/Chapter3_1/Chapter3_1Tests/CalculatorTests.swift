//
//  CalculatorTests.swift
//  Chapter3_1Tests
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import XCTest
@testable import Chapter3_1

class Calculator {

    // MARK: - 四則演算
    /// 状態を持たないのでclass/staticメソッドにするのが良い
    
    func add(_ x: Int, _ y: Int) -> Int {
        return x + y
    }
    
    func subtract(_ x: Int, _ y: Int) -> Int {
        return x - y
    }
    
    func multiple(_ x: Int, _ y: Int) -> Int {
        return x * y
    }
    
    func division(_ x: Int, _ y: Int) -> Int {
        return x / y
    }
}

class CalculatorTests: XCTestCase {

    // MARK: - Properties
    
    var calculator: Calculator!
    
    // MARK: - Lifecycle
    
    override func setUp() {
        super.setUp()
        self.calculator = Calculator()
    }
    
    override func tearDown() {
        super.tearDown()
        self.calculator = nil
    }
    
    // MARK: - 四則演算
    
    func testAdd() {
        let result = calculator.add(1, 2)
        XCTAssertEqual(result, 3)
    }
    
    func tesSubtract() {
        XCTAssertEqual(calculator.subtract(3, 1), 2)

    }
    
    func testMultiple() {
        XCTAssertEqual(calculator.multiple(2, 3), 6)
    }
    
    func testDivision() {
        XCTAssertEqual(calculator.division(6, 2), 3)
    }

}

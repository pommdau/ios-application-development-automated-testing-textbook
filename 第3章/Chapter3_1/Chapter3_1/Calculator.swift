//
//  Calculator.swift
//  Chapter3_1
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import Foundation

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

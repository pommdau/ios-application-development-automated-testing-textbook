//
//  Dog.swift
//  Chapter3_1
//
//  Created by HIROKI IKEUCHI on 2022/01/28.
//

import Foundation

struct Dog {
    var name: String
    var age: Int
}

extension Dog: Equatable {
    static func == (lhs: Dog, rhs: Dog) -> Bool {
        return (lhs.name == rhs.name) && (lhs.age == rhs.age)
    }
}

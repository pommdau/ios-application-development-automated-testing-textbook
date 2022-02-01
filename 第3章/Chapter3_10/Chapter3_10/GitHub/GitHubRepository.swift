//
//  GitHubRepository.swift
//  Chapter3_10
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import Foundation

struct GitHubRepository: Codable, Equatable {
    let id: Int
    let star: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case star = "stargazers_count"
        case name
    }
}

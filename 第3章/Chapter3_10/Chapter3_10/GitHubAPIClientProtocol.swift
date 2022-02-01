//
//  GitHubAPIClientProtocol.swift
//  Chapter3_10
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import Foundation

protocol GitHubAPIClientProtocol {
    func fetchRepositories(user: String,
                           handler: @escaping ([GitHubRepository]?) -> Void)
}

//
//  MockGitHubAPIClient.swift
//  Chapter3_10Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import Foundation
@testable import Chapter3_10

class MockGitHubAPIClient: GitHubAPIClientProtocol {
    
    // MARK: - Properties
    
    var returnRepositories: [GitHubRepository]  // 返却するリポジトリ一覧を保持
    var argUser: String?  // 呼び出された引数を記録
        
    // MARK: - Lifecycles
    
    init(repositories: [GitHubRepository]) {
        self.returnRepositories = repositories
    }
    
    // MARK: - GitHubAPIClientProtocol Methods
    
    func fetchRepositories(user: String, handler: @escaping ([GitHubRepository]?) -> Void) {
        self.argUser = user
        handler(self.returnRepositories)
    }
    
}

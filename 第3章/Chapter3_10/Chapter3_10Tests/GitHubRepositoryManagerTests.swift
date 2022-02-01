//
//  GitHubRepositoryManagerTests.swift
//  Chapter3_10Tests
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import XCTest
@testable import Chapter3_10

class GitHubRepositoryManagerTests: XCTestCase {
    
    func testmajorRepositories() {
        let testRepositories: [GitHubRepository] = [
            GitHubRepository(id: 0, star:  9, name: ""),  // majorRepositoriesには含まれない
            GitHubRepository(id: 1, star: 10, name: ""),
            GitHubRepository(id: 2, star: 11, name: ""),
        ]
        
        let mockClient = MockGitHubAPIClient(repositories: testRepositories)

        // テスト対象にモックを渡す
        let manager = GitHubRepositoryManager(client: mockClient)
        
        manager.load(user: "apple") {
            // 引数の検証
            XCTAssertEqual(mockClient.argUser, "apple")
            
            // 結果の検証
            XCTAssertEqual(manager.majorRepositories.count, 2)
            XCTAssertEqual(manager.majorRepositories[0].id, 1)
            XCTAssertEqual(manager.majorRepositories[1].id, 2)
        }
        
    }
    
}

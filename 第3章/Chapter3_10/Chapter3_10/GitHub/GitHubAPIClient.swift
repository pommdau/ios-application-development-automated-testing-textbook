//
//  GitHubAPIClient.swift
//  Chapter3_10
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import Foundation

class GitHubAPIClient: GitHubAPIClientProtocol {

    func fetchRepositories(user: String,
                           handler: @escaping ([GitHubRepository]?) -> Void) {
        let url = URL(string: "https://api.github.com/users/\(user)/repos")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard let data = data, error == nil else {
                handler(nil)
                return
            }
            
            let repos = try! JSONDecoder().decode([GitHubRepository].self, from: data)
            DispatchQueue.main.async {
                handler(repos)
            }
            
        }
        task.resume()
    }
    
    
}

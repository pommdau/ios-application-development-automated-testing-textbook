//
//  ViewController.swift
//  Chapter3_10
//
//  Created by HIROKI IKEUCHI on 2022/02/01.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    
    var manager: GitHubRepositoryManager!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Lifecycles
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.manager = GitHubRepositoryManager()
        self.manager.load(user: "apple") { [weak self] in
            self?.tableView.reloadData()
        }
    }

    // MARK: - Helpers
    
    

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.manager.majorRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let repository = self.manager.majorRepositories[indexPath.row]
        cell.textLabel?.text = repository.name
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    
}

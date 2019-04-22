//
//  ListViewController.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
    
    
    let cellId: String = "cellId"
    override func viewDidLoad() {
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        fetchArtist()
    }
    
    fileprivate var results = [Result]()
    fileprivate func fetchArtist() {
        Service.shared.fetchArtist(searchTerm: "Eminem") { (res, err) in
            if let error = err {
                print("Error in fetch", error)
                return
            }
            self.results = res
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.result = results[indexPath.row]
        self.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListCell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        cell.result = results[indexPath.row]
        return cell
    }
    
}

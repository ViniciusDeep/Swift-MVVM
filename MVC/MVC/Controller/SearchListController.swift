//
//  SearchListController.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit


class SearchListController: UITableViewController, UISearchBarDelegate {
    
    fileprivate let cellId = "searchId"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate lazy var enterSearchName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter with name of your favorite Artist"
        return label
    }()
    
    override func viewDidLoad() {
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        setupSearchBar()
        verifyResultsInCell()
    }
    fileprivate func setupSearchBar() {
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        searchController.dimsBackgroundDuringPresentation = false
    }
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        fetchAristWithSearch(searchText)
    }
    fileprivate var results = [Result]()
    
    fileprivate var timer: Timer?
    fileprivate func fetchAristWithSearch(_ text: String) {
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (_) in
            Service.shared.fetchArtist(searchTerm: text) { (res, err) in
                if let error = err {
                    print("Error in search", error)
                    return
                }
                
                
                self.results = res
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        verifyResultsInCell()
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        cell.result = results[indexPath.row]
        return cell
    }
    
    
    fileprivate func verifyResultsInCell() {
        if results.count == 0 {
            self.tableView.separatorStyle = .none
        } else {
            self.tableView.separatorStyle = .singleLine
        }
    }
    
    
}

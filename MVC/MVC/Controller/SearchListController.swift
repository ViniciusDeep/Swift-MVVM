//
//  SearchListController.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class SearchListController: UITableViewController, UISearchBarDelegate {
    fileprivate var results = [Result]()
    fileprivate var timer: Timer?
    fileprivate let cellId = "searchId"
    fileprivate let searchController = UISearchController(searchResultsController: nil)
    fileprivate lazy var enterSearchName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Enter with name of your favorite Artist"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    override func viewDidLoad() {
        tableView.register(ListCell.self, forCellReuseIdentifier: cellId)
        setupSearchBar()
        verifyResultsInCell()
        tableView.addSubview(enterSearchName)
        enterSearchName.fillSuperview(padding: .init(top: 100, left: 50, bottom: 0, right: 50))
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
   
    fileprivate func fetchAristWithSearch(_ text: String) {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { (_) in
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
        enterSearchName.isHidden = results.count != 0
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleRemoveView)))
        guard let cell = tableView.cellForRow(at: indexPath) else {return}
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        redView.frame = startingFrame
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            redView.frame = self.view.frame
        }, completion: (nil))
    }
    
    @objc func handleRemoveView(gesture: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
             gesture.view?.removeFromSuperview()
        }, completion: (nil))
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ListCell
        let result = results[indexPath.row]
        cell.result = result
        return cell
    }
    
    fileprivate func verifyResultsInCell() {
        if results.isEmpty {
            self.tableView.separatorStyle = .none
        } else {
            self.tableView.separatorStyle = .singleLine
            enterSearchName.isHidden = true
        }
    }
    
    
    
    
}

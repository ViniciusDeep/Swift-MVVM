//
//  ListCell.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var result: Result! {
        didSet {
            nameLabel.text = result.trackName
        }
    }
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpComponentsInCell()
    }
    
    
    fileprivate func setUpComponentsInCell() {
        setConstraintsInLabel()
        addSubview(nameLabel)
    }
    
    fileprivate func setConstraintsInLabel() {
        nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

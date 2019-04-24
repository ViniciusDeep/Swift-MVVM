//
//  ListCell.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit
import SDWebImage

class ListCell: UITableViewCell {
    
    var result: Result! {
        didSet {
            nameLabel.text = result.trackName
            imageTrack.sd_setImage(with: URL(string: result.artworkUrl100))
        }
    }
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var imageTrack: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.widthAnchor.constraint(equalToConstant: 40).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        return iv
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpComponentsInCell()
    }
    fileprivate func setUpComponentsInCell() {
        addSubview(nameLabel)
        addSubview(imageTrack)
        setConstraintsInLabel()
    }
    fileprivate func setConstraintsInLabel() {
        imageTrack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: imageTrack.leadingAnchor, multiplier: 7).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

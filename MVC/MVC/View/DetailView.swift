//
//  DetailView.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailView: UIView {
   lazy var artistName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var trackName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var primaryGenreName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var trackPrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var imageTrack: UIImageView = {
        let image = UIImageView(image: UIImage(named: "search"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return image
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupSubViews() {
        addSubview(artistName)
        addSubview(trackName)
        addSubview(trackPrice)
        addSubview(primaryGenreName)
        addSubview(imageTrack)
        setConstraints()
    }
    fileprivate func setConstraints() {
        artistName.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
        imageTrack.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageTrack.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}

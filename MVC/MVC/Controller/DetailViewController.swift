//
//  DetailViewController.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    public var result: Result! {
        didSet {
            navigationItem.title = result.artistName
        }
    }
    
    override func viewDidLoad() {
        setComponentsInView()
        //print(result?.artistName)
    }
    
    fileprivate func setComponentsInView() {
        view.backgroundColor = .white
        let detailView = DetailView()
        detailView.artistName.text = "Vinicius"
        detailView.trackPrice.text = "0.0"
        detailView.imageTrack.image = UIImage(named: "search")
        detailView.primaryGenreName.text = "Genero"
        setConstraints(detailView)
        view.addSubview(detailView)
    }
    
    fileprivate func setConstraints(_ view: DetailView) {
        
        
    }
    
}

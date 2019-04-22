//
//  CustomTabBarController.swift
//  MVC
//
//  Created by Vinicius Mangueira Correia on 21/04/19.
//  Copyright © 2019 Vinicius Mangueira Correia. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setComponentsInTab()
    }
    fileprivate func setComponentsInTab() {
        viewControllers = [
            createNav(viewController: ListViewController(), title: "List of Songs", imageName: "music"),
            createNav(viewController: SearchListController(), title: "Search", imageName: "search")
        ]
    }
    fileprivate func createNav(viewController: UIViewController, title: String, imageName: String) -> UINavigationController {
        let navVC: UINavigationController = UINavigationController(rootViewController: viewController)
        navVC.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .white
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = UIImage(named: imageName)
        return navVC
    }
    
    
}

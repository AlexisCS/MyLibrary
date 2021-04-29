//
//  TabBarViewController.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    var presenter: TabBarPresenterProtocol?
    
    init() {
        super.init(nibName: nil, bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = .black
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
}

extension TabBarViewController: TabBarViewProtocol {
    func controllers(_ controllers: [UIViewController]) {
        self.viewControllers = controllers
    }
}


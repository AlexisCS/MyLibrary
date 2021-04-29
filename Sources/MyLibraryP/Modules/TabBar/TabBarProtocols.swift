//
//  TabBarProtocols.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

protocol TabBarViewProtocol: class {
    var presenter: TabBarPresenterProtocol? { get set }
    
    func controllers(_ controllers: [UIViewController])
}

protocol TabBarPresenterProtocol: class {
    var view: TabBarViewProtocol? { get set }
    var router: TabBarRouterProtocol? { get set }
    var interactor: TabBarInteractorInputProtocol? { get set }
    
    func viewWillAppear()
}

protocol TabBarInteractorInputProtocol: class {
    var presenter: TabBarInteractorOutputProtocol? { get set }
    
    func getControllers()
}

protocol TabBarInteractorOutputProtocol: class {
    func controllers(_ controllers: [UIViewController])
}

protocol TabBarRouterProtocol: class {
    static func createModule() -> UITabBarController
}

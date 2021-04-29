//
//  TabBarRouter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarRouterProtocol {
    static func createModule() -> UITabBarController {
        let tabBarView = TabBarViewController()
        let presenter: TabBarPresenter & TabBarInteractorOutputProtocol = TabBarPresenter()
        let interactor: TabBarInteractorInputProtocol = TabBarInteractor()
        let router = TabBarRouter()
        tabBarView.presenter = presenter
        presenter.view = tabBarView
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return tabBarView
    }
}

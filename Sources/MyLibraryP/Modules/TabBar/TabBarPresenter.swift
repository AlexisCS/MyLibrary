//
//  TabBarPresenter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class TabBarPresenter: TabBarPresenterProtocol {
    weak var view: TabBarViewProtocol?
    var router: TabBarRouterProtocol?
    var interactor: TabBarInteractorInputProtocol?
    
    func viewWillAppear() {
        interactor?.getControllers()
    }
}

extension TabBarPresenter: TabBarInteractorOutputProtocol {
    func controllers(_ controllers: [UIViewController]) {
        view?.controllers(controllers)
    }
}

//
//  PopularHeroeRouter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class PopularHeroeRouter: PopularHeroeRouterProtocol {
    static func createModule(with heroe: Heroe) -> UIViewController {
        let popularHeroeView = PopularHeroeViewController()
        let presenter: PopularHeroePresenter & PopularHeroeInteractorOutputProtocol = PopularHeroePresenter()
        let interactor: PopularHeroeInteractorInputProtocol = PopularHeroeInteractor()
        let router: PopularHeroeRouterProtocol = PopularHeroeRouter()
        popularHeroeView.presenter = presenter
        presenter.view = popularHeroeView
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.heroe = heroe
        return popularHeroeView
    }
}

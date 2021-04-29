//
//  HeroeDetailRouter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroeDetailRouter: HeroeDetailRouterProtocol {
    static func createModule(with hero: Heroe) -> UIViewController {
        let heroeDetailViewController = HeroeDetailViewController()
        let presenter: HeroeDetailPresenter & HeroeDetailInteractorOutputProtocol = HeroeDetailPresenter()
        let interactor: HeroeDetailInteractorInputProtocol = HeroeDetailInteractor()
        let router: HeroeDetailRouterProtocol = HeroeDetailRouter()
        heroeDetailViewController.presenter = presenter
        presenter.view = heroeDetailViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.heroe = hero
        return heroeDetailViewController
    }
    
    func closeDetail(_ view: HeroeDetailViewProtocol) {
        guard let viewController = view as? UIViewController else { return }
        viewController.dismiss(animated: true, completion: nil)
    }
}

//
//  HeroesRouter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

public class HeroesListRouter: HeoroesListRouterProtocol {
    public static func createModule() -> UIViewController {
        let heroesLisViewController = HeroesListViewController()
        let presenter: HeoroesListPresenterProtocol & HeoroesListInteractorOutputProtocol = HeroesListPresenter()
        let interactor: HeoroesListInteractorInputProtocol = HeroesListInteractor()
        let router: HeroesListRouter = HeroesListRouter()
        heroesLisViewController.presenter = presenter
        presenter.view = heroesLisViewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return heroesLisViewController
    }
    
    func showAlert(_ view: HeroesListViewProtocol, error: Error) {
        guard let viewController = view as? UIViewController else { return }
        let alertController = UIAlertController(title: "Aviso",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alertController, animated: true, completion: nil)
    }
    
    func presentDetail(from view: HeroesListViewProtocol, for heroe: Heroe) {
        guard let viewController = view as? UIViewController else { return }
        let heroeDetail = HeroeDetailRouter.createModule(with: heroe)
        heroeDetail.modalPresentationStyle = .fullScreen
        viewController.present(heroeDetail, animated: true, completion: nil)
    }
    
    func pushToTallest(from view: HeroesListViewProtocol, for heroe: Heroe) {
        guard let viewController = view as? UIViewController else { return }
        let popularHeroe = PopularHeroeRouter.createModule(with: heroe)
        viewController.navigationController?.pushViewController(popularHeroe, animated: true)
    }
}

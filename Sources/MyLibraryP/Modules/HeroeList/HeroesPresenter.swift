//
//  HeroesPresenter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroesListPresenter: HeoroesListPresenterProtocol {
    weak var view: HeroesListViewProtocol?
    var router: HeoroesListRouterProtocol?
    var interactor: HeoroesListInteractorInputProtocol?
    
    func viewDidLoad() {
        interactor?.getHeroes()
    }
    
    func save(url: String, imageView: UIImageView) {
        interactor?.save(url: url, imageView: imageView)
    }
    
    func filterHeroe(by name: String, in heroes: [[Heroe]]) {
        interactor?.filterHeroe(by: name, in: heroes)
    }
    
    func presentDetail(_ heroe: Heroe) {
        guard let view = self.view else { return }
        router?.presentDetail(from: view, for: heroe)
    }
    
    func pushToTallest(heroe: Heroe) {
        guard let view = self.view else { return }
        router?.pushToTallest(from: view, for: heroe)
    }
    
    func present(error: Error) {
        guard let view = self.view else { return }
        router?.showAlert(view, error: error)
    }
}

extension HeroesListPresenter: HeoroesListInteractorOutputProtocol {
    func didRetriveHeroes(_ heroes: [[Heroe]]) {
        view?.showHeroes(heroes)
    }
    
    func didRetriveTallest(heroes: [[Heroe]]) {
        view?.showTallest(heroes: heroes)
    }
    
    func didErrorRetriveHeroes(_ error: Error) {
        view?.showError(error)
    }
    
    func didRetriveFilter(heroes: [Heroe]) {
        view?.showFilter(heroes: heroes)
    }
}

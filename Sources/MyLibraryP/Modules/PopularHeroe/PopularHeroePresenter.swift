//
//  PopularHeroePresenter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

class PopularHeroePresenter: PopularHeroePresenterProtocol {
    weak var view: PopularHeroeViewProtocol?
    var router: PopularHeroeRouterProtocol?
    var interactor: PopularHeroeInteractorInputProtocol?
    
    func getHeroe() {
        interactor?.getHeroe()
    }
}

extension PopularHeroePresenter: PopularHeroeInteractorOutputProtocol {
    func didSelected(_ heroe: Heroe) {
        view?.show(heroe: heroe)
    }
}

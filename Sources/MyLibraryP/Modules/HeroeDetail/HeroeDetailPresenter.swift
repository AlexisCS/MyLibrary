//
//  HeroeDetailPresenter.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

class HeroeDetailPresenter: HeroeDetailPresenterProtocol {
    weak var view: HeroeDetailViewProtocol?
    var router: HeroeDetailRouterProtocol?
    var interactor: HeroeDetailInteractorInputProtocol?
    
    func viewDidLoad() {
        interactor?.getHeroe()
    }
    
    func closeDetail() {
        guard let view = self.view else { return }
        router?.closeDetail(view)
    }
}

extension HeroeDetailPresenter: HeroeDetailInteractorOutputProtocol {
    func didReciveHeroe(_ heroe: Heroe) {
        view?.showHeroe(heroe)
    }
}

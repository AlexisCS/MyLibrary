//
//  PopularHeroeInteractor.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

class PopularHeroeInteractor: PopularHeroeInteractorInputProtocol {
    weak var presenter: PopularHeroeInteractorOutputProtocol?
    var heroe: Heroe?
    
    func getHeroe() {
        guard let heroe = self.heroe else { return }
        presenter?.didSelected(heroe)
    }
}

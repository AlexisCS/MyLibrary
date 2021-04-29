//
//  HeroeDetailInteractor.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

class HeroeDetailInteractor: HeroeDetailInteractorInputProtocol {
    weak var presenter: HeroeDetailInteractorOutputProtocol?
    var heroe: Heroe?
    
    func getHeroe() {
        guard let heroe = self.heroe else { return }
        presenter?.didReciveHeroe(heroe)
    }
}

//
//  PopularHeroeProtocols.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

protocol PopularHeroeViewProtocol: class {
    var presenter: PopularHeroePresenterProtocol? { get set }
    
    func show(heroe: Heroe)
}

protocol PopularHeroePresenterProtocol: class {
    var view: PopularHeroeViewProtocol? { get set }
    var router: PopularHeroeRouterProtocol? { get set }
    var interactor: PopularHeroeInteractorInputProtocol? { get set }
    
    func getHeroe()
}

protocol PopularHeroeInteractorInputProtocol: class {
    var presenter: PopularHeroeInteractorOutputProtocol? { get set }
    var heroe: Heroe? { get set }
    
    func getHeroe()
}

protocol PopularHeroeInteractorOutputProtocol: class {
    func didSelected(_ heroe: Heroe)
}

protocol PopularHeroeRouterProtocol: class {
    static func createModule(with heroe: Heroe) -> UIViewController
}

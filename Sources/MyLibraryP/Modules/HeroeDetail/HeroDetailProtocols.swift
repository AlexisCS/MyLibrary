//
//  HeroDetailProtocols.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

protocol HeroeDetailViewProtocol: class {
    var presenter: HeroeDetailPresenterProtocol? { get set }
    
    func showHeroe(_ heroe: Heroe)
}

protocol HeroeDetailPresenterProtocol: class {
    var view: HeroeDetailViewProtocol? { get set }
    var router: HeroeDetailRouterProtocol? { get set }
    var interactor: HeroeDetailInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func closeDetail()
}

protocol HeroeDetailInteractorInputProtocol: class {
    var presenter: HeroeDetailInteractorOutputProtocol? { get set }
    var heroe: Heroe? { get set }
    
    func getHeroe()
}

protocol HeroeDetailInteractorOutputProtocol: class {
    func didReciveHeroe(_ heroe: Heroe)
}

protocol HeroeDetailRouterProtocol: class {
    static func createModule(with hero: Heroe) -> UIViewController
    func closeDetail(_ view: HeroeDetailViewProtocol)
}

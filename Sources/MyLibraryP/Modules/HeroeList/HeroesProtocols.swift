//
//  HeroesProtocols.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

protocol HeroesListViewProtocol: class {
    var presenter: HeoroesListPresenterProtocol? { get set }
    
    func showHeroes(_ heroes: [[Heroe]])
    func showTallest(heroes: [[Heroe]])
    func showFilter(heroes: [Heroe])
    func showError(_ error: Error)
}

protocol HeoroesListPresenterProtocol: class {
    var view: HeroesListViewProtocol? { get set }
    var router: HeoroesListRouterProtocol? { get set }
    var interactor: HeoroesListInteractorInputProtocol? { get set }
    
    func viewDidLoad()
    func presentDetail(_ heroe: Heroe)
    func pushToTallest(heroe: Heroe)
    func present(error: Error)
    func save(url: String, imageView: UIImageView)
    func filterHeroe(by name: String, in heroes: [[Heroe]])
}

protocol HeoroesListInteractorInputProtocol: class {
    var presenter: HeoroesListInteractorOutputProtocol? { get set }
    
    func getHeroes()
    func save(url: String, imageView: UIImageView)
    func filterHeroe(by name: String, in heroes: [[Heroe]])
}

protocol HeoroesListInteractorOutputProtocol: class {
    func didRetriveHeroes(_ heroes: [[Heroe]])
    func didRetriveTallest(heroes: [[Heroe]])
    func didRetriveFilter(heroes: [Heroe])
    func didErrorRetriveHeroes(_ error: Error)
}

protocol HeoroesListRouterProtocol: class {
    static func createModule() -> UIViewController
    
    func presentDetail(from view: HeroesListViewProtocol, for heroe: Heroe)
    func pushToTallest(from view: HeroesListViewProtocol, for heroe: Heroe)
    func showAlert(_ view: HeroesListViewProtocol, error: Error)
}

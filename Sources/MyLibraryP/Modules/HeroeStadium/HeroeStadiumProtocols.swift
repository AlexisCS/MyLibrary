//
//  HeroeStadium.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

protocol HeroeStadiumViewProtocol: class {
    var presenter: HeroeStadiumPresenterProtocol? { get  set }
}

protocol HeroeStadiumPresenterProtocol: class {
    var view: HeroeStadiumViewProtocol? { get set }
    var router: HeroeStadiumRouterProtocol? { get set }
    var interactor: HeroeStadiumInteractorInputProtocol? { get set }
}

protocol HeroeStadiumInteractorInputProtocol: class {
    var presenter: HeroeStadiumInteractorOutputProtocol? { get set }
}

protocol HeroeStadiumInteractorOutputProtocol: class {
    
}

protocol HeroeStadiumRouterProtocol: class {
    static func createModule() -> UINavigationController
}

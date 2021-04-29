//
//  TabBarInteractor.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 12/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class TabBarInteractor: TabBarInteractorInputProtocol {
    weak var presenter: TabBarInteractorOutputProtocol?
    
    func getControllers() {
        let controllers: [UIViewController] = [
            HeroesListRouter.createModule()
        ].map { UINavigationController(rootViewController: $0) }
        presenter?.controllers(controllers)
    }
}

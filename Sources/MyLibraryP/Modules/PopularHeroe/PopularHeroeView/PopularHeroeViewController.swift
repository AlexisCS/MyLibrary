//
//  PopularHeroeViewController.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class PopularHeroeViewController: UIViewController {
    
    var presenter: PopularHeroePresenterProtocol?
    
    private var heroe: Heroe?
    
    init() {
        super.init(nibName: "PopularHeroeViewController", bundle: Bundle(for: Self.self))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getHeroe()
        initSetup()
    }
    
    private func initSetup() {
        self.title = heroe?.name
    }
}

extension PopularHeroeViewController: PopularHeroeViewProtocol {
    func show(heroe: Heroe) {
        self.heroe = heroe
    }
}

//
//  HeroeDetailViewController.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 06/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroeDetailViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var presenter: HeroeDetailPresenterProtocol?
    
    init() {
        super.init(nibName: String(describing: Self.self), bundle: .module)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func closeTouchUpInside(_ sender: UIButton) {
        presenter?.closeDetail()
    }
}

extension HeroeDetailViewController: HeroeDetailViewProtocol {
    func showHeroe(_ heroe: Heroe) {
        self.titleLabel.text = heroe.name
    }
}

//
//  HeroesListHeaderCollectionViewCell.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroesListHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    
    static let id: String = "HeroesListHeaderCollectionViewCellId"
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: .module)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.profileImage.contentMode = .scaleAspectFill
        self.layer.cornerRadius = 25
    }
}

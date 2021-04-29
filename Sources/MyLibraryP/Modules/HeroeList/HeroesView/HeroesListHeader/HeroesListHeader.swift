//
//  HeroesListHeader.swift
//  ViperExample
//
//  Created by Alexis Celestino Solís on 07/10/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroesListHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    static let id: String = "HeroesListHeaderId"
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: .module)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func initSetup() {
        collectionView.register(HeroesListHeaderCollectionViewCell.nib,
                                forCellWithReuseIdentifier: HeroesListHeaderCollectionViewCell.id)
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        
    }
}

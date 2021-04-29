//
//  HeroeTableViewCell.swift
//  KavakProyect
//
//  Created by Alexis Celestino Solís on 22/09/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import UIKit

class HeroeTableViewCell: UITableViewCell {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: .module)
    }
    static let id = "HeroeTableViewCell"

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

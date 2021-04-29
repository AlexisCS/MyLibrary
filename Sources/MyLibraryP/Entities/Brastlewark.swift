//
//  Brastlewark.swift
//  KavakProyect
//
//  Created by Alexis Celestino Solís on 22/09/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

struct Brastlewark: Decodable {
    var heroes: [Heroe]
    
    enum CodingKeys: String, CodingKey {
        case heroes = "Brastlewark"
    }
}

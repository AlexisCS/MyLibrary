//
//  Heroes.swift
//  KavakProyect
//
//  Created by Alexis Celestino Solís on 22/09/20.
//  Copyright © 2020 Alexis Celestino Solís. All rights reserved.
//

import Foundation

struct Heroe: Decodable {
    var id: Int
    var name: String
    var thumbnail: String
    var age: Int
    var weight: Double
    var height: Double
    var hairColor: String
    var professions: [String]
    var friends: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case thumbnail
        case age
        case weight
        case height
        case hairColor = "hair_color"
        case professions
        case friends
    }
}

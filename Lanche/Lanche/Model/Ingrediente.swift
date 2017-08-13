//
//  Ingrediente.swift
//  Lanche
//
//  Created by Marina Guimarães on 12/08/17.
//  Copyright © 2017 Guimaraes. All rights reserved.
//

import Foundation

struct Ingrediente: Decodable {
    let id: Int
    let name: String
    let ingredients: [Int]
    let image: String
}

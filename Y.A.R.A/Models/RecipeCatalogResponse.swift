//
//  RecipeCatalogResponse.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import Foundation

struct RecipeCatalogResponse: Decodable {
    let count :Int
    let next :String?
    let previous: String?
    let results : [Recipe]?
}

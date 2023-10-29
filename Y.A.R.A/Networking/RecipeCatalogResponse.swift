//
//  RecipeCatalogResponse.swift
//  Y.A.R.A
//
//  Created by user on 29/10/2023.
//

import Foundation

struct RecipeCatalogResponse: Decodable {
    let count :Int
    let next :String?
    let previous: String?
    let results : [Recipe]?
}

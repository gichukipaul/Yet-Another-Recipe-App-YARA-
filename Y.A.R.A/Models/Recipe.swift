//
//  Recipe.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import Foundation

struct Recipe: Decodable, Hashable {    
    let pk: Int
    let title: String
    let publisher: String
    let featured_image: String
    let rating: Int
    let source_url: String
    let description: String
    let cooking_instructions: [String]?
    let ingredients: [String]
}

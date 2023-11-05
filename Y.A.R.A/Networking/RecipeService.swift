//
//  RecipeService.swift
//  Y.A.R.A
//
//  Created by Gichuki on 05/11/2023.
//

protocol RecipeService {
    func getRecipes(for name: String) async throws -> [Recipe]
}

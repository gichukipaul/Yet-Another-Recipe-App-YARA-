//
//  RecipeCatalogViewModel.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import Foundation


class RecipeCatalogViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var searchText: String = "" {
        didSet {
            Task{
               try await getRecipe(for: searchText)
            }
        }
    }
    
    init() {
        recipes = RecipeCatalogViewModel.sampleRecipes
    }
    
    private func getRecipe(for name: String) async throws {
            // Clear previous recipes
        recipes.removeAll()
        
        if name.isEmpty {
            recipes =  RecipeCatalogViewModel.sampleRecipes
            return
        }
        let data = try await NetworkManager.shared.getRecipes(for: name)
        recipes = data.sorted { $0.rating > $1.rating }
    }
}

extension RecipeCatalogViewModel {
    public static let sampleRecipes: [Recipe] = [
        Recipe(
            pk: 1902,
            title: "Sausage, Egg, and Cheese Breakfast Sandwich with Maple Butter",
            publisher: "jessica",
            featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/1902/featured_image.png",
            rating: 48,
            source_url: "http://www.twopeasandtheirpod.com/sausage-egg-and-cheese-breakfast-sandwich-with-maple-butter/",
            description: "N/A",
            cooking_instructions: nil,
            ingredients:  [
                "4 large eggs",
                "8 oz pork sausage",
                "4 slices Cheddar cheese",
                "4 English muffins, halved",
                "1 tablespoon pure maple syrup",
                "4 tablespoons salted butter, softened"
            ]),
        Recipe(
            pk: 481,
            title: "Slow Cooker Barbeque Ribs",
            publisher: "blake",
            featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/481/featured_image.png",
            rating: 40,
            source_url: "http://allrecipes.com/Recipe/Slow-Cooker-Barbecue-Ribs/Detail.aspx",
            description: "N/A",
            cooking_instructions: nil,
            ingredients:  [
                "2 cups ketchup",
                "1 dash hot sauce",
                "1 cup chili sauce",
                "4 tablespoons vinegar",
                "salt and pepper to taste",
                "2 teaspoons dried oregano",
                "1/2 cup packed brown sugar",
                "4 pounds pork baby back ribs",
                "2 teaspoons Worcestershire sauce"
            ]),
        Recipe(
            pk: 224,
            title: "Mile High Crush/ Emerald City Crush",
            publisher: "blake",
            featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/224/featured_image.png",
            rating: 26,
            source_url: "http://www.healthy-delicious.com/2014/01/pulled-jerk-chicken-mile-high-emerald-city-crusher/",
            description: "N/A",
            cooking_instructions: nil,
            ingredients:  [
                "Sprite",
                "crushed ice",
                "salt to taste",
                "1 lime, juiced",
                "1 orange, juiced",
                "&frac12; cup water",
                "6 cups cole slaw mix",
                "&frac14; cup molasses",
                "&frac14; cup soy sauce",
                "1 tablespoon olive oil",
                "2 cloves garlic, smashed",
                "&frac12; ounce triple sec",
                "&frac14; cup orange juice",
                "2 tablespoons apple cider vinegar",
                "10 small dinner rolls (1 ounce each)",
                "&frac12; ounce blue curaao (optional)",
                "1 small onion, chopped (about &frac14; cup)",
                "2 pounds boneless, skinless chicken breasts",
                "1.5 ounces Captain Morgan original spiced rum",
                "&frac14; cup Captain Morgan original spiced rum"
            ]),
        Recipe(
            pk: 1647,
            title: "Baked Brunch Omelete",
            publisher: "kiba",
            featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/1647/featured_image.png",
            rating: 85,
            source_url: "http://allrecipes.com/Recipe/Baked-Brunch-Omelet/Detail.aspx",
            description: "N/A",
            cooking_instructions: nil,
            ingredients:  [
                "8 eggs",
                "2 cups milk",
                "1 pinch salt",
                "1 cup cubed cooked ham",
                "1/4 cup chopped green onion",
                "1 dash hot pepper sauce, or to taste",
                "1 1/2 pounds Cheddar cheese, shredded",
                "1/2 (1 pound) loaf white bread, cut into cubes"
            ]),
        Recipe(
            pk: 1551,
            title: "Slow Cooker Beef and Barley Soup",
            publisher: "jessica",
            featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/1551/featured_image.png",
            rating: 41,
            source_url: "http://picky-palate.com/2013/01/14/slow-cooker-beef-and-barley-soup/",
            description: "N/A",
            cooking_instructions: nil,
            ingredients:   [
                "8.8 ounces barley",
                "1 cup chopped celery",
                "1 pound stewing beef",
                "1 teaspoon kosher salt",
                "1 1/2 cups chopped onion",
                "1/2 teaspoon kosher salt",
                "1/2 cup all-purpose flour",
                "1 small jalapeno (optional)",
                "3 tablespoons minced garlic",
                "1/4 cup chopped fresh parsley",
                "2 cups sliced carrots, peeled",
                "2 cups sliced cremini mushrooms",
                "1/2 teaspoon ground black pepper",
                "64 ounces reduced sodium beef broth",
                "2-3 tablespoons Worcestershire Sauce",
                "3 tablespoons extra virgin olive oil",
                "1 medium zucchini, sliced and chopped",
                "1/2 teaspoon freshly ground black pepper",
                "2-3 tablespoons fresh chopped thyme leaves"
            ])
    ]
}

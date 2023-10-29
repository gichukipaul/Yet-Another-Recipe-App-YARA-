//
//  RecipeDetailsView.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import SwiftUI

struct RecipeDetailsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: recipe.featured_image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
                    .frame(height: 300)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 300)
            .frame(maxWidth: .infinity)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(recipe.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    HStack {
                        Text(recipe.description)
                            .font(.body)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Text("🎖 \(recipe.rating)/100")
                            .font(.body)
                            .padding(.horizontal)
                    }
                    
                        // Ingredients
                    Text("🗒 Ingredients:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                        Text("🍴 \(ingredient)")
                            .font(.body)
                            .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("🍽 🍜 🥘", displayMode: .inline)
        }
    }
}



struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: RecipeCatalogViewModel.sampleRecipes[1])
    }
}

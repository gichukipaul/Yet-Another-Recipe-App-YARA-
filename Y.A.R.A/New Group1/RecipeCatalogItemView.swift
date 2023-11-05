//
//  RecipeCatalogItemView.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import SwiftUI

struct RecipeCatalogItemView: View {
    let recipe: Recipe
    
    var body: some View {
        ZStack {
                // Image background
            AsyncImage(url: URL(string: recipe.featured_image)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .frame(height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
                // Text at the bottom leading
            VStack {
                Spacer()
   
                    Text(recipe.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                        .padding(8)
                        .background(Color.black.opacity(0.7))
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 4)
            .padding(.horizontal, 4)
        }
    }
}

struct RecipeCatalogItemView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCatalogItemView(recipe: RecipeCatalogViewModel.sampleRecipes[1])
    }
}

//
//  ContentView.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import SwiftUI

struct RecipeCatalog: View {
    @StateObject var viewModel = RecipeCatalogViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.recipes.indices, id: \.self) { index in
                    let recipe = viewModel.recipes[index]
                    NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                        RecipeCatalogItemView(recipe: recipe)
                    }
                    .buttonStyle(.plain)
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Your Next Meal"))
            .navigationTitle("🍟 MEALS LIBRARY")
            .navigationBarTitleDisplayMode(.large)
            .accentColor(.primary)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCatalog()
            .preferredColorScheme(.dark)
    }
}

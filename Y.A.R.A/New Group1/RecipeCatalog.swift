//
//  ContentView.swift
//  Y.A.R.A - Yet Another Recipe App
//
//  Created by Gichuki on 29/10/2023.
//

import SwiftUI

struct RecipeCatalog: View {
    @StateObject var viewModel = RecipeCatalogViewModel(service: NetworkManager.shared)
    
    var body: some View {
        NavigationView {
            List(viewModel.recipes, id: \.self) { recipe in
                NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
                    RecipeCatalogItemView(recipe: recipe)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.inset)
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

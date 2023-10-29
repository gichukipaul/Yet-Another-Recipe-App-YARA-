//
//  ContentView.swift
//  Y.A.R.A
//
//  Created by user on 29/10/2023.
//

import SwiftUI

struct RecipeCatalog: View {
    @StateObject var viewModel = RecipeCatalogViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.recipes.indices, id: \.self) { index in
                    NavigationLink(destination: Text("hERE")) {
                        RecipeCatalogItemView(recipe: viewModel.recipes[index])
                    }
                    .buttonStyle(.plain)
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Your Next Meal"))
            .navigationTitle("MEAL LIBRARY")
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

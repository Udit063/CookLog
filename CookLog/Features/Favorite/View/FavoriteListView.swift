//
//  FavoriteListView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    var body: some View {
        NavigationStack {
            List(viewModel.favoriteRecipes){ recipe in
                NavigationLink{
                    RecipeDetailView(recipe: recipe)
                } label: {
                    LogListCard(recipe: recipe)
                    Text("helloo")
                }
            }
            .navigationTitle("Favorites")
            .onAppear {
                viewModel.fetchFavoriteRecipes()
            }
        }
    }
}

#Preview {
    FavoriteListView()
}

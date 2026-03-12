//
//  LogListView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct LogListView: View {
    @StateObject var viewModel = LogListViewModel()
    
    var body: some View {
        NavigationStack {
            List{
                ForEach(viewModel.recipes){ recipe in
                    NavigationLink{
                        RecipeDetailView(recipe: recipe)
                    } label: {
                        LogListCard(recipe: recipe)
                    }
                }
                .onDelete { indexSet in
                    viewModel.deleteRecipe(at: indexSet)
                }
            }
            .navigationTitle("Your Recipe List")
            .onAppear{
                viewModel.loadRecipes()
            }
        }
    }
}

#Preview {
    LogListView()
}

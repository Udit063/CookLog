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
            Group {
                if viewModel.recipes.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image(systemName: "fork.knife.circle")
                            .font(.system(size: 60))
                            .foregroundStyle(.secondary)
                        
                        Text("No Recipes Yet")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Tap the + button to create your first recipe log.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
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
                }
            }
            .navigationTitle("Your Recipe List")
        }
        .onAppear{
            viewModel.loadRecipes()
        }
    }
}

#Preview {
    LogListView()
}

//
//  FavoriteListView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI
import CoreData

struct FavoriteListView: View {
    @FetchRequest(entity: Recipe.entity(), sortDescriptors: [ NSSortDescriptor(key: "createdAt", ascending: false)
    ],
    predicate: NSPredicate(format: "isFavorite == true"))
    private var favoriteRecipes: FetchedResults<Recipe>
    
    var body: some View {
        NavigationStack {
            Group {
                if favoriteRecipes.isEmpty {
                    
                    VStack(spacing: 16) {
                        
                        Image(systemName: "heart.slash")
                            .font(.system(size: 60))
                            .foregroundStyle(.secondary)
                        
                        Text("No Favorites Yet")
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        Text("Mark recipes as favorite to see them here.")
                            .font(.body)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                } else {
                    List(favoriteRecipes){ recipe in
                        NavigationLink{
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            LogListCard(recipe: recipe)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteListView()
}

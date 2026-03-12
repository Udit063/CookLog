//
//  FavoriteListViewModel.swift
//  CookLog
//
//  Created by rentamac on 3/12/26.
//

import Foundation
import Combine

class FavoriteListViewModel: ObservableObject {
    @Published var favoriteRecipes: [Recipe] = []
    
    func fetchFavoriteRecipes() {
        favoriteRecipes = CoreDataManager.shared.fetchFavoriteRecipes()
    }
}

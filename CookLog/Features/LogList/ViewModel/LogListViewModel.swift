//
//  LogListViewModel.swift
//  CookLog
//
//  Created by rentamac on 3/12/26.
//

import Foundation
import Combine

class LogListViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func loadRecipes() {
        recipes = CoreDataManager.shared.fetchRecipes()
    }
    
    func deleteRecipe(at offsets: IndexSet) {
        offsets.forEach { index in
            CoreDataManager.shared.deleteRecipe(recipes[index])
        }
        loadRecipes()
    }
}

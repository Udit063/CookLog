//
//  CoreDataManager.swift
//  CookLog
//
//  Created by rentamac on 3/12/26.
//

import CoreData
import UIKit

class CoreDataManager {
    static let shared = CoreDataManager()
    let context = PersistenceController.shared.container.viewContext
    
    // Add Recipe
    func addRecipe(title: String, description: String, steps: [String], image: UIImage?){
        let recipe = Recipe(context: context)
        
        recipe.id = UUID()
        recipe.title = title
        recipe.descriptionText = description
        recipe.createdAt = Date()
        
        if let image = image {
            recipe.image = image.jpegData(compressionQuality: 0.8)
        }
        
        for(index, stepText) in steps.enumerated() {
            let step = Step(context: context)
            step.id = UUID()
            step.text = stepText
            step.order = Int16(index)
            step.recipe = recipe
        }
        
        save()
    }
    
    // Fetch Recipes
    func fetchRecipes() -> [Recipe] {
        let request: NSFetchRequest<Recipe> = Recipe.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Fetch error:", error)
            return []
        }
    }
    
    // Delete recipe
    func deleteRecipe(_ recipe: Recipe) {
        context.delete(recipe)
        save()
    }
    
    private func save() {
        do {
            try context.save()
        } catch {
            print("save error: ", error)
        }
    }
    
}

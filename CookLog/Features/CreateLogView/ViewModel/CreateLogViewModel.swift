//
//  CreateLogViewModel.swift
//  CookLog
//
//  Created by rentamac on 3/12/26.
//
import Foundation
import UIKit
import Combine

class CreateLogViewModel: ObservableObject{
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var steps: [String] = ["Step 1"]
    @Published var selectedImage: UIImage?
    @Published var isCreating: Bool = false
    
    var isFormValid: Bool {
        !title.trimmingCharacters(in: .whitespaces).isEmpty &&
        !description.trimmingCharacters(in: .whitespaces).isEmpty &&
        !steps.contains(where: {$0.trimmingCharacters(in: .whitespaces).isEmpty})
    }
    
    func createRecipe(
        title: String,
        description: String,
        steps: [String],
        image: UIImage?
    ){
        isCreating = true
        
        CoreDataManager.shared.addRecipe(
            title: title,
            description: description,
            steps: steps,
            image: image)
                
        resetForm()
        
        isCreating = false
    }
    
    func resetForm() {
        title = ""
        description = ""
        steps = ["Step 1"]
        selectedImage = nil
    }
}

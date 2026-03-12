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
    
    func createRecipe(
        title: String,
        description: String,
        steps: [String],
        image: UIImage?
    ){
        CoreDataManager.shared.addRecipe(
            title: title,
            description: description,
            steps: steps,
            image: image)
    }
}

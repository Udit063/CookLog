//
//  RecipeDetailView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct RecipeDetailView: View {
    @ObservedObject var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                if let data = recipe.image,
                   let uiImage = UIImage(data: data) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 600)
                        .clipped()
                } else {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: 600)
                        .clipped()
                }
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(recipe.title ?? "")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            CoreDataManager.shared.toggleFavorite(recipe: recipe)
                        } label: {
                            Image(systemName: recipe.isFavorite ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .foregroundColor(recipe.isFavorite ? .red : .gray)
                        }
                    }
                    
                    Text(recipe.descriptionText ?? "")
                        .font(.body)
                        .foregroundStyle(.secondary)
                    
                    if let date = recipe.createdAt {
                        Text(date, style: .date)
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.top, 10)
                    }
                }
                .padding()
                
                
                Text("Steps:")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                let stepsArray = (recipe.steps as? Set<Step> ?? [])
                .sorted { $0.order < $1.order }
                
                ForEach(Array(stepsArray.enumerated()), id: \.element.id) { index, step in
                    HStack(alignment: .top) {
                        Text("\(index + 1).")
                        Text(step.text ?? "")
                    }
                }
                .padding()
                
            }
        }
    }
}

//#Preview {
//    RecipeDetailView(recipe: MockData.recipe)
//}

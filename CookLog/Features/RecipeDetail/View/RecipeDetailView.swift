//
//  RecipeDetailView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(uiImage: UIImage(data: recipe.image!)!)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 600)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(recipe.title ?? "")
                            .font(.title)
                            .bold()
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20)
                                .foregroundColor(.primary)
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

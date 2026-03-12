//
//  RecipeDetailView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: RecipeMock
    var body: some View {
        ScrollView {
            VStack(alignment: .leading){
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 600)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10){
                    HStack{
                        Text(recipe.name)
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
                    
                    Text(recipe.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                }
                .padding()
                
                
                Text("Steps:")
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.top)
                
                VStack(alignment: .leading, spacing: 14) {
                    ForEach(recipe.steps.indices, id: \.self){index in
                        HStack(alignment: .top){
                            Text("\(index+1).")
                            Text("\(recipe.steps[index])")
                        }
                    }
                    .listStyle(.inset)
                }
                .padding()
                
            }
        }
    }
}

#Preview {
    RecipeDetailView(recipe: MockData.recipe)
}

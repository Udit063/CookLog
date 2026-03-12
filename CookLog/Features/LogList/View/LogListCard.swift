//
//  SwiftUIView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct LogListCard: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 10) {
            if let data = recipe.image,
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .cornerRadius(10)
            } else {
                Image("placeholder")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(recipe.title ?? "")
                    .font(.headline)
                
                Text(recipe.descriptionText ?? "")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
                
                if let date = recipe.createdAt {
                    Text("Created at: \(date.formatted(date: .abbreviated, time: .omitted))")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .padding(.top, 6)
                }
            }
        }
    }
}

//#Preview {
//    LogListCard(recipe: MockData.recipe)
//}

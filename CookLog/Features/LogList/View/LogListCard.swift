//
//  SwiftUIView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct LogListCard: View {
    let recipe: RecipeMock
    
    var body: some View {
        HStack(spacing: 10) {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .frame(width: 90)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.headline)
                
                Text(recipe.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    LogListCard(recipe: MockData.recipe)
}

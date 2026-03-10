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
        HStack {
            Image(recipe.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title2)
                    .bold()
                
                Text(recipe.description)
                    .font(.body)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    LogListCard(recipe: MockData.recipe)
}

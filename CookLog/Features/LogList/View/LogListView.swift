//
//  LogListView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct LogListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.recipes){ recipe in
                NavigationLink{
                    RecipeDetailView(recipe: recipe)
                } label: {
                    LogListCard(recipe: recipe)
                }
            }
            .navigationTitle("Your Recipe List")
        }
    }
}

#Preview {
    LogListView()
}

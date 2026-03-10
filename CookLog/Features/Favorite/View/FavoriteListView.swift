//
//  FavoriteListView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct FavoriteListView: View {
    var body: some View {
        NavigationStack {
            List(MockData.recipes){ recipe in
                LogListCard(recipe: recipe)
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteListView()
}

//
//  MainView.swift
//  CookLog
//
//  Created by rentamac on 3/10/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            CreateLogView()
                .tabItem {
                    Label("Create Log", systemImage: "plus")
                }
            
            LogListView()
                .tabItem {
                    Label("Log List", systemImage: "list.bullet")
                }
            
            FavoriteListView()
                .tabItem {
                    Label("Favorite List", systemImage: "heart.fill")
                }
        }
    }
}

#Preview {
    MainView()
}

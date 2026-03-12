//
//  CookLogApp.swift
//  CookLog
//
//  Created by rentamac on 3/7/26.
//

import SwiftUI
internal import CoreData

@main
struct CookLogApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

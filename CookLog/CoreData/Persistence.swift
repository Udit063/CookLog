//
//  Persistence.swift
//  CookLog
//
//  Created by rentamac on 3/12/26.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "CookLog")
        container.loadPersistentStores{description, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error)")
            }
        }
    }
}

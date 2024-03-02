//
//  CoreDataBootCampApp.swift
//  CoreDataBootCamp
//
//  Created by Gaurav Sara on 02/03/24.
//

import SwiftUI

@main
struct CoreDataBootCampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

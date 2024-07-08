//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Suyog K on 18/06/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct ToDoListAppApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
    init(){
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        //.modelContainer(sharedModelContainer)
    }
}

//
//  NotificatorApp.swift
//  Notificator
//
//  Created by Lewis on 26.01.2024.
//

import SwiftUI
import SwiftData

@main
struct NotificatorApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ItemL.self,
            SettingsDataModel.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}

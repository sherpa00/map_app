//
//  map_appApp.swift
//  map_app
//
//  Created by Chhewang Sherpa on 13/03/2024.
//

import SwiftUI
import SwiftData

@main
struct map_appApp: App {
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        
        @StateObject var locations: LocationsViewModel = LocationsViewModel()
        
        WindowGroup {
            LocationsView()
                .environmentObject(locations)
        }
        .modelContainer(sharedModelContainer)
    }
}

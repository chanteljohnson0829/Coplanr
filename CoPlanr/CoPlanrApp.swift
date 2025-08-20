//
//  CoPlanrApp.swift
//  CoPlanr
//
//  Created by Chantel Johnson on 7/28/25.
//

import SwiftUI
import SwiftData
import KeychainSwift

@main
struct CoPlanrApp: App {
    let keychain = KeychainSwift()
    
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
        WindowGroup {
            if(keychain.getBool("isLoggedIn") ?? false) {
                TabHolderView()
            } else {
                Welcome()
            }
            
        }
        .modelContainer(sharedModelContainer)
    }
}

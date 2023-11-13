//
//  MarvelApp_SwuiftUIApp.swift
//  MarvelApp_SwuiftUI
//
//  Created by Silvia Casanova Martinez on 12/11/23.
//

import SwiftUI

@main
struct MarvelApp_SwuiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            CharactersView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

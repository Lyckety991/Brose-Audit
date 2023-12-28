//
//  Brose_AuditApp.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI

@main
struct Brose_AuditApp: App {
    
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}

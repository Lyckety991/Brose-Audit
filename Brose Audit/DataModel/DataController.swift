//
//  DataController.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 22.12.23.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "AuditDataModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                
                print("Failed to load the data\(error.localizedDescription)")
            }

        }
    }
}

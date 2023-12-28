//
//  Audit.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 09.02.23.
//  Updated on 22.12.23

import Foundation
import UIKit
import CoreData


struct AuditData: Identifiable, Equatable {
    
    var id = UUID()
    var nameOfWorker: String
    var personalNumber: String
    var addInformation: String
    var workSection: Int
    var workStation: Int
    var selectedImage: UIImage? = nil
    var checkOSD: Int
    var checkOSDInfo: String
    
    
}

class AuditList: ObservableObject {
    
    var persistentContainer = NSPersistentContainer()
    
    @Published var audit: [AuditData] = []
    
    func addAudit(nameOfWorker: String, personalNumber: String, addInformation: String, workSection: Int, workStation: Int, selectedImage: UIImage?, checkOSD: Int, checkOSDInfo: String) {
        
        audit.append(AuditData(nameOfWorker: nameOfWorker, personalNumber: personalNumber, addInformation: addInformation, workSection: workSection, workStation: workStation, selectedImage: selectedImage, checkOSD: checkOSD, checkOSDInfo: checkOSDInfo))
        
    }
    
    func editAudit(audits: AuditData) {
        if let index = audit.firstIndex(of: audits) {
            audit.remove(at: index)
            
            let managedObjectContext = persistentContainer.viewContext
            
            let fetchRequest: NSFetchRequest<Audit> = Audit.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %@", audits.id as CVarArg)
            
            do {
                let fetchedAudits = try managedObjectContext.fetch(fetchRequest)
                if let fetchedAudit = fetchedAudits.first {
                    managedObjectContext.delete(fetchedAudit)
                    try managedObjectContext.save()
                }
            } catch {
                
            }
        }
    }
    
}

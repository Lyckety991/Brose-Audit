//
//  Audit.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 09.02.23.
//  Updated on 22.12.23

import Foundation
import UIKit


struct AuditData: Identifiable, Equatable {
    
    var id = UUID()
    var nameOfWorker: String
    var personalNumber: String
    var addInformation: String
    var workSection: Int
    var workStation: Int
    var selectedImage: UIImage?
    var checkOSD: Int
    var checkOSDInfo: String
    
    
}

class AuditList: ObservableObject {
    
    @Published var audit: [AuditData] = []
    
    func addAudit(nameOfWorker: String, personalNumber: String, addInformation: String, workSection: Int, workStation: Int, selectedImage: UIImage, checkOSD: Int, checkOSDInfo: String) {
        
        audit.append(AuditData(nameOfWorker: nameOfWorker, personalNumber: personalNumber, addInformation: addInformation, workSection: workSection, workStation: workStation, checkOSD: checkOSD, checkOSDInfo: checkOSDInfo))
        
    }
    
}

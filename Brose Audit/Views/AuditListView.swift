//
//  AudtListView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 15.02.23.
//  Updated on 23.12.23

import SwiftUI

struct AuditListView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext // Core Data Speicherung
    @Environment(\.dismiss) var dismiss
    @ObservedObject var auditList: AuditList // Verbindung zur Audit Klasse und den Funktionen
    @FocusState private var focusedField: Field? // Erkennt sobald ein Textfeld ausgewählt wird
    
    // MARK: - Variablen
    @State private var nameOfWorker = ""
    @State private var personalNumber = ""
    @State private var addInformation = ""
    
    @State var workSection: Int
    let workSectionOptions = ["-----","BMW G70 EM", "BMW G70 VM", "BMW G11/12 RR EM"]
    
    @State var workStation: Int
    let workStationOptions = ["-----", "AP1", "AP2", "AP3", "AP4", "AP5", "AP6", "EOL"]
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage? = nil
    @State private var isImagePickerDisplay = false
    
    @State var checkOSD: Int = 0
    let checkOSDOptions = ["-----","Nach Vorgabe", "Mit Mängeln"]
    
    @State var checkOSDInfo: String = ""
    
    private enum Field: Int {
        case textEdit
        
    }
   
    
   
    var body: some View {
        
        VStack {
           
            List {
              
                Section("Mitarbeiter Daten") {
                   
                    TextField("Name", text: $nameOfWorker)
                        .autocorrectionDisabled(true)
                        .focused($focusedField, equals: .textEdit).onTapGesture {
                            self.hideKeyboard()
                        }
                        
                    
                    TextField("Personalnummer", text: $personalNumber)
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled(true)
                        .focused($focusedField, equals: .textEdit).onTapGesture {
                            self.hideKeyboard()
                        }
                    
                    
                    if nameOfWorker.isEmpty || personalNumber.isEmpty {
                        Text("Name und Personalnummer müssen eingegeben werden um fortfahren.")
                            .font(.system(size: 12))
                            .foregroundColor(Color.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    
                    
                }
                .onTapGesture {
                    self.hideKeyboard()
                }
                
                
                Section("Abteilung & Anlage") {
                    Picker("Abteilung", selection: $workSection) {
                        ForEach(0..<workSectionOptions.count) { index in
                            Text(self.workSectionOptions[index])
                        }
                    }
                    
                    Picker("Arbeitsplatz", selection: $workStation) {
                        ForEach(0..<workStationOptions.count) { index in
                            Text(self.workStationOptions[index])
                        }
                    }
                }

                
                Section("Ordnung und Sauberkeit") {
                    Picker("Ordnung & Sauberkeit", selection: $checkOSD) {
                        ForEach(0..<checkOSDOptions.count) { index in
                            Text(self.checkOSDOptions[index])
                                       }
                    }
                    .font(.system(size: 15))
                    
                   
                }
                
                
                Section("Abweichungen und Mängel - OSD") {
                    Text("Geben sie alle gefundenen Mängel an")
                        .font(.system(size: 13))
                        .foregroundColor(.secondary)
                    
                    TextEditor(text: $checkOSDInfo)
                        .font(.system(size: 15))
                        .frame(width: 150, height: 150)
                        .onTapGesture {
                            hideKeyboard()
                        }
                    
                   
                    
                }
                
                Section {
                    Button {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    } label: {
                        HStack(spacing: 25) {
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Foto aufnehmen")
                        }
                        
                    }
                }
                
                
                Section {
                    
                    QuestionScrollView()
                  
                }
                
// ------------------------------------------------------------------------------------------------------------------------------------------- *
                
                Section("Zusätzliche Informationen") {
                    
                    if addInformation.isEmpty {
                        Text("Geben sie Notizen zu dem Audit an - (Optional)")
                            .foregroundColor(.secondary.opacity(1))
                            .font(.system(size: 12))
                    }
                    
                    TextEditor(text: $addInformation)
                        .frame(height: 150)
                        .font(.system(size: 15))
                        .gesture(
                                DragGesture(minimumDistance: 5, coordinateSpace: .global)
                                   
                        ).onTapGesture {
                            self.hideKeyboard()
                        }
                    
                  
                    
                }
                
                Button {
                    
                   let audit = Audit(context: managedObjContext)
                    audit.nameOfWorker = nameOfWorker
                    audit.personalNumber = personalNumber
                    audit.workStation = Int16(workStation)
                    audit.workSection = Int16(workSection)
                    audit.checkOSD = Int16(checkOSD)
                    audit.checkOSDInfo = checkOSDInfo
                    audit.addInformation = addInformation
                    audit.id = UUID()
                    
                    audit.date = Date()
                    
                    do {
                        try managedObjContext.save()
                        print("Daten erfolgreich gespeichert")
                    } catch {
                        let nsError = error as NSError
                        fatalError("Unsolved error \(nsError)")
                    }
                    dismiss()
                    
                   
                } label: {
                    Text("Weiter")
                }
                .disabled(nameOfWorker.isEmpty || personalNumber.isEmpty)
               
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Neues Audit")
        }
      
       
       
    }
}

struct AudtListView_Previews: PreviewProvider {
    static var previews: some View {
        AuditListView(auditList: AuditList(), workSection: 0, workStation: 0, checkOSD: 0)
    }
}

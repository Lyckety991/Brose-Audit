//
//  AudtListView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 15.02.23.
//  Updated on 22.12.23

import SwiftUI

struct AuditListView: View {
    
    @Environment(\.managedObjectContext) var managedObjContext // Core Data Speicherung 
    
    @State var userArray = []
    
    @State private var nameOfWorker = ""
    @State private var personalNumber = ""
    @State private var addInformation = ""
    
    @State var workSection: Int
    @State var workStation: Int
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    @State var checkOSD: Int
    @State var checkOSDInfo: String = ""
    
    private enum Field: Int {
        case textEdit
        
    }
    
    @FocusState private var focusedField: Field?
    
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
                        
                     
                        Text("--").tag(0)
                        Text("BMW G70 EM").tag(1)
                        Text("BMW G70 VM").tag(2)
                        Text("BMW G11/12 RR EM").tag(3)
                    }
                    .font(.system(size: 15))
                    
                    Picker("Arbeitsplatz", selection: $workStation) {
                        Text("--").tag(0)
                        Text("AP1").tag(1)
                        Text("AP2").tag(2)
                        Text("AP3").tag(3)
                        Text("AP4").tag(4)
                        Text("AP5").tag(5)
                        Text("AP6").tag(6)
                        Text("EOL").tag(7)
                        
                    }
                    .font(.system(size: 15))
                   
                    
                    // MARK: -> Save Button for Name and Personalnumber
                    
                    
                    Button {
                        
                        nameOfWorker = ""
                        personalNumber = ""
                        self.hideKeyboard()
                        
                    } label: {
                        Text("Speichern")
                    }
                    .disabled(nameOfWorker.isEmpty || personalNumber.isEmpty)
                    
                }
                
                Section("Ordnung und Sauberkeit") {
                    Picker("Ordnung & Sauberkeit", selection: $checkOSD) {
                        Text("--").tag(0)
                        Text("Nach Vorgabe").tag(1)
                        Text("Mit Mängel").tag(2)
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
                    
                    // Safe button
                    Button {
                        
                        checkOSDInfo = ""
                        
                    } label: {
                        Text("Speichern")
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
                    
                    Button {
                        addInformation = ""
                    } label: {
                        Text("Speichern")
                    }
                    .disabled(addInformation.isEmpty)
                    
                }
                
                NavigationLink {
                    QuestionView(checkOSD: 0)
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
        AuditListView(workSection: 0, workStation: 0, checkOSD: 0)
    }
}

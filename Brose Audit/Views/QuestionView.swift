//
//  QuestionView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 21.02.23.
//

import SwiftUI

struct QuestionView: View {
    
    
    @State var osTextEditArray = []
    @State var osImageArray = []
    @State var osBoolArray = []
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    @State var checkOSD: Int
    @State var checkOSDInfo: String = ""
    
    var body: some View {
        VStack {
            List {
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
                
                // Taking photo section
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
                    
                    
                
                // Camera Button
                
               

                
                // Navigate Button
                
                NavigationLink {
                
                    
                } label: {
                    Text("Weiter")
                }
                .disabled(check())

                
               
            }
        }
        .sheet(isPresented: self.$isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)
                    }
        
        
       
        
    }
    
    private func check() -> Bool {
        if checkOSD == 0 {
            return true
        } else {
            return false
        }
        
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(checkOSD: 0)
    }
}






// ->  <- -> -> 

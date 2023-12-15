//
//  SettingsView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 12.03.23.
//

import SwiftUI

struct SettingsView: View {
    
    
   
    
    var body: some View {
        VStack {
            
            List {
                
                Section("Nutzerdaten") {
                    VStack(alignment: .leading) {
                        Text("Patrick Lanham")
                        Text("59158")
                        
                    }
                    
                }
                
                Section("Version") {
                    VStack(alignment: .leading) {
                        Text("Version 1.1 - 03.04.2023")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("Feedback") {
                    Button {
                        
                    } label: {
                        HStack(alignment: .center) {
                           Image(systemName: "hand.thumbsup.fill")
                                .padding(.horizontal)
                            Text("Fehler/Feedback senden")
                        }
                    }
                }
                Section {
                    Button {
                        
                    } label: {
                        
                        HStack(alignment: .center) {
                            Text("Logout")
                                .foregroundColor(.red).bold()
                        }
                            
                    }
                }
                
            }
            
            
        }
        .navigationTitle("Einstellungen")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

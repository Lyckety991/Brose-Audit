//
//  WelcomeView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI

struct WelcomeView: View {
    
    @State var toDoArray = [
    
        "LPA Audit G70 EM",
        "LPA Audit B8 EM",
        "LPA Audit G70 VM"
    
    
    ]
    
    @State var dateArray = [
    
        "24.03.23",
        "15.04.23",
        "20.4.23"
    
    ]
    
    @State var toDoText = ""
    
    
    var body: some View {
        
        VStack {
           
                VStack(alignment: .center) {
                    CalendarView()
                        .padding()
                    
                   Divider()
                      
                    VStack(alignment: .center) {
                        VStack(alignment: .center) {
                           Spacer()
                            Image(systemName: "list.clipboard")
                                .resizable()
                                .frame(width: 60, height: 75)
                                .foregroundColor(.secondary)
                            Text("Alles erledigt!")
                                .font(.title2)
                                .foregroundColor(.secondary)
                            
                           Spacer()
                            
                        }
                        
                    }
                   
                }
           
            NavigationLink {
                AuditListView(workSection: 0, workStation: 0, checkOSD: 0)
            } label: {
              CustomButton(text: "Neues Audit anlegen")
                    .foregroundColor(.white)
            }
            
            
        }
        .toolbar(.hidden, for: .navigationBar)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .navigationTitle("Willkommen bei Brose Audit")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}
    

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

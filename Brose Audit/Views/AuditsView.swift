//
//  AuditsView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 09.02.23.
//

import SwiftUI

struct AuditsView: View {
    
    var auditArray: [AuditData]
  
    
    var body: some View {
       
         
            VStack(alignment: .leading) {
               
                
                Text("Guten Tag")
                    .bold()
                    .font(.system(size: 25))
                Text("Ihre heutigen Aufgaben:")
                    .font(.subheadline)
                Divider()
                
                ZStack {
                   
                    List {
                        
                            ForEach(auditArray, id: \.title) { title in
                                
                                NavigationLink {
                                    AuditDetailView()
                                } label: {
                                    
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                      
                                        HStack {
                                            Text(title.title)
                                                .bold()
                                            
                                        }
                                          
                                        Text(title.toDo)
                                       
                                            Text(title.subtitle)
                                           
                                        
                                        Text(title.date)
                                        
                                    }
                                    
                                }
                               
                               
                            }
                          
                           
                            .padding()
                         
                    }
                    
                    
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(5)
                    
                    .background(Color("Background")).edgesIgnoringSafeArea(.all)
                    
                }
               
                Spacer()
                    
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        
       
    }
}

struct AuditsView_Previews: PreviewProvider {
    static var previews: some View {
        AuditsView(auditArray: [AuditData(title: "G70 EM", subtitle: "LPA Audit Mitarbeiter", toDo: "O+S, Unterweisungen,", date: "23.03.2023")])
    }
}

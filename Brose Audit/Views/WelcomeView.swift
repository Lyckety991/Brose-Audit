//
//  WelcomeView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI

struct WelcomeView: View {
    
    @ObservedObject var auditList: AuditList = AuditList()
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var audit:
    FetchedResults<Audit>
    
  
    
    var body: some View {
        
        
      
        
        NavigationView {
           
                VStack(alignment: .center) {
                    
                   
                 
                    ScrollView {
                        
                        ForEach(audit) { audits in
                            AuditDetail(title: audits.nameOfWorker!, producLine: audits.personalNumber!, date: audits.date!)
                        }
                    
                         
                            
                        
                    }
                   
                   
                }
                .navigationTitle("Übersicht")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SettingsView()
                        } label: {
                            Image(systemName: "gear.circle")
                                .bold()
                        }
                        
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            AuditListView(auditList: AuditList(), workSection: 0, workStation: 0, checkOSD: 0)
                        } label: {
                            Image(systemName: "chart.bar.doc.horizontal")
                                    .bold()
                       
                        }
                        
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            
                        } label: {
                            Image(systemName: "chart.xyaxis.line")
                                .bold()
                           
                        }
                        
                    }
                }
            
            
           
           
          
           
            
            
        }
      
       
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
    }
}
    

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}

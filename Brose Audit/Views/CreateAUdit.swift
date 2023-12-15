//
//  CreateAUdit.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 09.02.23.
//

import SwiftUI


struct CreateAUdit: View {
    
   
    @State var auditArray = [AuditData]()
    
    @State var title: String = ""
    @State var subtitle: String = ""
    @State var toDo: String = ""
    @State var date: String = ""
    
    var body: some View {
        
        VStack {
            
            
            Spacer()
            
            VStack(alignment: .leading) {
                
                Text("Neues Audit anlegen")
                    .bold()
                    .font(.system(size: 25))
                    
                Divider()
                
               
                VStack(alignment: .center) {
                    Spacer()
                    
                    TextField("Abteilung", text: $title)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(5)
                        
                    
                    TextField("Welches Audit", text: $subtitle)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(5)
                       
                  
                    TextField("Datum", text: $date)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(5)
                    
                    TextEditor(text: $toDo)
                        .foregroundColor(Color("Button"))
                        .lineLimit(0)
                        .multilineTextAlignment(.leading)
                        
                    Spacer()
                    
                }
                
            }
            .padding(.horizontal, 20)
            
            Button {
               
               
                self.auditArray.append(AuditData(title: self.title, subtitle: self.subtitle, toDo: self.toDo, date: self.date))
                self.title = ""
                self.subtitle = ""
                self.toDo = ""
                self.date = ""
                
               
            } label: {
                CustomButton(text: "Audit anlegen")
            }
            .padding(.bottom, 100)
            
            NavigationLink {
                AuditsView(auditArray: auditArray)
            } label: {
                Text("Weiter")
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Background"))
        
    }
}

struct CreateAUdit_Previews: PreviewProvider {
    static var previews: some View {
        CreateAUdit()
    }
}

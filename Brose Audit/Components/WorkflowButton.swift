//
//  WorkflowButton.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI


struct WorkflowButton: View {
    
    @State private var mainText: String = ""
    @State private var subText: String = ""
    @State private var date: String = ""
    @State private var important: Bool = false
    
    
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text("Wöchentliches LPA Audit")
                .bold()
            HStack {
                Text("BMW G70 EM")
                   
                Text("13.03.2023")
                    .bold(true)
            }
            
           
               
        }
        .foregroundColor(.secondary)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background()
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal, 10)
        
    }
}

struct WorkflowButton_Previews: PreviewProvider {
    static var previews: some View {
        WorkflowButton()
    }
}

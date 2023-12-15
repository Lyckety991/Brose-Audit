//
//  CalendarView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 25.02.23.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var date = Date()
    
    
    
    var body: some View {
        DatePicker("Date", selection: $date, displayedComponents: [.date])
            .datePickerStyle(.graphical)
            
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

//
//  AuditDetail.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 27.12.23.
//

import SwiftUI

struct AuditDetail: View {
    
    var title: String
    var producLine: String
    var date: Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 75)
                .foregroundStyle(.white)
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .foregroundStyle(.black)
                        .font(.headline)
                        .fontWeight(.semibold)
                    Text(producLine)
                        .font(.system(size: 15))
                        .bold()
                        .foregroundStyle(.teal)
                    Text(date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                }
                .padding()
                Spacer()
                Image(systemName: "")
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AuditDetail(title: "Audit", producLine: "G70 EM", date: Date())
}

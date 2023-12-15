//
//  CustomButton.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 08.02.23.
//

import SwiftUI

struct CustomButton: View {
    @State var text: String
    @State var background: Color = Color("Button")
    var body: some View {
        Text(text)
            .bold()
            .font(.system(size: 20))
            .padding()
            .frame(maxWidth: 250, maxHeight: 50)
            .foregroundColor(.white)
            .background(background)
            .cornerRadius(5)
            .shadow(radius: 5)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Login")
    }
}

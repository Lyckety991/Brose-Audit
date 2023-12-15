//
//  QuestionScrollView.swift
//  Brose Audit
//
//  Created by Patrick Lanham on 05.03.23.
//

import SwiftUI

struct QuestionScrollView: View {
    
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    
    var body: some View {
        ScrollView(.horizontal) {
            VStack(alignment: .center) {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                } else {
                    HStack {
                        Text("Keine Bilder verfügbar")
                            .font(.title2)
                        Divider()
                       
                    }
                   
                    
                }
            }
        }
       
    }
}

struct QuestionScrollView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionScrollView()
    }
}

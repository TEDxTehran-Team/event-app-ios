//
//  TextField.swift
//  EventApp
//
//  Created by ali on 5/10/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct CustomTextFieeld: View {
    
    @State var text: String
    @State var placeHolder: String
    
    var body: some View {
            HStack {
                Image(systemName: "iphone")
                    .padding([.leading, .trailing], 5)
                TextField(placeHolder, text: $text)
                    .padding([.trailing], 5)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
            }
            .frame(height: 55)
            .border(Color(.lightGray), width: 3)
            .background(Color.clear)
            .cornerRadius(6)
            .padding(15)
//            .background(Color.blue)
    }
}

struct CustomTextFieeld_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomTextFieeld(text: "", placeHolder: "PhoneNumber")
            .previewDevice("iPhone 6s")
    }
}

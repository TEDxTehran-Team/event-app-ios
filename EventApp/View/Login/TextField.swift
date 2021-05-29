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
        TextField(placeHolder, text: $text)
            .multilineTextAlignment(.trailing)
            .frame(height: 52)
            .cornerRadius(6)
            .border(Color(.lightGray))
            .padding()
        
    }
}

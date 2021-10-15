//
//  TextFieldWithImage.swift
//  Formaloo
//
//  Created by Tadeh Alexani on 9/27/20.
//

import SwiftUI

struct TextFieldWithImage: View {
    
    @Binding var text: String
    let placeholder: String
    let imageName: String
    var isFieldSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    var textFieldIdentifier: String = ""
    var secureTextFieldIdentifier: String = ""
    
    var body: some View {
        HStack {
            if imageName != "" {
                Image(uiImage: UIImage(systemName: imageName) ?? UIImage(named: imageName)!)
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
            }
            if isFieldSecure {
                TextField(placeholder.localized(), text: $text)
                .accessibility(identifier: secureTextFieldIdentifier)
            } else {
                TextField(placeholder.localized(), text: $text)
                    .accessibility(identifier: textFieldIdentifier)
                    .keyboardType(keyboardType)
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(lineWidth: 1)
                .foregroundColor(.gray)
        )
    }
}


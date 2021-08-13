//
//  LoginView.swift
//  EventApp
//
//  Created by ali on 5/8/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @ObservedObject var viewModel = PhoneNumberViewModel()
    @Binding var loginToken: String
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                Image("tedx-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width*13/20)
                
                Text("welcome_title_networking".localized())
                    .font(.headline)
                    .bold()
                
                
                Text("networking_message".localized())
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextFieldWithImage(text: $viewModel.phoneNumber, placeholder: "Phone Number", imageName: "iphone")
                    .padding(.top, 20)
                
                Spacer()
                
                Text("Get Code".localized())
                    .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
                    .frame(width: geo.size.width - 40, height: 62, alignment: .center)
                    .foregroundColor(Color.white)
                    .background(Colors.primaryRed)
                    .cornerRadius(5)
                    .padding(.bottom, 40)
                    .onTapGesture(count: 1, perform: {
                        viewModel.setup() { token in
                            self.loginToken = token
                        }
                    })
            }
            .padding()
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhoneNumberView(loginToken: .constant(""))
        }
    }
}

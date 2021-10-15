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
    @Binding var loginSetting: LoginSetting
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Image("tedx-logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width*13/20)
                    
                    Text("welcome_title_networking".localized())
                        .font(.headline)
                        .bold()
                        .foregroundColor(Colors.darkTextColor)
                    
                    
                    Text("networking_message".localized())
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    
                    TextFieldWithImage(text: $viewModel.phoneNumber, placeholder: "Phone Number", imageName: "iphone", keyboardType: .numberPad)
                        .keyboardType(.numberPad)
                        .padding(.top, 20)
                    
                    Spacer()
                    
                    RoundButton("Get Code".localized(), width: geo.size.width - 40, height: 62, alignment: .center)
                        .padding(.bottom, 40)
                        .onTapGesture(count: 1, perform: {
                            viewModel.sendCode() { token in
                                self.loginSetting.phoneNumber = viewModel.phoneNumber
                                self.loginSetting.loginToken = token
                            }
                        })
                }
                .padding()
                .onTapGesture {
                    hideKeyboard()
                }
                if self.viewModel.statusView == .loading {
                    Indicator()
                }
            }
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            PhoneNumberView(loginSetting: .constant(LoginSetting()))
        }
    }
}

//
//  OTPView.swift
//  EventApp
//
//  Created by ali on 5/8/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct OTPView: View {
    
    @ObservedObject var viewModel = OTPViewModel()
    @Binding var loginSetting: LoginSetting
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 20) {
                Spacer()
                
                Text("validation".localized())
                    .font(.headline)
                    .bold()
                    .foregroundColor(Colors.darkTextColor)
                
                
                LocalizedNumberText("validation_message %@".localize(with: DataManager.shared.phoneNumber))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                TextFieldWithImage(text: $viewModel.code, placeholder: "verification_code", imageName: "iphone", keyboardType: .numberPad)
                    .padding(.top, 60)
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.sendCode(phoneNumber: loginSetting.phoneNumber) { loginToken in
                            loginSetting.loginToken = loginToken
                        }
                    } label: {
                        Text("ارسال مجدد کد تایید")
                            .customFont(name: Configuration.shabnam, style: .caption1, weight: .medium)
                            .foregroundColor(.gray)
                    }
                    
                    Text("|")
                        .customFont(name: Configuration.shabnam, style: .caption1, weight: .medium)
                        .foregroundColor(.gray)
                        .padding()
                    
                    Button {
                        loginSetting.loginToken = ""
                    } label: {
                        Text("تصحیح شماره")
                            .customFont(name: Configuration.shabnam, style: .caption1, weight: .medium)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .frame(width: geo.size.width - 40, height: 62, alignment: .center)
                
                Spacer()
                
                RoundButton("Register".localized(), width: geo.size.width - 40, height: 62, alignment: .center)
                    .padding(.bottom, 40)
                    .onTapGesture(count: 1, perform: {
                        viewModel.login(token: self.loginSetting.loginToken) { token in
                            if token.isEmpty {
                                #warning("Show alert")
                                loginSetting.loginToken = ""
                            } else {
                                DataManager.shared.phoneNumber = loginSetting.phoneNumber
                                loginSetting.token = token
                            }
                        }
                    })
            }
            .padding()
            .onTapGesture {
                hideKeyboard()
            }
        }
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(loginSetting: .constant(LoginSetting()))
    }
}

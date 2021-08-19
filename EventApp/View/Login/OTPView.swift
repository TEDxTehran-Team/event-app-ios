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
        VStack(alignment: .center) {
            Spacer()
            
            Text("validation".localized())
                .customFont(name: Configuration.shabnamBold, size: 36, weight: .bold)
                .foregroundColor(Colors.darkTextColor)
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 15)

            
            Text("validation_message %@".localize(with: DataManager.shared.phoneNumber))
                .customFont(name: Configuration.shabnam, size: 16, weight: .bold)
                .foregroundColor(Colors.darkTextColor)
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 40)
                .lineLimit(4)

            CustomTextField
            
            Spacer()
            
            chatButton
                .padding(.bottom, 40)
                .onTapGesture(count: 1, perform: {
                    viewModel.setup(token: self.loginSetting.loginToken) { token in
                        if token.isEmpty {
                            loginSetting.loginToken = ""
                        } else {
                            loginSetting.token = token
                        }
                    }
                })
        }
    }
}

extension OTPView {
    private var chatButton: some View {
        Text("register".localized())
            .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
            .frame(width: 290, height: 62, alignment: .center)
            .foregroundColor(Color.white)
            .background(Colors.primaryRed)
            .cornerRadius(5)
    }
    
    var CustomTextField: some View {
        HStack {
            Image(systemName: "iphone")
                .padding([.leading, .trailing], 5)
            TextField("verification_code".localized(), text: $viewModel.code)
                .padding([.trailing], 5)
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
        }
        .frame(height: 55)
        .border(Color(.lightGray), width: 3)
        .background(Color.clear)
        .cornerRadius(6)
        .padding(15)
    }
}

struct OTPView_Previews: PreviewProvider {
    static var previews: some View {
        OTPView(loginSetting: .constant(LoginSetting()))
    }
}

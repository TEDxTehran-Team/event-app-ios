//
//  LoginView.swift
//  EventApp
//
//  Created by ali on 5/8/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            Text("اعتبارسنجی")
                .customFont(name: Configuration.shabnamBold, style: .title2, weight: .bold)
                .padding(.bottom, 20)
            
            CustomTextFieeld(text: phoneNumber, placeHolder: "شماره تلفن")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
        }
    }
}

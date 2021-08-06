//
//  LoginView.swift
//  EventApp
//
//  Created by ali on 5/8/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @State var phoneNumber: String = ""
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image("tedx-logo")
                .resizable()
                .frame(height: 67)
                .padding(20)
            
            Text(LocalizedStringKey("welcome_title_networking"))
                .customFont(name: Configuration.shabnamBold, size: 36, weight: .bold)
                .foregroundColor(Colors.darkTextColor)
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 15)

            
            Text(LocalizedStringKey("networking_message"))
                .customFont(name: Configuration.shabnam, size: 16, weight: .bold)
                .foregroundColor(Colors.darkTextColor)
                .padding([.leading, .trailing], 10)
                .padding(.bottom, 40)
                .lineLimit(4)

            CustomTextFieeld(text: phoneNumber, placeHolder: LocalizedStringKey("Phone Number").stringKey)
            
            Spacer()
            
            chatButton
                .padding(.bottom, 40)
                .onTapGesture(count: 1, perform: {
//                    viewmo
                })
        }
    }
}

extension PhoneNumberView {
    private var chatButton: some View {
        Text(LocalizedStringKey("Get Code"))
            .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
            .frame(width: 290, height: 62, alignment: .center)
            .foregroundColor(Color.white)
            .background(Colors.primaryRed)
            .cornerRadius(5)
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhoneNumberView()
        }
    }
}

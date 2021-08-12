//
//  ProfileTabBar.swift
//  EventApp
//
//  Created by ali on 4/16/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var loginToken: String = ""
    @Published var token: String = DataManager.shared.token
}

struct ProfileTabBar: View {
    
    @State private var selectedTab: Int = 1
    @ObservedObject var userSettings = UserSettings()

    var body: some View {
//        if userSettings.token.isEmpty {
//            if userSettings.loginToken.isEmpty {
//                PhoneNumberView(loginToken: $userSettings.loginToken)
//            } else {
//                OTPView(loginToken: $userSettings.loginToken, token: $userSettings.token)
//            }
//        } else {
//            tabBarView
//        }
        LoadingView()
    }
}

extension ProfileTabBar {
    private var tabBarView: some View {
        VStack{
            ScrollableTabView(activeIdx: $selectedTab, dataSet: [LocalizedStringKey("Chats"), LocalizedStringKey("YourProfile")])
                .frame(width: UIScreen.main.bounds.width, height: 40)
            
            //            if self.ViewModel.statusView == .loading {
            //                Spacer()
            //                Indicator()
            //            } else {
            
            
            //            Spacer()
            if selectedTab == 0 {
                ChatHistoryView()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
            } else {
                ProfileView(isMyProfile: true, userId: "!")
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
            }
            Spacer()
            //        }
        }
    }
}

struct ProfileTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileTabBar()
    }
}

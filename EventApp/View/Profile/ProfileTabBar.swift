//
//  ProfileTabBar.swift
//  EventApp
//
//  Created by ali on 4/16/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var loginSetting = LoginSetting()
}

struct LoginSetting {
    var loginToken: String = ""
    var token: String = DataManager.shared.token
}

struct ProfileTabBar: View {
    
    @State private var selectedTab: Int = 1
    @ObservedObject var userSettings = UserSettings()

    var body: some View {
        if userSettings.loginSetting.token.isEmpty {
            if userSettings.loginSetting.loginToken.isEmpty {
                PhoneNumberView(loginSetting: $userSettings.loginSetting)
            } else {
                OTPView(loginSetting: $userSettings.loginSetting)
            }
        } else {
            tabBarView
        }
    }
}

extension ProfileTabBar {
    private var tabBarView: some View {
        VStack{
            ScrollableTabView(activeIdx: $selectedTab, dataSet: ["Chats", "YourProfile"])
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

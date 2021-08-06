//
//  ProfileTabBar.swift
//  EventApp
//
//  Created by ali on 4/16/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct ProfileTabBar: View {
    
    @State private var selectedTab:Int = 1
    
    var body: some View {
//        VStack {
//            ScrollableTabView(activeIdx: $selectedTab, dataSet: [LocalizedStringKey("Chats"), LocalizedStringKey("YourProfile")])
//                .frame(width: UIScreen.main.bounds.width, height: 40)
//
//            //            if self.ViewModel.statusView == .loading {
//            //                Spacer()
//            //                Indicator()
//            //            } else {
//
//
////            Spacer()
//            if selectedTab == 0 {
//                ChatHistoryView()
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
//            } else {
//                ProfileView(isMyProfile: true, userId: "!")
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 120)
//            }
//            Spacer()
//            //        }
//        }
        PhoneNumberView()
    }
}

struct ProfileTabBar_Previews: PreviewProvider {
    
    static var previews: some View {
        ProfileTabBar()
    }
}

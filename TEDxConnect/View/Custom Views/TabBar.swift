//
//  TabBar.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/25/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TabBar : View {
  
  @Binding var selectedTab: Int
  
  var body: some View {
    
    HStack {
    
      TabBarButton(selectedTab: $selectedTab, tabNumber: 0, title: NSLocalizedString("Detail", comment: ""))
      TabBarButton(selectedTab: $selectedTab, tabNumber: 1, title: NSLocalizedString("Timetable", comment: ""))
      TabBarButton(selectedTab: $selectedTab, tabNumber: 2, title: NSLocalizedString("Speakers", comment: ""))
    }
    .padding(8)
    .background(Colors.primaryLightRed)
    .clipShape(Capsule())
    .animation(.default)
    .environment(\.layoutDirection, .rightToLeft)
  }
}

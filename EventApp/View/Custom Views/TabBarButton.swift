//
//  TabBarButton.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/25/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TabBarButton: View {
  
  @Binding var selectedTab: Int
  var tabNumber: Int
  var title: String
  
  var body: some View {
    
    Button(action: {
      
      self.selectedTab = tabNumber
      
    }) {
      
    LocalizedNumberText(title)
        .padding(.vertical, 4)
        .padding(.horizontal, 30)
        .background(selectedTab == tabNumber ? Colors.primaryBackground : Color.clear)
        .clipShape(Capsule())
    }
    .foregroundColor(selectedTab == tabNumber ? Colors.primaryRed : Color.white)
    
  }
}


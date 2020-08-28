//
//  AppView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AppView: View {
  
  var body: some View {
    TabView {
      NavigationView {
        NewsView()
      }
      .tag(0)
      .tabItem {
        Image(systemName: "text.aligncenter")
        Text("News")
      }
    }
    .font(.headline)
    .accentColor(.primaryRed)
    
  }
  
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
  }
}

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
        EventDetailView()
      }
      .tag(0)
      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }

      NavigationView {
        NewsView()
      }
      .tag(1)
      .tabItem {
        Image(systemName: "text.aligncenter")
        Text("News")
      }
      
      NavigationView {
        AboutView()
      }
      .tag(2)
      .tabItem {
        Image(systemName: "info")
        Text("About")
      }
      
      NavigationView {
        GalleryView()
      }
      .tag(3)
      .tabItem {
        Image(systemName: "square.grid.2x2")
        Text("Gallery")
      }

    }
    .customFont(name: Fonts.shabnam, style: .headline)
    .accentColor(Colors.primaryRed)
    
  }
  
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView()
  }
}

//
//  AppView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AppView: View {
  
  var eventViewModel = EventViewModel()
  var dayViewModel = DayViewModel()
  var newsViewModel = NewsViewModel()
  var albumViewModel = AlbumViewModel()
  var talkViewModel = TalkViewModel()
  var featuredTalkViewModel = FeaturedTalkViewModel()
  
  @State private var selection = 3

  var body: some View {
    TabView(selection: $selection) {
      NavigationView {
        TalksView()
          .environmentObject(talkViewModel)
          .environmentObject(featuredTalkViewModel)
      }
      .tag(0)
      .tabItem {
        Image(systemName: "music.mic")
        Text("Talks")
      }
      
      NavigationView {
        GalleryView()
          .environmentObject(albumViewModel)
      }
      .tag(1)
      .tabItem {
        Image(systemName: "photo.on.rectangle")
        Text("Gallery")
      }

      NavigationView {
        NewsView()
          .environmentObject(newsViewModel)
      }
      .tag(2)
      .tabItem {
        Image(systemName: "text.aligncenter")
        Text("News")
      }
    
      NavigationView {
        EventView()
          .environmentObject(eventViewModel)
          .environmentObject(dayViewModel)
      }
      .tag(3)
      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }
      
    }
    .customFont(name: Fonts.shabnam, style: .headline)
    .accentColor(Colors.primaryRed)
    .onAppear {
      self.eventViewModel.setup()
      self.dayViewModel.setup()
      self.newsViewModel.setup()
      self.albumViewModel.setup()
      self.talkViewModel.setup()
      self.featuredTalkViewModel.setup()
    }
    
  }
  
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView().environment(\.locale, .init(identifier: "fa_IR"))
  }
}

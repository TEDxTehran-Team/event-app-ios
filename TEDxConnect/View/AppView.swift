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
  /*
  init() {
    UITableView.appearance().backgroundColor = .clear // tableview background
    UITableViewCell.appearance().backgroundColor = .clear // cell background
  }
  */
  var body: some View {
    TabView {
      NavigationView {
        EventDetailView()
          .environmentObject(eventViewModel)
      }
      .tag(0)
      .tabItem {
        Image(systemName: "house")
        Text("Home")
      }
      
      NavigationView {
        TimeTableView()
          .environmentObject(dayViewModel)
      }
      .tag(1)
      .tabItem {
        Image(systemName: "clock")
        Text("Timetable")
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
        GalleryView()
          .environmentObject(albumViewModel)
      }
      .tag(3)
      .tabItem {
        Image(systemName: "photo.on.rectangle")
        Text("Gallery")
      }
      
      NavigationView {
        TalksView()
          .environmentObject(talkViewModel)
          .environmentObject(featuredTalkViewModel)
      }
      .tag(4)
      .tabItem {
        Image(systemName: "music.mic")
        Text("Talks")
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
    AppView()
  }
}

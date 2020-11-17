//
//  AppView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AppView: View {
    
    @ObservedObject var eventViewModel = EventViewModel()
    @ObservedObject var dayViewModel = DayViewModel()
    @ObservedObject var newsViewModel = NewsViewModel()
    @ObservedObject var albumViewModel = AlbumViewModel()
    @ObservedObject var speakerViewModel = SpeakerViewModel()
    @ObservedObject var talkViewModel = TalkViewModel()
    @ObservedObject var featuredTalkViewModel = FeaturedTalkViewModel()
    
    @State private var selection = 3
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationView {
                TalksView(talkViewModel: self.talkViewModel, featuredTalkViewModel: self.featuredTalkViewModel)
            }
            .tag(0)
            .tabItem {
                Image(systemName: "music.mic")
                Text(LocalizedStringKey("Talks"))
            }
            
            NavigationView {
                GalleryView()
                    .environmentObject(albumViewModel)
            }
            .tag(1)
            .tabItem {
                Image(systemName: "photo.on.rectangle")
                Text(LocalizedStringKey("Gallery"))
            }
            
            NavigationView {
                NewsView()
                    .environmentObject(newsViewModel)
            }
            .tag(2)
            .tabItem {
                Image(systemName: "text.aligncenter")
                Text(LocalizedStringKey("News"))
            }
            
            
            NavigationView {
                HomeTabUIView(eventViewModel: self.eventViewModel,dayViewModel: self.dayViewModel, speakerViewModel: self.speakerViewModel)
            }
            .tag(3)
            .tabItem {
                Image(systemName: "house")
                Text(LocalizedStringKey("Home"))
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
            self.speakerViewModel.setup()
        }
        
    }
    
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView().environment(\.locale, .init(identifier: "fa_IR"))
    }
}

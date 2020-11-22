//
//  AppView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI


enum AppTabViewItem {
    case home
    case news
    case gallery
    case talks
}

struct AppView: View {
    
    @ObservedObject var eventViewModel = EventViewModel()
    @ObservedObject var dayViewModel = DayViewModel()
    @ObservedObject var newsViewModel = NewsViewModel()
    @ObservedObject var albumViewModel = AlbumViewModel()
    @ObservedObject var speakerViewModel = SpeakerViewModel()
    @ObservedObject var talkViewModel = TalkViewModel()
    @ObservedObject var featuredTalkViewModel = FeaturedTalkViewModel()
    
    
    @State private var tabSelected:AppTabViewItem = .home
    
    var body: some View {
        NavigationView {
            TabView(selection: self.$tabSelected) {
                TalksView(talkViewModel: self.talkViewModel, featuredTalkViewModel: self.featuredTalkViewModel)
                    .tag(AppTabViewItem.talks)
                    .tabItem {
                        Image(systemName: "music.mic")
                        Text("Talks".localized())
                    }
                
                GalleryView(viewModel: self.albumViewModel)
                    .tag(AppTabViewItem.gallery)
                    .tabItem {
                        Image(systemName: "photo.on.rectangle")
                        Text("Gallery".localized())
                    }
                
                NewsView(viewModel: self.newsViewModel)
                    .tag(AppTabViewItem.news)
                    .tabItem {
                        Image(systemName: "text.aligncenter")
                        Text("News".localized())
                        
                    }
                
                
                HomeTabUIView(eventViewModel: self.eventViewModel,dayViewModel: self.dayViewModel, speakerViewModel: self.speakerViewModel)
                    .tag(AppTabViewItem.home)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home".localized())
                    }
                
            }
            .navigationBarTitle(Text(self.tabSelected.title), displayMode: .inline)
            .navigationBarItems(trailing: NavigationLink(destination: AboutView(), label: {
                Image(systemName: "info.circle")
            }))
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
    
}

extension AppTabViewItem {
    var title :String {
        
        var value = "Home"
        switch self {
        case .home:
            value = "Home"
        case .gallery:
            value = "Gallery"
        case .news:
            value  = "News"
        case .talks:
            value = "Talks"
        }
        
        return value.localized()
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

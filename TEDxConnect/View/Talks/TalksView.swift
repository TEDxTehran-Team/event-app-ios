//
//  TalksView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TalksView: View {
  
  @ObservedObject var talkViewModel = TalkViewModel()
  @ObservedObject var featuredTalkViewModel = FeaturedTalkViewModel()
  
  var body: some View {
    ZStack {
      if self.talkViewModel.statusView == .complete {
        VStack(spacing: 10) {
          List {
            
            FeaturedTalkView(talk: featuredTalkViewModel.repository)
            
            ForEach(talkViewModel.repositories, id: \.self) { talkWithEvent in
              Group {
                if talkWithEvent.talks.count != 0 {
                  VStack(alignment: .leading, spacing: 10) {
                    Text(talkWithEvent.event.title ?? "")
                      .foregroundColor(.secondary)
                    TalksRow(talks: talkWithEvent.talks)
                  }
                } else {
                  EmptyView()
                }
              }
              
            }
            
          }
        }
        
      }
      
      if self.talkViewModel.statusView == .loading && self.featuredTalkViewModel.statusView == .loading {
        Indicator()
      }
      
      if self.talkViewModel.statusView == .error || self.featuredTalkViewModel.statusView == .error {
        
        Text(self.talkViewModel.errorMessage == "" ? self.featuredTalkViewModel.errorMessage : self.talkViewModel.errorMessage)
          .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Talks"), displayMode: .inline)
    .onAppear {
      UITableView.appearance().separatorStyle = .none
      self.talkViewModel.setup()
      self.featuredTalkViewModel.setup()
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  }
}

struct TalksView_Previews: PreviewProvider {
  static var previews: some View {
    TalksView()
  }
}

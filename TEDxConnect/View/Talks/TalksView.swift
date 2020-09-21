//
//  TalksView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TalksView: View {
  
  @EnvironmentObject var talkViewModel: TalkViewModel
  @EnvironmentObject var featuredTalkViewModel: FeaturedTalkViewModel
  
  var body: some View {
    ZStack {
      if self.talkViewModel.statusView == .complete {
        ScrollView(.vertical) {
          
          FeaturedTalkView(talk: featuredTalkViewModel.repository)
          
          ForEach(talkViewModel.repositories, id: \.self) { talkWithEvent in
            Group {
              if talkWithEvent.talks.count != 0 {
                VStack(alignment: .leading, spacing: 10) {
                  Text(talkWithEvent.event.title ?? "")
                    .foregroundColor(.secondary)
                    .padding()
                  TalksRow(talks: talkWithEvent.talks)
                }
              } else {
                EmptyView()
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
  }
}

struct TalksView_Previews: PreviewProvider {
  static var previews: some View {
    TalksView()
      .environmentObject(TalkViewModel())
      .environmentObject(FeaturedTalkViewModel())
  }
}

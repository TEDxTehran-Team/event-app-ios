//
//  TalksView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TalksView: View {
    
    var talkViewModel: TalkViewModel
    var featuredTalkViewModel: FeaturedTalkViewModel
    
    var body: some View {
        VStack {
            if self.talkViewModel.statusView == .complete {
                ScrollView(.vertical) {
                    
                    FeaturedTalkView(talk: featuredTalkViewModel.repository)
                    
                    ForEach(talkViewModel.repositories, id: \.self) { talkWithEvent in
                        VStack  {
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    Text(talkWithEvent.event.title ?? "")
                                        .foregroundColor(.secondary)
                                        .padding(.horizontal)
                                    
                                }
                                .padding(.top)
                                
                                TalksRow(talks: talkWithEvent.talks)
                                    .padding(.top,5)
                            }
                        }
                        
                    }
                    
                }
                
                
            }else if self.talkViewModel.statusView == .loading && self.featuredTalkViewModel.statusView == .loading {
                Indicator()
            }else if self.talkViewModel.statusView == .error || self.featuredTalkViewModel.statusView == .error {
                ErrorView(errorText: self.talkViewModel.errorMessage == "" ? self.featuredTalkViewModel.errorMessage : self.talkViewModel.errorMessage)
                    .onTapGesture {
                        self.talkViewModel.errorMessage == "" ? featuredTalkViewModel.setup() : talkViewModel.setup()
                    }
            }
        }
    }
}

struct TalksView_Previews: PreviewProvider {
    static var previews: some View {
        TalksView(talkViewModel: TalkViewModel(), featuredTalkViewModel: FeaturedTalkViewModel())
    }
}

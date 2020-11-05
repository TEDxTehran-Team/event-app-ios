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
        VStack {
            if self.talkViewModel.statusView == .complete {
                ScrollView(.vertical) {
                    
                    FeaturedTalkView(talk: featuredTalkViewModel.repository)
                    
                    ForEach(talkViewModel.repositories, id: \.self) { talkWithEvent in
                        VStack  {
                            if talkWithEvent.talks.count != 0 {
                                VStack {
                                    HStack {
                                        Text(talkWithEvent.event.title ?? "")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal)
                                        
                                        Spacer()
                                        
                                    }.padding(.horizontal)
                                    .padding(.horizontal)
                                    
                                    TalksRow(talks: talkWithEvent.talks)
                                }
                                
                            } else {
                                EmptyView()
                            }
                        }
                        
                    }
                    
                }
                .environment(\.layoutDirection, .rightToLeft)
                
            }else if self.talkViewModel.statusView == .loading && self.featuredTalkViewModel.statusView == .loading {
                Indicator()
            }else if self.talkViewModel.statusView == .error || self.featuredTalkViewModel.statusView == .error {
                ErrorView(errorText: self.talkViewModel.errorMessage == "" ? self.featuredTalkViewModel.errorMessage : self.talkViewModel.errorMessage)
                    .onTapGesture {
                        self.talkViewModel.errorMessage == "" ? featuredTalkViewModel.setup() : talkViewModel.setup()
                    }
            }
        }
        .navigationBarColor(UIColor(named: "primaryRed"))
        .navigationBarTitle(Text(LocalizedStringKey("Talks")), displayMode: .inline)
    }
}

struct TalksView_Previews: PreviewProvider {
    static var previews: some View {
        TalksView()
            .environmentObject(TalkViewModel())
            .environmentObject(FeaturedTalkViewModel())
    }
}

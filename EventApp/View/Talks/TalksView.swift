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
        NavigationView {
            VStack {
                if self.talkViewModel.statusView == .complete {
                    ScrollView(.vertical) {
                        
                        FeaturedTalkView(talk: featuredTalkViewModel.repository)
                        
                        ForEach(talkViewModel.repositories, id: \.self) { talkWithEvent in
                            VStack  {
                                VStack {
                                    HStack {
                                        
                                        Text(talkWithEvent.event.title ?? "")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal)
                                            .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
                                        
                                        Spacer()
                                        
                                    }
                                    .environment(\.layoutDirection, Configuration.direction)
                                    .padding(.top)
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(alignment: .top, spacing: 10) {
                                            ForEach(talkWithEvent.talks, id: \.self) { talk in
                                                NavigationLink(destination: TalkDetailView(id: talk.id)) {
                                                    TalkCell(talk: talk)
                                                        .padding(.horizontal,5)
                                                }
                                            }
                                        }
                                        .rotation3DEffect(TalksView.angleScrollView, axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
                                        .buttonStyle(PlainButtonStyle())
                                        .padding(.horizontal)
                                        
                                    }
                                    
                                    .flipsForRightToLeftLayoutDirection(Configuration.direction == .rightToLeft)
                                    .environment(\.layoutDirection, Configuration.direction)
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
            .navigationBarTitle(Text(LocalizedStringKey("Talks")), displayMode: .inline)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TalksView_Previews: PreviewProvider {
    
    static var previews: some View {
        TalksView(talkViewModel: TalkViewModel(), featuredTalkViewModel: FeaturedTalkViewModel())
    }
}

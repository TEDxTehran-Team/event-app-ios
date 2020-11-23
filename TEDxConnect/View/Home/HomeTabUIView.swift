//
//  HomeTabUIView.swift
//  TEDxConnect
//
//  Created by Farshid on 11/5/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI


enum MainViewType {
    case home
    case speakers
    case timeDay
}

struct HomeTabUIView: View {
    
    @State var mainViewType: MainViewType = .home
    
    @ObservedObject var eventViewModel : EventViewModel
    @ObservedObject var dayViewModel : DayViewModel
    @ObservedObject var speakerViewModel:SpeakerViewModel
    
    @State var isShowAbout = false
    
    var body: some View {
        VStack {
            Picker("", selection: self.$mainViewType) {
                Text(LocalizedStringKey("TimeDay"))
                    .tag(MainViewType.timeDay)
                Text(LocalizedStringKey("Speakers"))
                    .tag(MainViewType.speakers)
                Text(LocalizedStringKey("Home"))
                    .tag(MainViewType.home)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding([.top,.horizontal])
            
            if self.mainViewType == .home {
                EventDetailView(viewModel: self.eventViewModel)
            }else if self.mainViewType == .speakers {
                SpeakersView(viewModel: self.speakerViewModel)
            }else {
                TimeTableView(viewModel: self.dayViewModel)
            }
            
            Spacer()
                .background(Colors.primaryLightGray)
                .navigationBarTitle(Text(LocalizedStringKey("Home")), displayMode: .inline)
                .navigationBarItems(trailing: NavigationLink(
                                        destination: AboutView(),
                                        label: {
                                            Image(systemName: "info.circle")
                                        }))
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
}

struct HomeTabUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTabUIView(eventViewModel: EventViewModel(), dayViewModel: DayViewModel(),speakerViewModel:SpeakerViewModel())
    }
}

//
//  EventDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct EventDetailView: View {
  
  @EnvironmentObject var viewModel: EventViewModel
  
  var body: some View {
    GeometryReader { fullView in
      ScrollView(.vertical) {
        ZStack {
          VStack {

            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.banner ?? ""))!)
              .placeholder {
                ImagePlaceholder()
              }
              .resizable()
              .scaledToFill()
              .frame(width: fullView.size.width, height: 200)
              .clipped()
            
            Button(action: {
              
              UIApplication.shared.open(URL(string: self.viewModel.repository.links?.first { $0.role == "live" }?.url ?? Constants.placeholderUrl)!)
              
            }) {
              HStack {
                Spacer()
                Image(systemName: "play.rectangle")
                Text("Watch Live")
                Spacer()
              }
              .padding()
            }
            .customStyle(withBackgroundColor: Colors.primaryRed)
            
            VStack(alignment: .leading) {
              HStack {
                Image(decorative: "clock-icon")
                Text(DateHelper.dateWith(self.viewModel.repository.startDate ?? "TBA", showTime: true))
                Text(DateHelper.dateWith(self.viewModel.repository.endDate  ?? "TBA", showTime: true))
              }
              .padding()
              Divider()
              HStack {
                Image(decorative: "venue-icon")
                Text(self.viewModel.repository.venue?.title ?? "-")
              }
              .padding()
              Divider()
              HStack {
                Image(decorative: "address-icon")
                Text(self.viewModel.repository.venue?.adddress ?? "-")
              }
              .padding()
            }
            .background(Colors.primaryBackground)
            .cornerRadius(10)
            .foregroundColor(.secondary)
            .padding([.horizontal, .bottom])
            
            KFImage(URL(string: Images.urlExtension + (self.viewModel.repository.venue?.mapImage ?? ""))!)
              .placeholder {
                ImagePlaceholder()
              }
              .resizable()
              .scaledToFit()
              .frame(width: fullView.size.width, height: 200)
              .onTapGesture {
                UIApplication.shared.open(URL(string: self.viewModel.repository.venue?.mapLink ?? Constants.placeholderUrl)!)
              }
            
          } // VStack
          if self.viewModel.statusView == .error {
            Text(self.viewModel.errorMessage)
              .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
          }
        } // ZStack
        
      } // ScrollView
      .background(Colors.primaryLightGray)
      
    } // GeometryReader
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Home"), displayMode: .inline)
    .navigationBarItems(trailing: NavigationLink(destination: AboutView(), label: {
      Image(systemName: "info.circle")
        .resizable()
        .frame(width: 24, height: 24)
        .foregroundColor(.white)
    }))
    .onAppear {
      UITableView.appearance().separatorStyle = .none
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  } // Body
  
  
  
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView().environmentObject(EventViewModel())
  }
}

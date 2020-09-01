//
//  EventDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {
  
  @ObservedObject var viewModel = EventViewModel()
  
  var body: some View {
    GeometryReader { geometry in
      
      ScrollView(.vertical) {
        Image(decorative: self.viewModel.repository.banner)
          .resizable()
          .scaledToFit()
          .frame(width: geometry.size.width)
        
        Button(action: {
          print("test")
        }) {
          <#code#>
        }
        
        VStack {
          VStack(alignment: .leading) {
            HStack {
              Image(decorative: "clock-icon")
              Text(DateHelper.dateWith(self.viewModel.repository.startDate, showTime: true))
              Text(DateHelper.dateWith(self.viewModel.repository.endDate, showTime: true))
            }
            .padding()
            Divider()
            HStack {
              Image(decorative: "venue-icon")
              Text(self.viewModel.repository.venue.title)
            }
            .padding()
            Divider()
            HStack {
              Image(decorative: "address-icon")
              Text(self.viewModel.repository.venue.adddress)
            }
            .padding()
          }
          .background(Colors.primaryBackground)
          .cornerRadius(10)
          .foregroundColor(.secondary)
          .padding()
          
          Image(self.viewModel.repository.venue.mapImage)
            .resizable()
            .scaledToFill()
            .frame(width: geometry.size.width)
        }
      }
      .background(Colors.primaryLightGray)
      
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Home"))
    .onAppear {
      UITableView.appearance().separatorStyle = .none
      self.viewModel.setup()
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  }
  
}

struct EventDetailView_Previews: PreviewProvider {
  static var previews: some View {
    EventDetailView()
  }
}

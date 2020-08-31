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
        VStack {
          Image(decorative: self.viewModel.repository.banner)
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width)
          
          VStack {
            HStack {
              Text(self.viewModel.repository.startDate)
              Text(self.viewModel.repository.endDate)
            }
            HStack {
              Text(self.viewModel.repository.venue.title)
            }
            HStack {
              Text(self.viewModel.repository.venue.adddress)
            }
            Image(self.viewModel.repository.venue.mapImage)
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width)
          }
          
        }
      }
      
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

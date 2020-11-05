//
//  SponsorsView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SponsorsView: View {
  
  @ObservedObject var viewModel = SponsorViewModel()
  let eventId: String
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if self.viewModel.repositories.count != 0 {
          ScrollView(.vertical) {
                        
            ForEach(viewModel.repositories, id: \.self) { sponsorWithEvent in
              Group {
                if sponsorWithEvent.sponsors.count != 0 {
                  VStack(alignment: .leading, spacing: 10) {
                    Text(sponsorWithEvent.type.title)
                      .foregroundColor(.secondary)
                      .padding()
                    SponsorsRow(sponsors: sponsorWithEvent.sponsors)
                  }
                } else {
                  EmptyView()
                }
              }
              
            }
            
          }
          .environment(\.layoutDirection, .rightToLeft)
        } else {
          EmptyListView()
            .onTapGesture {
              self.viewModel.setup(withEventId: eventId)
            }
        }
      }
      
      if self.viewModel.statusView == .loading {
        Indicator()
      }
      
      if self.viewModel.statusView == .error {
        ErrorView(errorText: self.viewModel.errorMessage)
          .onTapGesture {
            self.viewModel.setup(withEventId: eventId)
          }
      }
    }
    .onAppear {
      self.viewModel.setup(withEventId: eventId)
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text(LocalizedStringKey("Sponsors")), displayMode: .inline)
  }
}

struct SponsorsView_Previews: PreviewProvider {
  static var previews: some View {
    SponsorsView(eventId: "1")
  }
}

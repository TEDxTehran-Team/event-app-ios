//
//  SpeakersView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SpeakersView: View {
  
  @EnvironmentObject var viewModel: SpeakerViewModel
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if self.viewModel.repositories.count != 0 {
          ScrollView(.vertical) {
            ForEach(viewModel.repositories, id: \.self) { speaker in
              Text(speaker.title)
            }
            .padding()
            .environment(\.layoutDirection, .rightToLeft)
          }
        } else {
          EmptyListView()
            .onTapGesture {
              self.viewModel.setup()
            }
        }
      }
      
      if self.viewModel.statusView == .loading {
        Indicator()
      }
      
      if self.viewModel.statusView == .error {
        Text(self.viewModel.errorMessage)
          .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
          .onTapGesture {
            self.viewModel.setup()
          }
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text(LocalizedStringKey("Speakers")), displayMode: .inline)
  }
}

struct SpeakersView_Previews: PreviewProvider {
  static var previews: some View {
    SpeakersView().environmentObject(SpeakerViewModel())
  }
}

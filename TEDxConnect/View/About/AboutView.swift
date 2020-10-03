//
//  AboutView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  
  @ObservedObject var viewModel = AboutViewModel()
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if self.viewModel.repositories.count != 0 {
          VStack {
            Image(Images.logo)
              .resizable()
              .scaledToFit()
              .frame(width: 300)
              .padding(20)
            
            List(viewModel.repositories, id: \.self) { about in
              NavigationLink(destination: AboutDetailView(about: about)) {
                Text(about.title)
              }
            }
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
    .navigationBarTitle(Text(LocalizedStringKey("About")), displayMode: .inline)
    .onAppear {
      self.viewModel.setup()
    }
  }
  
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}

//
//  NewsView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct NewsView: View {
  
  @EnvironmentObject var viewModel: NewsViewModel
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if viewModel.repositories.count != 0 {
          ScrollView(.vertical) {
            ForEach(viewModel.repositories, id: \.self) { news in
              NewsCardView(news: news)
            }
            .padding()
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
    .navigationBarTitle(Text("News"), displayMode: .inline)
  }
  
}

struct NewsView_Previews: PreviewProvider {
  static var previews: some View {
    NewsView().environmentObject(NewsViewModel())
  }
}

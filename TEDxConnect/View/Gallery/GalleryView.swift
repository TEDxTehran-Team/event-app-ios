//
//  GalleryView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct GalleryView: View {
  
  @EnvironmentObject var viewModel: AlbumViewModel
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if self.viewModel.repositories.count != 0 {
          List(viewModel.repositories, id: \.self) { album in
            GalleryCardView(album: album)
          }
          .listSeparatorStyle(.none)
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
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Gallery"), displayMode: .inline)
    .onAppear {
      UITableView.appearance().separatorStyle = .none
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
  }
  
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView().environmentObject(AlbumViewModel())
  }
}

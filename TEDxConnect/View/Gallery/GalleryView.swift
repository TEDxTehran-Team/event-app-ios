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
          ScrollView(.vertical) {
            ForEach(viewModel.repositories, id: \.self) { album in
              GalleryCardView(album: album)
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
        ErrorView(errorText: self.viewModel.errorMessage)
          .onTapGesture {
            self.viewModel.setup()
          }
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text(LocalizedStringKey("Gallery")), displayMode: .inline)
  }
  
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView().environmentObject(AlbumViewModel())
  }
}

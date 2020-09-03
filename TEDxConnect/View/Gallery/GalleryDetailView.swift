//
//  GalleryDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct GalleryDetailView: View {
  
  @ObservedObject var viewModel = PhotoViewModel()
  
  let album: Album
  let width = (UIScreen.main.bounds.width/3) - 20
  
  var body: some View {
    ZStack {
      GridStack(minCellWidth: width, spacing: 10, numItems: viewModel.repositories.count) { index, cellWidth in
        NavigationLink(destination:
          RemoteImage(type: .url(URL(string: Images.urlExtension + self.viewModel.repositories[index].image)!), errorView: { _ in
            ImagePlaceholder()
          }, imageView: { image in
            image
              .resizable()
              .scaledToFit()
          }, loadingView: {
            Indicator()
          })
        ) {
          
          RemoteImage(type: .url(URL(string: Images.urlExtension + self.viewModel.repositories[index].thumbnail)!), errorView: { _ in
            ImagePlaceholder()
          }, imageView: { image in
            image
              .resizable()
              .scaledToFill()
              .frame(width: cellWidth, height: cellWidth)
          }, loadingView: {
            Indicator()
          })
            .cornerRadius(10)
          
        }
        .buttonStyle(PlainButtonStyle())
      }
      
      if self.viewModel.statusView == .loading {
        Indicator()
      }
      
      if self.viewModel.statusView == .error {
        Text(self.viewModel.errorMessage)
          .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
      }
    }
    .navigationBarTitle(Text(album.title), displayMode: .inline)
    .onAppear {
      self.viewModel.setup(withAlbumId: Int(self.album.id) ?? 0)
    }
  }
  
}

struct GalleryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryDetailView(album: Album.example)
  }
}

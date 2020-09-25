//
//  GalleryDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct GalleryDetailView: View {
  
  @ObservedObject var viewModel = PhotoViewModel()
  
  let album: Album
  let width = (UIScreen.main.bounds.width/3) - 20
  
  var body: some View {
    ZStack {
      GridStack(minCellWidth: width, spacing: 15, numItems: viewModel.repositories.count) { index, cellWidth in
        NavigationLink(destination:
            KFImage(URL(string: Images.urlExtension + self.viewModel.repositories[index].image)!)
            .placeholder {
              ImagePlaceholder()
            }
            .resizable()
            .scaledToFit()
        ) {
        
          KFImage(URL(string: Images.urlExtension + self.viewModel.repositories[index].thumbnail)!)
            .placeholder {
              ImagePlaceholder()
            }
            .resizable()
            .scaledToFill()
            .frame(width: cellWidth, height: cellWidth)
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
          .onTapGesture {
            self.viewModel.setup(withAlbumId: Int(self.album.id) ?? 0)
          }
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

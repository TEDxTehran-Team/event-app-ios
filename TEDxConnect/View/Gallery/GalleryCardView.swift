//
//  GalleryCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct GalleryCardView: View {
  
  let album: Album
  let width = UIScreen.main.bounds.width
  
  var body: some View {
    NavigationLink(destination: GalleryDetailView(album: album)) {
      KFImage(URL(string: Images.urlExtension + album.cover)!)
        .placeholder {
          ImagePlaceholder()
        }
        .resizable()
        .frame(height: 200)
        .overlay(ImageOverlay(text: self.album.title), alignment: .bottomLeading)
        .cornerRadius(10)
        .padding(.vertical, 10)
    }
    
  }
}

struct GalleryCardView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryCardView(album: Album.example)
  }
}

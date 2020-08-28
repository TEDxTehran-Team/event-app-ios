//
//  GalleryCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct GalleryCardView: View {
  
  let album: Album
  
  var body: some View {
    NavigationLink(destination: GalleryDetailView(album: album)) {
      Image(album.cover)
        .resizable()
        .overlay(ImageOverlay(text: album.title), alignment: .bottomLeading)
        .cornerRadius(10)
        .padding(.vertical, 10)
        .frame(height: 200)
    }
  }
}

struct GalleryCardView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryCardView(album: Album.example)
  }
}

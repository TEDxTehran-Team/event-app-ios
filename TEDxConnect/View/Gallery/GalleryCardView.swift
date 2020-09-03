//
//  GalleryCardView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct GalleryCardView: View {
  
  let album: Album
  let width = UIScreen.main.bounds.width
  
  var body: some View {
    ZStack {
      RemoteImage(type: .url(URL(string: Images.urlExtension + album.cover)!), errorView: { error in
        RemoteImageErrorView(errorText: error.localizedDescription)
      }, imageView: { image in
        image
          .resizable()
          .overlay(ImageOverlay(text: self.album.title), alignment: .bottomLeading)
          .cornerRadius(10)
          .padding(.vertical, 10)
      }, loadingView: {
        Indicator()
      })
        .frame(height: 200)
      
      NavigationLink(destination: GalleryDetailView(album: album)) {
        EmptyView()
      }
      .buttonStyle(PlainButtonStyle())
    }
    
  }
}

struct GalleryCardView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryCardView(album: Album.example)
  }
}

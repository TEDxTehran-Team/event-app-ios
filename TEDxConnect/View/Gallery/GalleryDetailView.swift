//
//  GalleryDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct GalleryDetailView: View {
  
  let album: Album
  
  var body: some View {
    List {
      ForEach(album.photo, id:  \.self) { photo in
        ForEach(0..<2) { _ in
          CollectionView(photo: photo)
        }
      }
    }
    .navigationBarTitle(Text(album.title), displayMode: .inline)
    
  }
}

struct CollectionView: View {
  let photo: Album.Photo
  var body: some View {
    VStack {
      HStack {
        ForEach(0..<2) { items in
          Spacer()
          Image(self.photo.thumbnail)
            .resizable()
            .scaledToFill()
            .frame(width: 150, height: 150)
            .foregroundColor(.yellow)
            .cornerRadius(10)
          Spacer()
        }
        .padding(.bottom, 16)
      }
    }
  }
}

struct GalleryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryDetailView(album: Album.example)
  }
}

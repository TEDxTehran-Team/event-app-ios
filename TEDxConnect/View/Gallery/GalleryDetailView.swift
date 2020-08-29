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
  let width = (UIScreen.main.bounds.width/3) - 20
  
  var body: some View {
    
    GridStack(minCellWidth: width, spacing: 10, numItems: album.photo.count) { index, cellWidth in
      NavigationLink(destination: Image(self.album.photo[index].image).resizable().scaledToFit()) {
        Image(self.album.photo[index].thumbnail)
        .resizable()
        .scaledToFill()
        .frame(width: cellWidth, height: cellWidth)
        .cornerRadius(10)
      }
      .buttonStyle(PlainButtonStyle())
    }
    .navigationBarTitle(Text(album.title), displayMode: .inline)
    
  }
  
}

struct GalleryDetailView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryDetailView(album: Album.example)
  }
}

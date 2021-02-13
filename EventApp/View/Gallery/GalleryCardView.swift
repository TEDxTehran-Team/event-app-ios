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
    
    @State var album: Album
    
    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage(URL(string: Images.urlExtension + album.cover)!)
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .padding(.vertical, 10)
            
            HStack {
                ImageOverlay(text: self.album.title)
                Spacer()
            }
            .padding(.bottom,5)
            .environment(\.layoutDirection, Configuration.direction)
            
        }
    }
}

struct GalleryCardView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryCardView(album: Album.example)
    }
}

//
//  SpeakerDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SpeakerDetailView: View {
  
  let speaker: Speaker
  
  var body: some View {
    GeometryReader { geometry in
      
      ScrollView(.vertical) {
        VStack {
          
          KFImage(URL(string: Images.urlExtension + (self.speaker.image))!)
            .placeholder {
              ImagePlaceholder()
            }
            .resizable()
            .scaledToFit()
            .frame(width: geometry.size.width)
          
          
          Text(self.speaker.description)
            .padding()
        }
        .environment(\.layoutDirection, .rightToLeft)
      }
      
    }
    .navigationBarTitle(Text(self.speaker.title), displayMode: .inline)
  }
}

struct SpeakerDetailView_Previews: PreviewProvider {
  static var previews: some View {
    SpeakerDetailView(speaker: Speaker.example)
  }
}

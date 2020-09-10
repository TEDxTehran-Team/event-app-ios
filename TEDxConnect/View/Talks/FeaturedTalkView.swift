//
//  FeaturedTalkView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct FeaturedTalkView: View {
  
  let talk: Talk
  
  var body: some View {
    ZStack {
      RemoteImage(type: .url(URL(string: Images.urlExtension + (talk.section.image))!), errorView: { _ in
        ImagePlaceholder()
      }, imageView: { image in
        image
          .resizable()
          .scaledToFill()
          .frame(height: 200)
          .clipped()
      }, loadingView: {
        Indicator()
      })
        .cornerRadius(10)
      
      //      VStack {
      //        Text(talk.title ?? "")
      //        Text(talk.speakers.map { $0.title }.joined(separator: ", "))
      //      }
    }
    .padding()
  }
}

struct FeaturedTalkView_Previews: PreviewProvider {
  static var previews: some View {
    FeaturedTalkView(talk: Talk.example)
  }
}

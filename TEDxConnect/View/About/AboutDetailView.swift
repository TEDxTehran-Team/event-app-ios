//
//  AboutDetailView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct AboutDetailView: View {
  
  let about: About
  
  var body: some View {
    GeometryReader { geometry in
      
      ScrollView(.vertical) {
        VStack {
          RemoteImage(type: .url(URL(string: Images.urlExtension + (self.about.image ?? ""))!), errorView: { _ in
            ImagePlaceholder()
          }, imageView: { image in
            image
              .resizable()
              .scaledToFit()
              .frame(width: geometry.size.width)
          }, loadingView: {
            Indicator()
          })
          
          
          Text(self.about.description)
            .padding()
        }
      }
      
    }
    .navigationBarTitle(Text(self.about.title), displayMode: .inline)
  }
}

struct AboutDetailView_Previews: PreviewProvider {
  static var previews: some View {
    AboutDetailView(about: About.example)
  }
}

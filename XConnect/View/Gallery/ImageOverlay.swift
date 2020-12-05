//
//  ImageOverlay.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct ImageOverlay: View {
  
  let text: String
  
  var body: some View {
    ZStack {
      Text(text)
        .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
        .padding(10)
        .foregroundColor(.white)
    }
    .background(Color.black)
    .opacity(0.8)
    .cornerRadius(10)
    .padding(10)
  }
}

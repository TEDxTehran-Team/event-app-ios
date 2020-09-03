//
//  ImagePlaceholder.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct ImagePlaceholder: View {
  var body: some View {
    Image(decorative: Images.placeholder)
      .resizable()
      .scaledToFill()
      .frame(maxHeight: 200)
      .clipped()
  }
}

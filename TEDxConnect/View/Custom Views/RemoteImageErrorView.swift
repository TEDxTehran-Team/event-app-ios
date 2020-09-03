//
//  RemoteImageErrorView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct RemoteImageErrorView: View {
  var errorText: String
  
  var body: some View {
    Text(errorText)
      .foregroundColor(.secondary)
      .padding()
  }
  
}

//
//  ErrorView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
  
  let errorText: String
  
  var body: some View {
    VStack(spacing: 20) {
      Image(systemName: "exclamationmark.circle")
        .foregroundColor(Colors.primaryRed)
        .font(.largeTitle)
      Text(errorText)
        .customFont(name: Configuration.shabnam, style: .headline, weight: .medium)
      HStack {
        Image(systemName: "arrow.clockwise")
        Text("Tap to retry".localized())
      }
      .customFont(name: Configuration.shabnam, style: .subheadline, weight: .medium)
      .foregroundColor(Colors.primaryDarkGray)
    }
    .padding()
  }
}

struct ErrorView_Previews: PreviewProvider {
  static var previews: some View {
    ErrorView(errorText: "")
  }
}

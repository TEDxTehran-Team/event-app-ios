//
//  EmptyListView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct EmptyListView: View {
  var body: some View {
    VStack(spacing: 16) {
      Image(decorative: Images.emptyList)
      Text(LocalizedStringKey("No Results Found"))
        .customFont(name: Fonts.shabnam, style: .title3)
        .foregroundColor(.primary)
      Text(LocalizedStringKey("Try Again"))
        .customFont(name: Fonts.shabnam, style: .subheadline)
        .foregroundColor(.secondary)
    }
    
  }
}

struct EmptyListView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyListView()
  }
}

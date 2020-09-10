//
//  TalkCell.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import RemoteImage

struct TalkCell: View {
  
  let talk: Talk
  let cellWidth: CGFloat = 120
  
  var body: some View {
    NavigationLink(destination: TalkDetailView(id: talk.id)) {
      VStack {
        RemoteImage(type: .url(URL(string: Images.urlExtension + talk.section.image)!), errorView: { _ in
          ImagePlaceholder()
            .frame(width: self.cellWidth, height: self.cellWidth)
        }, imageView: { image in
          image
            .resizable()
            .scaledToFill()
            .frame(width: self.cellWidth, height: self.cellWidth)
        }, loadingView: {
          Indicator()
        })
          .cornerRadius(10)
        VStack(alignment: .leading) {
          Text(talk.title )
            .customFont(name: Fonts.shabnam, style: .headline)
          Text(talk.speakers.map { $0.title }.joined(separator: ", "))
            .customFont(name: Fonts.shabnam, style: .subheadline)
            .foregroundColor(.secondary)
        }
      }
      .frame(width: self.cellWidth)
    }
    .buttonStyle(PlainButtonStyle())
    
  }
}

struct TalkCell_Previews: PreviewProvider {
  static var previews: some View {
    TalkCell(talk: Talk.example)
  }
}

//
//  SponsorCell.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct SponsorCell: View {
  
  let sponsor: SponsorWithType.Sponsor
  let cellWidth: CGFloat = 120
  
  var body: some View {
    Button {
      UIApplication.shared.open(URL(string: sponsor.link)!)
    } label: {
      VStack {
        
        KFImage(URL(string: Images.urlExtension + sponsor.logo))
          .placeholder {
            ImagePlaceholder()
          }
          .resizable()
            .aspectRatio(contentMode: .fit)
          .frame(width: self.cellWidth, height: self.cellWidth)
          .cornerRadius(10)
        
        VStack(alignment: .center) {
          Text(sponsor.title)
            .customFont(name: Fonts.shabnam, style: .headline)
            .lineLimit(2)
        }
      }
      .frame(width: self.cellWidth)
      .padding()
    }
  }
  
}

struct SponsorCell_Previews: PreviewProvider {
  static var previews: some View {
    SponsorCell(sponsor: SponsorWithType.Sponsor.example)
  }
}

//
//  TalkRow.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TalksRow: View {
  
  let talks: [Talk]
  @Environment(\.locale) var locale: Locale
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 10) {
        ForEach(0..<talks.count) { index in
          if index == (locale == Locale(identifier: "fa_IR") ? talks.count-1 : 0) {
            TalkCell(talk: self.talks[index])
              .padding(locale == Locale(identifier: "fa_IR") ? .trailing : .leading)
          } else {
            TalkCell(talk: self.talks[index])
          }
        }
      }
      .rotation3DEffect(Angle(degrees: 180), axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
    }
    .flipsForRightToLeftLayoutDirection(true)
  }
}

struct TalkRow_Previews: PreviewProvider {
  static var previews: some View {
    TalksRow(talks: [Talk.example])
  }
}

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
  
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .top, spacing: 10) {
        ForEach(0..<talks.count) { index in
          if index == 0 {
            TalkCell(talk: self.talks[index])
              .padding(.leading)
          } else {
            TalkCell(talk: self.talks[index])
          }
          
        }
      }
    }
  }
}

struct TalkRow_Previews: PreviewProvider {
  static var previews: some View {
    TalksRow(talks: [Talk.example])
  }
}

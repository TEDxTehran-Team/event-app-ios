//
//  SectionView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SectionView: View {
  
  let section: Day.Session.Section
  
  var body: some View {
    HStack {
      Circle()
        .fill(Day.Session.Section.sectionTypeColor(withType: section.type))
        .frame(width: 8, height: 8)
      Text(section.title)
      Spacer()
      Text(DateHelper.ommitSeconds(fromTime: section.startTime))
      Text("to")
      Text(DateHelper.ommitSeconds(fromTime: section.endTime))
    }
    .foregroundColor(.secondary)
    .customFont(name: Fonts.shabnam, style: .body)
  }
}

struct SectionView_Previews: PreviewProvider {
  static var previews: some View {
    SectionView(section: Day.Session.Section.example)
  }
}

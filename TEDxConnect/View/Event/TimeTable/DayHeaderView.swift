//
//  DayHeaderView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct DayHeaderView: View {
  
  let day: Day
  
  var body: some View {
    Text(day.title)
      .padding(.horizontal, 16)
      .padding(.vertical, 10)
      .background(Colors.primaryLightGray)
      .cornerRadius(20)
      .foregroundColor(.secondary)
      .customFont(name: Fonts.shabnam, style: .headline)
  }
}

struct DayHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    DayHeaderView(day: Day.example)
  }
}

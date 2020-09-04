//
//  TimeTableView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TimeTableView: View {
  @ObservedObject var viewModel = DayViewModel()
  
  var body: some View {
    ZStack {
      VStack {
        List {
          ForEach(viewModel.repositories, id: \.self) { day in
            Group {
              DayHeaderView(day: day)
                .padding(.vertical, 4)
              ForEach(day.sessions, id: \.self) { session in
                Group {
                  SessionHeaderView(session: session)
                  ForEach(session.sections, id: \.self) { section in
                    SectionView(section: section)
                  }
                  Divider()
                }
              }
            }
          }
        }
      }
      
      
      if self.viewModel.statusView == .loading {
        Indicator()
      }
      
      if self.viewModel.statusView == .error {
        Text(self.viewModel.errorMessage)
          .customFont(name: Fonts.shabnam, style: .caption1, weight: .medium)
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Timetable"))
    .onAppear {
      UITableView.appearance().separatorStyle = .none
      self.viewModel.setup()
    }
    .onDisappear {
      UITableView.appearance().separatorStyle = .singleLine
    }
    
  }
}

struct TimeTableView_Previews: PreviewProvider {
  static var previews: some View {
    TimeTableView()
  }
}

//
//  TimeTableView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TimeTableView: View {
  
  @EnvironmentObject var viewModel: DayViewModel
  
  var body: some View {
    ZStack {
      if self.viewModel.statusView == .complete {
        if self.viewModel.repositories.count != 0 {
          ScrollView(.vertical) {
            ForEach(viewModel.repositories, id: \.self) { day in
              VStack(alignment: .leading) {
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
            .padding()
          }
        } else {
          EmptyListView()
            .onTapGesture {
              self.viewModel.setup()
            }
        }
      }
      
      if self.viewModel.statusView == .loading {
        Indicator()
      }
      
      if self.viewModel.statusView == .error {
        ErrorView(errorText: self.viewModel.errorMessage)
          .onTapGesture {
            self.viewModel.setup()
          }
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("Timetable".localized()), displayMode: .inline)    
  }
}

struct TimeTableView_Previews: PreviewProvider {
  static var previews: some View {
    TimeTableView().environmentObject(DayViewModel())
  }
}

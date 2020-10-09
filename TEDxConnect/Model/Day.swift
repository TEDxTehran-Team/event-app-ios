//
//  Day.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct Day: Decodable, Hashable {
  
  var title: String
  var sessions: [Session]
  
  struct Session: Decodable, Hashable {
    var title: String
    var startTime: String
    var sections: [Section]
    
    static var example: Session {
      Session(title: "-", startTime: "08:00:00", sections: [Section.example])
    }
    
    struct Section: Decodable, Hashable {
      var title: String
      var type: SectionType
      var startTime: String
      var endTime: String
      
      static var example: Section {
        Section(title: "-", type: .GENERIC, startTime: "08:00:00", endTime: "09:00:00")
      }
      
      enum SectionType: String, Decodable, Hashable {
        case GENERIC, TALK, PERFORMANCE, ACTIVITY, ENTERTAINMENT
      }
      
      static func sectionTypeColor(withType type: SectionType) -> Color {
        switch type {
          case .GENERIC:
            return .red
          case .TALK:
            return .green
          case .PERFORMANCE:
            return .blue
          case .ACTIVITY:
            return .purple
          case .ENTERTAINMENT:
            return .yellow
        }
      }
    }
  }
  
  static var example: Day {
    Day(title: "-", sessions: [Session.example])
  }
  
}

struct DayResponse: Decodable {
  var days: [Day]
}

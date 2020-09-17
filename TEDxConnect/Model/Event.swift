//
//  Event.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Event: Decodable, Hashable {
  
  struct Venue: Decodable, Hashable {
    var title: String
    var adddress: String
    var mapLink: String
    var mapImage: String
    
    static var example: Venue {
      Venue(title: "-", adddress: "-", mapLink: "-", mapImage: Images.example)
    }
  }
  
  struct Link: Decodable, Hashable {
    var role: String
    var url: String
    
    static var example: Link {
      Link(role: "live", url: "http://tedxtehran.com/live")
    }
  }
  
  var title: String?
  var banner: String?
  var startDate: String?
  var endDate: String?
  var links: [Link]?
  var venue: Venue?
  
  static var example: Event {
    Event(title: "-", banner: Images.example, startDate: "2020-09-01T08:00:00+00:00", endDate: "2020-09-01T15:00:00+00:00", links: [Link.example], venue: Venue.example)
  }
  
  static func == (lhs: Event, rhs: Event) -> Bool {
    lhs.title == lhs.title
  }
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(title)
  }
}

struct EventResponse: Decodable {
  var mainEvent: Event
}

//
//  Event.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Event: Codable, Hashable {
  
  struct Venue: Codable, Hashable {
    var title: String
    var adddress: String
    var mapLink: String
    var mapImage: String
    
    static var example: Venue {
      Venue(title: "Milad Tower", adddress: "Cras ipsum risus, elementum vitae aliquet ac, lacinia in neque. Etiam vel purus felis", mapLink: "https://www.google.com/maps/place/Milad+Tower/@35.7448416,51.3753212,15z/data=!4m5!3m4!1s0x0:0x74f5290b67841378!8m2!3d35.7448416!4d51.3753212", mapImage: "Milad")
    }
  }
  
  struct Link: Codable, Hashable {
    var role: String
    var url: String
    
    static var example: Link {
      Link(role: "ticket", url: "http://tedxtehran.com/ticket")
    }
  }
  
  var title: String
  var banner: String
  var startDate: String
  var endDate: String
  var links: [Link]
  var venue: Venue
  
  static var example: Event {
    Event(title: "TEDxTehran 2020: A new chance to live", banner: "about_image_test", startDate: "2020-09-01T08:00:00+00:00", endDate: "2020-09-01T15:00:00+00:00", links: [Link.example], venue: Venue.example)
  }
  
  static func == (lhs: Event, rhs: Event) -> Bool {
    lhs.title == lhs.title
  }
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(title)
  }
}

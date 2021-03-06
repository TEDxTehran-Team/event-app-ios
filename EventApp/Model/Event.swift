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
        var address: String
        var mapLink: String?
        var mapImage: String?
        
        static var example: Venue {
            Venue(title: "-", address: "-", mapLink: "-", mapImage: Images.example)
        }
    }
    
    struct Link: Codable, Hashable {
        var role: String
        var url: String
        
        static var example: Link {
            Link(role: "LIVE", url: "https://tedxtehran.com/live")
        }
    }
    
    var id: String
    var title: String?
    var banner: String?
    var startDate: String?
    var endDate: String?
    var links: [Link]?
    var venue: Venue?
    
    static var example: Event {
        Event(id: "1", title: "-", banner: Images.example, startDate: "2020-09-01T08:00:00+00:00", endDate: "2020-09-01T15:00:00+00:00", links: [Link.example], venue: Venue.example)
    }
    
    //  static func == (lhs: Event, rhs: Event) -> Bool {
    //    lhs.title == lhs.title
    //  }
    //
    //  func hash(into hasher: inout Hasher) {
    //      hasher.combine(title)
    //  }
}

struct EventResponse: Codable,Hashable {
    var mainEvent: Event
}

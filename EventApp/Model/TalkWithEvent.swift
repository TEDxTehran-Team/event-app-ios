//
//  TalkWithEvent.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct TalkWithEevent: Codable,Hashable {
  
  var talks: [Talk]
  var event: Event
  
  static var example: TalkWithEevent {
    TalkWithEevent(talks: [Talk.example], event: Event.example)
  }
  
}

struct TalkWithEventResponse: Codable {
  var talksWithEvent: [TalkWithEevent]
}

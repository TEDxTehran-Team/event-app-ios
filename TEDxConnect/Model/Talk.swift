//
//  Talk.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Talk: Decodable, Hashable {
  
  var id: String
  var title: String
  var description: String?
  var speakers: [Speaker]
  var section: Section
  var videoLink: String?
  var extraLink: String?
  
  struct Speaker: Decodable, Hashable {
    var title: String
    
    static var example: Speaker {
      Speaker(title: "-")
    }
  }
  
  struct Section: Decodable, Hashable {
    var image: String
    
    static var example: Section {
      Section(image: Images.example)
    }
  }
  
  static var example: Talk {
    Talk(id: "0", title: "-", speakers: [Talk.Speaker.example], section: Talk.Section.example)
  }
  
}

struct TalkResponse: Decodable {
  var talks: [Talk]
}

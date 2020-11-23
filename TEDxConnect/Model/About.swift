//
//  About.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct About: Decodable,Hashable {
  var id: String
  var title: String
  var description: String
  var image: String?
  
  static var example: About {
    About(id: "1", title: "-", description: "-", image: Images.example)
  }
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
  }
}

struct AboutResponse: Decodable,Hashable {
  var abouts: [About]
}

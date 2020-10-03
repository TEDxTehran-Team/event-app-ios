//
//  Speaker.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Speaker: Decodable, Hashable {
  var title: String
  var image: String
  var description: String
  
  static var example: Speaker {
    Speaker(title: "", image: Images.example, description: "")
  }
}


struct SpeakerResponse: Decodable {
  var speakers: [Speaker]
}

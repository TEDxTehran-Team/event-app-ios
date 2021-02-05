//
//  Sponsor.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct SponsorWithType: Decodable, Hashable {
  
  var sponsors: [Sponsor]
  var type: SponsorType
  
  struct Sponsor: Decodable, Hashable {
    var title: String
    var logo: String
    var link: String?
    
    static var example: Sponsor {
      Sponsor(title: "-", logo: Images.example, link: "")
    }
  }
  
  struct SponsorType: Decodable, Hashable {
    var title: String
    
    static var example: SponsorType {
      SponsorType(title: "-")
    }
  }
  
  static var example: SponsorWithType {
    SponsorWithType(sponsors: [Sponsor.example], type: SponsorType.example)
  }
  
}

struct SponsorWithTypeResponse: Decodable {
  var sponsorsWithType: [SponsorWithType]
}

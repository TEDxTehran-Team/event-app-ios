//
//  TalkDetail.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct TalkDetail: Decodable {
  
  var talk: Talk
  var suggestedTalk: [Talk]
  
  static var example: TalkDetail {
    TalkDetail(talk: Talk.example, suggestedTalk: [Talk.example])
  }
  
}

//
//  Album.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Album: Codable, Hashable {
  
  var id: Int
  var title: String
  var cover: String
  
  static var example: Album {
    return Album(id: 1, title: "تداکس‌تهران ۲۰۱۹: خوشبینی مسئولانه", cover: "gallery_cover_test")
  }
  
}

//
//  Album.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Album: Codable, Hashable {
  
  struct Photo: Codable, Hashable {
    var image: String
    var thumbnail: String
    
    static var example: Photo {
      Photo(image: "gallery_photo_test", thumbnail: "gallery_photo_test")
    }
  }
  
  var title: String
  var cover: String
  var photo: [Photo]
  
  static var example: Album {
    let photos = [Photo](repeating: Photo.example, count: 10)
    return Album(title: "تداکس‌تهران ۲۰۱۹: خوشبینی مسئولانه", cover: "gallery_cover_test", photo: photos)
  }
  
  static func == (lhs: Album, rhs: Album) -> Bool {
    lhs.title == lhs.title
  }
  
  func hash(into hasher: inout Hasher) {
      hasher.combine(title)
  }
}

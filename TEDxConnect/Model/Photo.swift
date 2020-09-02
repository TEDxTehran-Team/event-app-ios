//
//  Photo.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/1/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Photo: Codable, Hashable {
  var image: String
  var thumbnail: String
  
  static var example: Photo {
    Photo(image: "gallery_photo_test", thumbnail: "gallery_photo_test")
  }
}

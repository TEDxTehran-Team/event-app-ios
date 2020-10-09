//
//  Photo.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/1/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct Photo: Decodable, Hashable {
  var image: String
  var thumbnail: String
  
  static var example: Photo {
    Photo(image: Images.example, thumbnail: Images.example)
  }
}


struct PhotoResponse: Decodable {
  var photo: [Photo]
}

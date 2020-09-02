//
//  PhotoRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/1/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class PhotoRepository {
  
  func get(withAlbumId albumId: Int, completion: @escaping ([Photo]?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetAlbumPhotosQuery(id: albumId)) { result in
      guard let _ = try? result.get().data else { return }
      completion([Photo](repeating: Photo.example, count: 10))
    }
    
  }
  
}

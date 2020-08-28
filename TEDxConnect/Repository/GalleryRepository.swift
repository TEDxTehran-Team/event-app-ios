//
//  GalleryRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class GalleryRepository {
  
  func get(completion: @escaping ([Album]?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetAlbumsQuery()) { result in
      guard let data = try? result.get().data else { return }
    }
    
  }
  
}

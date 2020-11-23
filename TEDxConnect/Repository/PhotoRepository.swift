//
//  PhotoRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/1/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class PhotoRepository {
  
  func get(withAlbumId albumId: Int, completion: @escaping ([Photo]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetAlbumPhotosQuery(id: albumId),cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.album?.decodeModel(type: PhotoResponse.self)
          completion(model?.photo, nil)
      }
    }
    
  }
  
}

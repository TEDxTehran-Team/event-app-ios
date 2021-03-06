//
//  FeaturedTalkRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class FeaturedTalkRepository {
  
  func get(completion: @escaping (Talk?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetFeaturedTalkQuery(),cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.featuredTalk?.decodeModel(type: Talk.self)
          completion(model, nil)
      }
    }
    
  }
  
}

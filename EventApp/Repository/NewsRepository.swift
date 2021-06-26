//
//  NewsRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class NewsRepository {
  
  func get(completion: @escaping ([News]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetNewsQuery(),cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.decodeModel(type: NewsResponse.self)
          completion(model?.news, nil)
      }
    }
    
  }
  
}


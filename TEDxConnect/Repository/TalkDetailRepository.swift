//
//  TalkDetailRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class TalkDetailRepository {
  
  func get(withId id: Int, completion: @escaping (TalkDetail?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetTalkDetailQuery(id: id), cachePolicy: .returnCacheDataAndFetch) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.decodeModel(type: TalkDetail.self)
          completion(model, nil)
      }
    }
    
  }
  
}

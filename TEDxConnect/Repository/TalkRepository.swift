//
//  TalkRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class TalkRepository {
  
  func get(completion: @escaping ([TalkWithEevent]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetTalksQuery()) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.decodeModel(type: TalkWithEventResponse.self)
          completion(model?.talksWithEvent, nil)
      }
    }
    
  }
  
}

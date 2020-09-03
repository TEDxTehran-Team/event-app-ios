//
//  EventRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class EventRepository {
  
  func get(completion: @escaping (Event?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: MainEventInfoQuery()) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.organizer?.mainEvent?.decodeModel(type: Event.self)
          completion(model, nil)
      }
    }
    
  }
  
}

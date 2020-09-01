//
//  EventRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class EventRepository {
  
  func get(completion: @escaping (Event?) -> ()) {
    
    Network.shared.apollo.fetch(query: MainEventInfoQuery()) { result in
      guard let _ = try? result.get().data else { return }
      completion(Event.example)
    }
    
  }
  
}

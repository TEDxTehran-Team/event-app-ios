//
//  AboutRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class AboutRepository {
  
  func get(completion: @escaping ([About]?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetAboutsQuery()) { result in
      guard let _ = try? result.get().data else { return }
      completion([About](repeating: About.example, count: 10))
    }
    
  }
  
}

//
//  NewsRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation
import Apollo

class NewsRepository {
  
  func get(completion: @escaping ([News]?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetAllNewsQuery()) { result in
      guard let _ = try? result.get().data else { return }
      completion([News](repeating: News.example, count: 10))
    }
    
  }
  
}

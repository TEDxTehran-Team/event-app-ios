//
//  DayRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class DayRepository {
  
  func get(completion: @escaping ([Day]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetDaysQuery(), cachePolicy: .returnCacheDataAndFetch) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.organizer?.mainEvent?.decodeModel(type: DayResponse.self)
          completion(model?.days, nil)
      }
    }
    
  }
  
}

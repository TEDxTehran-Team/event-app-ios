//
//  SponsorRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class SponsorRepository {
  
  func get(withEventId eventId: String, completion: @escaping ([SponsorWithType]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetEventSponsorsQuery(eventId: Int(eventId) ?? 1),cachePolicy: .fetchIgnoringCacheCompletely) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.decodeModel(type: SponsorWithTypeResponse.self)
          completion(model?.sponsorsWithType, nil)
      }
    }
    
  }

  
}

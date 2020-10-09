//
//  SpeakerRepository.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class SpeakerRepository {
  
  func get(completion: @escaping ([Speaker]?, XException?) -> ()) {
    
    Network.shared.apollo.fetch(query: GetEventSpeakersQuery(), cachePolicy: .returnCacheDataAndFetch) { result in
      switch result {
        case .failure(let error):
          completion(nil, XException(message: error.localizedDescription, code: 0))
        case .success(let data):
          let model = data.data?.organizer?.mainEvent?.decodeModel(type: SpeakerResponse.self)
          completion(model?.speakers, nil)
      }
    }
    
  }
  
}

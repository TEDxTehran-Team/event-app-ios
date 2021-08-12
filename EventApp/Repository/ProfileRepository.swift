//
//  ProfileRepository.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

class ProfilleRepository {
    func get(withUserId userId: String, completion: @escaping (Profile?, XException?) -> ()) {
        #warning("Complete later when API is available")
        Network.shared.apollo.fetch(query: GetEventSponsorsQuery(eventId: Int(userId) ?? 1),cachePolicy: .fetchIgnoringCacheCompletely) { result in
            switch result {
            case .failure(let error):
                completion(nil, XException(message: error.localizedDescription, code: 0))
            case .success(let data):
                let model = data.data?.decodeModel(type: Profile.self)
                completion(model, nil)
            }
        }
    }
}

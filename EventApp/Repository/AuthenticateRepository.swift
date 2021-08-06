//
//  AuthenticateRepository.swift
//  EventApp
//
//  Created by ali on 8/2/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

class AuthenticateRepository {
    func get(completion: @escaping (Authenticate?, XException?) -> ()) {
        Network.shared.apollo.perform(mutation: GetAuthenticateMutation(phone: "")) { result in
          switch result {
            case .failure(let error):
              completion(nil, XException(message: error.localizedDescription, code: 0))
            case .success(let data):
              let model = data.data?.decodeModel(type: Authenticate.self)
              completion(model, nil)
          }
        }
    }
}

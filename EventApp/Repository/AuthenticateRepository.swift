//
//  AuthenticateRepository.swift
//  EventApp
//
//  Created by ali on 8/2/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

class AuthenticateRepository {
    func getOTP(phoneNumber: String, completion: @escaping (Authenticate?, XException?) -> ()) {
        Network.shared.apollo.perform(mutation: GetAuthenticateMutation(phone: phoneNumber)) { result in
          switch result {
            case .failure(let error):
              completion(nil, XException(message: error.localizedDescription, code: 0))
            case .success(let data):
                let model = data.data?.authenticate?.decodeModel(type: Authenticate.self)
              completion(model, nil)
          }
        }
    }
    
    func sendOTP(token: String, code: String, completion: @escaping (VerifyAuthentication?, XException?) -> ()) {
        Network.shared.apollo.perform(mutation: GetVerifyAuthenticationMutation(token: token, code: code)) { result in
          switch result {
            case .failure(let error):
              completion(nil, XException(message: error.localizedDescription, code: 0))
            case .success(let data):
                let model = data.data?.verifyAuthentication?.decodeModel(type: VerifyAuthentication.self)
              completion(model, nil)
          }
        }
    }
}

//
//  OTPViewModel.swift
//  EventApp
//
//  Created by Alireza on 8/12/21.
//  Copyright © 2021 Alexani. All rights reserved.
//
import SwiftUI

class OTPViewModel: ObservableObject {
    
    var repo = AuthenticateRepository()
    @Published var authentication: VerifyAuthentication!
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    @Published var code: String = ""
    
    func setup(token: String, completion: @escaping (String) -> Void) {
        self.statusView = .loading
        repo.sendOTP(token: token, code: code) { repository, exception  in
            
            if let error = exception {
                self.statusView = .error
                self.errorMessage = error.message
                completion("")
                return
            }
            
            guard let repository = repository else {
                completion("")
                return
            }
            self.statusView = .complete
            self.authentication = repository
            DataManager.shared.refreshToken = repository.refreshToken!
            DataManager.shared.token = repository.token!
            completion(repository.token!)
        }
    }
    
}


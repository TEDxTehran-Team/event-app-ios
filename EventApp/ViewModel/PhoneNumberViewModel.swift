//
//  PhoneNumberViewModel.swift
//  EventApp
//
//  Created by Alireza on 8/12/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

class PhoneNumberViewModel: ObservableObject {
    
    var repo = AuthenticateRepository()
    @Published var authentication: Authenticate!
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    @Published var phoneNumber: String = ""

    
    init() {
        
    }
    
    func setup(completion: @escaping (String) -> Void) {
        self.statusView = .loading
        repo.getOTP(phoneNumber: phoneNumber) { repository, exception  in
            
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
            DataManager.shared.phoneNumber = self.phoneNumber
            completion(repository.token!)
        }
    }
    
}

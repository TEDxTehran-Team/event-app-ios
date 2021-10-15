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
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    @Published var phoneNumber: String = ""

    
    init() {
        
    }
    
    func sendCode(completion: @escaping (String) -> Void) {
        self.statusView = .loading
        repo.getOTP(phoneNumber: phoneNumber) { repository, exception  in
            
            if let error = exception {
                self.statusView = .error
                self.errorMessage = error.message
                completion("")
                return
            }
            
            guard let repository = repository else {
                self.statusView = .error
                self.errorMessage = "Invalid Response Model"
                completion("")
                return
            }
            self.statusView = .complete
            completion(repository.token!)
        }
    }
    
}

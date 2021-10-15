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

    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    @Published var code: String = ""
    
    func login(token: String, completion: @escaping (String) -> Void) {
        self.statusView = .loading
        repo.sendOTP(token: token, code: code) { repository, exception  in
            
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
            DataManager.shared.refreshToken = repository.refreshToken!
            DataManager.shared.token = repository.token!
            completion(repository.token!)
            self.statusView = .complete
        }
    }
    
    func sendCode(phoneNumber: String, completion: @escaping (String) -> Void) {
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


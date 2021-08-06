//
//  AuthenticateViewModel.swift
//  EventApp
//
//  Created by ali on 8/2/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation


class AuthenticateViewModel: ObservableObject {
    
    var repo = AuthenticateRepository()
    @Published var authentication = Authenticate.example
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    
    
    init() {
        setup()
    }
    
    func setup() {
        self.statusView = .loading
        repo.get() { repository, exception  in
            
            if let error = exception {
                self.statusView = .error
                self.errorMessage = error.message
                return
            }
            
            guard let repository = repository else {
                return
            }
            self.statusView = .complete
            self.authentication = repository
        }
    }
    
}

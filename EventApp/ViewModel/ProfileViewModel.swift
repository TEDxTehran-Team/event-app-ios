//
//  ProfileViewModel.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

class ProfileViewModel: ObservableObject {
    
    var repo = ProfilleRepository()
    @Published var repositories = Profile.example
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    
    func setup(withUserId userId: String) {
        self.statusView = .loading
        repo.get(withUserId: userId) { repositories, exception  in
            
            if let error = exception {
                self.statusView = .error
                self.errorMessage = error.message
                return
            }
            
            guard let repositories = repositories else {
                return
            }
            self.statusView = .complete
            self.repositories = repositories
        }
    }
    
}

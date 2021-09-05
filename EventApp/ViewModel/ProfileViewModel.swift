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
    @Published var repositories: ProfileData!
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    
    var firstName: String {
        return repositories.firstName ?? ""
    }
    
    var lastName: String {
        return repositories.firstName ?? ""
    }
    
    var biography: String {
        return repositories.biography ?? ""
    }
    
    var email: String {
        return repositories.email ?? ""
    }

    var phoneNumber: String {
        return repositories.phone ?? ""
    }
    
    var jobTitle: String {
        return repositories.jobTitle ?? ""
    }
    
    var educationField: String {
        return repositories.educationField ?? ""
    }
    
    var interestList: [InterestType] {
        return repositories.interests ?? []
    }
    
    init() {
        setup()
    }
    
    func setup() {
        self.statusView = .loading
        repo.get() { repositories, exception  in
            
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

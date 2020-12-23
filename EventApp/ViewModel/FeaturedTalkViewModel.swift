//
//  FeaturedTalkViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class FeaturedTalkViewModel: ObservableObject {
    
    var repo = FeaturedTalkRepository()
    @Published var repository = Talk.example
    
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
            self.repository = repository
        }
    }
    
}

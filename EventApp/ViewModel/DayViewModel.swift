//
//  DayViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class DayViewModel: ObservableObject {
    
    var repo = DayRepository()
    @Published var repositories = [Day]()
    
    @Published var errorMessage: String = ""
    @Published var statusView: StatusView = .none
    
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

//
//  AboutViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class AboutViewModel: ObservableObject {
  
  var repo = AboutRepository()
  @Published var repositories = [About]()
  
  @Published var errorMessage: String = ""
  @Published var statusView: StatusView = .none
  
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

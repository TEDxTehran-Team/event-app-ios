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
    
  func setup() {
    repo.get() { repositories in
      guard let repositories = repositories else {
        return
      }
      self.repositories = repositories
    }
  }
  
}

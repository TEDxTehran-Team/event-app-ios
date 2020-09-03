//
//  AlbumViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class AlbumViewModel: ObservableObject {
  
  var repo = AlbumRepository()
  @Published var repositories = [Album]()
  
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
      self.statusView = .none
      self.repositories = repositories
    }
  }
  
}

//
//  PhotoViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/1/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class PhotoViewModel: ObservableObject {
  
  var repo = PhotoRepository()
  @Published var repositories = [Photo]()
  
  @Published var errorMessage: String = ""
  @Published var statusView: StatusView = .none
  
  func setup(withAlbumId albumId: Int) {
    self.statusView = .loading
    repo.get(withAlbumId: albumId) { repositories, exception  in
      
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

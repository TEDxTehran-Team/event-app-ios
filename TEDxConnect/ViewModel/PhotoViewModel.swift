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
  
  func setup(withAlbumId albumId: Int) {
    repo.get(withAlbumId: albumId) { repositories in
      guard let repositories = repositories else {
        return
      }
      self.repositories = repositories
    }
  }
  
}

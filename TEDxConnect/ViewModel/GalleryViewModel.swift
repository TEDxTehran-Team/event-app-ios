//
//  GalleryViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class GalleryViewModel: ObservableObject {
  
  var repo = GalleryRepository()
  @Published var repositories = [Album]()
  
  func setup() {
    repo.get() { repositories in
      guard let repositories = repositories else {
        return
      }
      self.repositories = repositories
    }
  }
  
}

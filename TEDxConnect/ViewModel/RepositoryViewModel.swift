//
//  RepositoryViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class RepositoryViewModel: ObservableObject {
  
  var repo = RepositoryRepository()
  @Published var repositories = [Repository]()
    
  func setup(withCount count: Int) {
    repo.get(count: count) { repositories in
     
    }
  }
  
}

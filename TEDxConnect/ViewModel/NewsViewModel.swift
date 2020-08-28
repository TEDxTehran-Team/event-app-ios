//
//  NewsViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class NewsViewModel: ObservableObject {
  
  var repo = NewsRepository()
  @Published var repositories = [News]()
    
  func setup() {
    repo.get() { repositories in
      self.repositories = repositories!
    }
  }
  
}

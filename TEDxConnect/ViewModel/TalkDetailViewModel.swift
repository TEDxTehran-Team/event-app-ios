//
//  TalkDetailViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class TalkDetailViewModel: ObservableObject {
  
  var repo = TalkDetailRepository()
  @Published var repository = TalkDetail.example
  
  @Published var errorMessage: String = ""
  @Published var statusView: StatusView = .none
  
  func setup(withId id: Int) {
    self.statusView = .loading
    repo.get(withId: id) { repository, exception  in
      
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

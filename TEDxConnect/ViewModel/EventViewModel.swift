//
//  EventViewModel.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/31/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

class EventViewModel: ObservableObject {
  
  var repo = EventRepository()
  @Published var repository = Event.example
  
  @Published var errorMessage: String = ""
  @Published var statusView: StatusView = .none
  
  func setup() {
    self.statusView = .loading
    repo.get() { repository, exception  in
      
      if let error = exception {
        self.statusView = .error
        self.errorMessage = error.message
        return
      }
      
      guard let repository = repository else {
        return
      }
      self.statusView = .none
      self.repository = repository
    }
  }
  
}

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
  @Published var event = Event.example
  
  @Published var errorMessage: String = ""
  @Published var statusView: StatusView = .none
    
    
    init() {
        setup()
    }
  
  func setup() {

    self.statusView = .loading
    repo.get() { event, exception  in
      
      if let error = exception {
        self.statusView = .error
        self.errorMessage = error.message
        return
      }
      
      guard let event = event else {
        return
      }
      self.statusView = .complete
      self.event = event
    }
  }
  
}

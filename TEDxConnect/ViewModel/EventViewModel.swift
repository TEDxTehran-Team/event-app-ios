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
  
  func setup() {
    repo.get() { repository in
      guard let repository = repository else {
        return
      }
      self.repository = repository
    }
  }
  
}

//
//  ContentView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/8/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  
  var viewModel = RepositoryViewModel()
  
  var body: some View {
    Text("Test")
    .onAppear {
      self.viewModel.setup(withCount: 5)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}


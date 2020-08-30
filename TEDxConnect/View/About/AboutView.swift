//
//  AboutView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct AboutView: View {
  
  @ObservedObject var viewModel = AboutViewModel()
  
  var body: some View {
    VStack {
      Image("tedx_logo")
        .resizable()
        .scaledToFit()
        .frame(width: 300)
        .padding(20)
      
      List(viewModel.repositories, id: \.self) { about in
        NavigationLink(destination: AboutDetailView(about: about)) {
          Text(about.title)
        }
      }
    }
    .navigationBarColor(UIColor(named: "primaryRed"))
    .navigationBarTitle(Text("About"), displayMode: .inline)
    .onAppear {
      self.viewModel.setup()
    }
  }
  
}

struct AboutView_Previews: PreviewProvider {
  static var previews: some View {
    AboutView()
  }
}

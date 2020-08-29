//
//  NavigationBarModifier.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
  
  var backgroundColor: UIColor?
  
  init( backgroundColor: UIColor?) {
    let coloredAppearance = UINavigationBarAppearance()
    coloredAppearance.configureWithTransparentBackground()
    coloredAppearance.backgroundColor = backgroundColor
    coloredAppearance.titleTextAttributes = [
      .font : CustomFont.set(withSize: 20),
      .foregroundColor: UIColor.white
    ]
    coloredAppearance.largeTitleTextAttributes = [
      .font : CustomFont.set(withSize: 40, withWeight: .bold),
      .foregroundColor: UIColor.white
    ]
    
    UINavigationBar.appearance().standardAppearance = coloredAppearance
    UINavigationBar.appearance().compactAppearance = coloredAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    UINavigationBar.appearance().tintColor = .white
    
  }
  
  func body(content: Content) -> some View {
    content
  }
}

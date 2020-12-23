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
  
  init(backgroundColor: UIColor?) {
//    let coloredAppearance = UINavigationBarAppearance()
//    coloredAppearance.configureWithTransparentBackground()
//    coloredAppearance.backgroundColor = backgroundColor
//    coloredAppearance.titleTextAttributes = [
//      .font : UIFont(name: Fonts.shabnam, size: 17)!]
//    coloredAppearance.largeTitleTextAttributes = [
//      .font : UIFont(name: Fonts.shabnamBold, size: 34)!]
    
//    UINavigationBar.appearance().standardAppearance = coloredAppearance
//    UINavigationBar.appearance().compactAppearance = coloredAppearance
//    UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//    UINavigationBar.appearance().tintColor = .white
    
  }
  
  func body(content: Content) -> some View {
    content
  }
}

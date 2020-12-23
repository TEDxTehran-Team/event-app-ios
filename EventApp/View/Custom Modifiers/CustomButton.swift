//
//  CustomButton.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct CustomButton: ViewModifier {
  
  let backgroundColor: Color
  
  func body(content: Content) -> some View {
    content
      .foregroundColor(.white)
      .background(backgroundColor)
      .cornerRadius(10)
  }
}

extension View {
  func customStyle(withBackgroundColor bgcolor: Color) -> some View {
    self.modifier(CustomButton(backgroundColor: bgcolor))
  }
}

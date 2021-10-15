//
//  View+Extension.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

extension View {
  
  func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
    self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
  }
    static var angleScrollView : Angle {
        return Angle(degrees: Configuration.direction == .rightToLeft ? 180 : 0)
    }
    
    static var alignment:HorizontalAlignment {
        return Configuration.direction == .leftToRight ? .leading : .trailing
    }
    
    static var textAlignment:TextAlignment {
        return Configuration.direction == .leftToRight ? .leading : .trailing
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

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
        return Angle(degrees: Constants.direction == .rightToLeft ? 180 : 0)
    }
    
    static var alignment:HorizontalAlignment {
        return Constants.direction == .leftToRight ? .leading : .trailing
    }
    
    static var textAlignment:TextAlignment {
        return Constants.direction == .leftToRight ? .leading : .trailing
    }

}

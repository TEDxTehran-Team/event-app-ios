//
//  Indicator.swift
//  TEDxConnect
//
//  Created by Farshid on 9/2/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct Indicator : UIViewRepresentable {
  
  func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
    let indi = UIActivityIndicatorView(style: .medium)
    indi.color = .gray
    indi.startAnimating()
    return indi
  }
  func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
    
  }
}

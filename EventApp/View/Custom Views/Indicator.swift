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
        let indi = UIActivityIndicatorView(style: .large)
        indi.color = Colors.primaryRed.uiColor()
        indi.startAnimating()
        return indi
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
        
    }
}

//
//  RoundButton.swift
//  EventApp
//
//  Created by Alireza on 8/21/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct RoundButton: View {
    let text: String
    let width: CGFloat?
    let height: CGFloat?
    let alignment: Alignment?
    var backgroundColor: Color = Colors.primaryRed
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 5
    
    init(_ text: String, width: CGFloat?, height: CGFloat?, alignment: Alignment?, cornerRadius: CGFloat = 5, backgroundColor: Color = Colors.primaryRed, foregroundColor: Color = .white) {
        self.text = text
        self.width = width
        self.height = height
        self.alignment = alignment
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.cornerRadius = cornerRadius
    }
    var body: some View {
        if self.alignment != nil {
            Text(text)
                .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
                .frame(width: width, height: height, alignment: .center)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        } else {
            Text(text)
                .customFont(name: Configuration.shabnam, style: .headline, weight: .regular)
                .frame(width: width, height: height)
                .foregroundColor(foregroundColor)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
        }
    }
}

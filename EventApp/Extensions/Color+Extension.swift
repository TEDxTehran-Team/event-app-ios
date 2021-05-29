//
//  Color+Extension.swift
//  EventApp
//
//  Created by Farshid on 2/13/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation
import SwiftUI

enum Colors {
    static let primaryRed = Color("primaryRed")
    static let primaryBlue = Color("primaryBlue")
    static let primaryLightRed = Color("primaryLightRed")
    static let primaryBackground = Color("primaryBackground")
    static let primaryBarBackground = Color("primaryBarBackground")
    static let primaryLightGray = Color("primaryLightGray")
    static let primaryDarkGray = Color("primaryDarkGray")
}

extension Color {
 
    func uiColor() -> UIColor {

        if #available(iOS 14.0, *) {
            return UIColor(self)
        }

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}

//
//  Constants.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/29/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

enum Constants {
    static let baseUrl = "https://tedxtehran.idearun.co/graphql/"
    static let placeholderUrl = "https://tedxtehran.com/"
    static let acknowledgmentsUrl = "https://trello.com/b/9Vp84PlW"
    
    static var direction:LayoutDirection = .leftToRight
    static var token:String = "56fe1591-c5c1-4113-aba3-73fca1f5aacd"
    static var locale:Locale =  Locale(identifier: "en") //Locale(identifier: "ar_QA")
}

enum Fonts {
    static let shabnam = ""//"Shabnam-FD"
    static let shabnamBold = ""//"Shabnam-Bold-FD"
}

enum Colors {
    static let primaryRed = Color("primaryRed")
    static let primaryLightRed = Color("primaryLightRed")
    static let primaryBackground = Color("primaryBackground")
    static let primaryBarBackground = Color("primaryBarBackground")
    static let primaryLightGray = Color("primaryLightGray")
    static let primaryDarkGray = Color("primaryDarkGray")
}

enum Images {
    static let urlExtension = "https://tedxtehran.idearun.co/media/"
    static let logo = "tedx-logo"
    static let placeholder = "placeholder"
    static let profilePlaceholder = "profile-placeholder"
    static let example = "example-image"
    static let newsIconExample = "zitel"
    static let emptyList = "404"
}

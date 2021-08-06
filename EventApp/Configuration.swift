//
//  Constants.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/29/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI



class Configuration {
//    internal static let baseUrl = "https://tedxtehran.idearun.co/graphql/"
    internal static let baseUrl = "http://3.65.177.235:8000/graphql/"
    internal static let placeholderUrl = "https://tedxtehran.com/"
    internal static let acknowledgmentsUrl = "https://trello.com/b/9Vp84PlW"
    
    internal static var direction:LayoutDirection = .leftToRight
    
    internal static var token:String {
        return "56fe1591-c5c1-4113-aba3-73fca1f5aacd" // English Data Token
        //return "7b9c5f16-0882-4334-a828-e67ce8ccf201" // Persian Data Token
    }
    
    internal static var locale:Locale =  Locale(identifier: "en") //Locale(identifier: "fa_IR")
    
    internal static let shabnam = "" //"Shabnam-FD"
    internal static let shabnamBold = "" //"Shabnam-Bold-FD"
    
}

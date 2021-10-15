//
//  Constants.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/29/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

enum AppLanguage: String {
    case fa, en
    case faIR = "fa-IR"
}

class Configuration {
    internal static let baseUrl = "https://event-app-core.tedxtehran.com/graphql/"
    internal static let placeholderUrl = "https://tedxtehran.com/"
    internal static let acknowledgmentsUrl = "https://trello.com/b/9Vp84PlW"
    
    internal static var direction: LayoutDirection{
        get {
            switch Configuration.appLanguage {
            case .fa, .faIR:
                return .rightToLeft
            case .en:
                return .leftToRight
            }
        }
    }
    
    internal static var token: String {
        get {
            switch Configuration.appLanguage {
            case .fa, .faIR:
                return "7b9c5f16-0882-4334-a828-e67ce8ccf201"
            case .en:
                return "56fe1591-c5c1-4113-aba3-73fca1f5aacd"
            }
        }
    }
    
    internal static var locale:Locale =  Locale(identifier: "en") //Locale(identifier: "fa_IR")
    
    internal static let shabnam = "" //"Shabnam-FD"
    internal static let shabnamBold = "" //"Shabnam-Bold-FD"
    internal static var appLanguage: AppLanguage {
        get {
            return AppLanguage(rawValue: String((Bundle.main.preferredLocalizations.first ?? "en").prefix(2))) ?? .en
        }
    }
    
}

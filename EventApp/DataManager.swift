//
//  DataManager.swift
//  EventApp
//
//  Created by Alireza on 8/12/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

class DataManager {
    
    enum UserDefaultKeys: String {
        case refreshToken, token, phoneNumber
    }

    static var shared = DataManager()
    
    var refreshToken: String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultKeys.refreshToken.rawValue) ?? ""
        }
        set (newValue) {
            UserDefaults.standard.string(forKey: UserDefaultKeys.refreshToken.rawValue)
        }
    }
    
    var token: String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultKeys.token.rawValue) ?? ""
        }
        set (newValue) {
            UserDefaults.standard.string(forKey: UserDefaultKeys.token.rawValue)
        }
    }
    
    var phoneNumber: String {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultKeys.phoneNumber.rawValue) ?? ""
        }
        set (newValue) {
            UserDefaults.standard.string(forKey: UserDefaultKeys.phoneNumber.rawValue)
        }
    }
}

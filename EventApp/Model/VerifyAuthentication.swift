//
//  VerifyAuthentication.swift
//  EventApp
//
//  Created by Alireza on 8/12/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct VerifyAuthentication: Codable {
    
    var success: Bool
    var errors: ErrorModel?
//    var payload: PayLoad?
    var token, refreshToken: String?
    var refreshExpiresIn: Int?
}

struct PayLoad: Codable {
    var phone: String
    var exp, origIat: Int
}

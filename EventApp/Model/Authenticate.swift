//
//  Authenticate.swift
//  EventApp
//
//  Created by ali on 8/2/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Authenticate: Decodable, Hashable {
    static func == (lhs: Authenticate, rhs: Authenticate) -> Bool {
        lhs.token == rhs.token
    }
    
    var success: Bool?
    var errors: ErrorModel?
    var token: String?
}

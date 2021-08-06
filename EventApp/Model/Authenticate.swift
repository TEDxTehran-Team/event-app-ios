//
//  Authenticate.swift
//  EventApp
//
//  Created by ali on 8/2/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Authenticate: Codable {
    var success: Bool
    var errors: ErrorModel?
    var token: String
    
    static var example: Authenticate {
        Authenticate(success: true, errors: nil, token: "sJJEKhnqIDFEaXfAXSpI84GLq8in6k8K")
    }
}

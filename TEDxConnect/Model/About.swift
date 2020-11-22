//
//  About.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/30/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct About: Decodable,Hashable {
    var title: String
    var description: String
    var image: String?
    
    static var example: About {
        About(title: "-", description: "-", image: Images.example)
    }
}

struct AboutResponse: Decodable,Hashable {
    var abouts: [About]
}

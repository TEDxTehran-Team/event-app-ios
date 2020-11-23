//
//  News.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 8/28/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import Foundation

struct News: Decodable, Hashable {
    
    var title: String
    var description: String
    var iconUrl: String?
    var extraLink:String?
    
    static var example: News {
        News(title: "-", description: "-", iconUrl: Images.newsIconExample,extraLink: "")
    }
}

struct NewsResponse: Decodable {
    var news: [News]
}

//
//  User.swift
//  EventApp
//
//  Created by ali on 7/11/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation


struct User: Decodable, Hashable {

    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == lhs.id
    }
    
    var firstName: String
    var lastName: String
    var jobTitle: String
    var id: String
    var imageUrl: String
    var doesNeedProfileUpdate: Bool = false
  
  static var exampleList: [User] {
    [
        User(firstName: "احمد", lastName: "هاشمی", jobTitle: "برنامه نویس بکند", id: "dkfdfkh", imageUrl: "https://i.gadgets360cdn.com/large/loki_tom_hiddleston_crop_1622797154582.jpg?downsize=950:*&output-quality=80&output-format=webp"),
        User(firstName: "اصغر", lastName: "صفایی", jobTitle: "برنامه نویس فرانت", id: "lfejfek", imageUrl: "https://i.gadgets360cdn.com/large/loki_tom_hiddleston_crop_1622797154582.jpg?downsize=950:*&output-quality=80&output-format=webp"),
        User(firstName: "احمد", lastName: "هاشمی", jobTitle: "برنامه نویس iOS", id: "kjsfkjd", imageUrl: "https://i.gadgets360cdn.com/large/loki_tom_hiddleston_crop_1622797154582.jpg?downsize=950:*&output-quality=80&output-format=webp"),
        User(firstName: "احمد", lastName: "هاشمی", jobTitle: "مدیر پروژه", id: "dkjfkd", imageUrl: "https://i.gadgets360cdn.com/large/loki_tom_hiddleston_crop_1622797154582.jpg?downsize=950:*&output-quality=80&output-format=webp"),
        User(firstName: "احمد", lastName: "هاشمی", jobTitle: "برنامه نویس بکند", id: "efefoe", imageUrl: "https://i.gadgets360cdn.com/large/loki_tom_hiddleston_crop_1622797154582.jpg?downsize=950:*&output-quality=80&output-format=webp"),
    ]
  }
}

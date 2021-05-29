//
//  PProfile.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Interest: Identifiable, Codable, Hashable {
    var id: String { interest }
    var interest: String
}

struct Profile: Decodable, Hashable {
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        return lhs.id == lhs.id
    }
    
  
    var interests: [Interest]
    var firstName: String
    var lastName: String
    var jobTitle: String
    var field: String
    var email: String
    var phoneNumber: String
    var story: String
    var id: String
  
  
  static var example: Profile {
    Profile(interests: [Interest(interest: "dkhdhf"), Interest(interest: "dkhdhf"), Interest(interest: "dkhdhf"), Interest(interest: "dkhdhf"), Interest(interest: "dkhdhf"), Interest(interest: "تایبایتابیتلتیللتیبلتیبلتلتیبلتیبتلیبتلیب")], firstName: "علیرضا", lastName: "طغیانی", jobTitle: "برنامه نویس iOS و فلان", field: "علوم کامپیوتر", email: "alirreza@gmail.com", phoneNumber: "09202072717", story: "،پاچ تعنص زا موهفمان یگداس دیلوت اب یگتخاس نتم موسپیا مرو همانزور هکلب نوتم و اهرگپاچ ،تسا کیفارگ ناحارط زا هدافتسا اب  .هگید نیمه مزال هک نانچنآرطس و نوتس رد هلجم و", id: "dkjdk")
  }
  
}

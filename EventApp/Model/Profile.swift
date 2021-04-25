//
//  PProfile.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Profile: Decodable, Hashable {
  
    var interests: [String]
    var firstName: String
    var lastName: String
    var jobTitle: String
    var field: String
    var email: String
    var phoneNumber: String
    var story: String
  
  
  static var example: Profile {
    Profile(interests: ["سنیزیب", "سنیزیب", "برنامه نویسی موبایل"], firstName: "علیرضا", lastName: "طغیانی", jobTitle: "برنامه نویس iOS و فلان", field: "علوم کامپیوتر", email: "alirreza@gmail.com", phoneNumber: "09202072717", story: "،پاچ تعنص زا موهفمان یگداس دیلوت اب یگتخاس نتم موسپیا مرو همانزور هکلب نوتم و اهرگپاچ ،تسا کیفارگ ناحارط زا هدافتسا اب  .هگید نیمه مزال هک نانچنآرطس و نوتس رد هلجم و")
  }
  
}

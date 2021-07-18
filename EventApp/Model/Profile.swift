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
    var image: String

  static var example: Profile {
    Profile(interests: [Interest(interest: "interest"), Interest(interest: "interest"), Interest(interest: "interest"), Interest(interest: "interest"), Interest(interest: "interest"), Interest(interest: "interest interest interest")], firstName: "علیرضا", lastName: "طغیانی", jobTitle: "برنامه نویس iOS و فلان", field: "علوم کامپیوتر", email: "alirreza@gmail.com", phoneNumber: "09202072717", story: "،پاچ تعنص زا موهفمان یگداس دیلوت اب یگتخاس نتم موسپیا مرو همانزور هکلب نوتم و اهرگپاچ ،تسا کیفارگ ناحارط زا هدافتسا اب  .هگید نیمه مزال هک نانچنآرطس و نوتس رد هلجم و", id: "dkjdk", image: "https://sobarnes.com/wp-content/uploads/2021/06/ludmilla-makowski-copie-620x420.jpg?r=0.7776186899060007")
  }
}

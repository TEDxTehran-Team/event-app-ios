//
//  PProfile.swift
//  EventApp
//
//  Created by ali on 4/24/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import Foundation

struct Profile: Decodable, Hashable {
    
    var user: ProfileData
    var errors: ErrorModel?
    var clientMutationId: String
    
    static func == (lhs: Profile, rhs: Profile) -> Bool {
        return lhs.user == lhs.user
    }
}

struct ProfileData: Codable, Hashable {
    var lastLogin, dateJoined: String?
    var isStaff, isActive: Bool?
    var firstName, lastName, email, phone, jobTitle, educationField, biography, id: String?
    var interests: [InterestType]?
    var image: String?
    var pk: Int?
    
    static var example: ProfileData {
        ProfileData(lastLogin: "", dateJoined: "", isStaff: false, isActive: true, firstName: "علیرضا", lastName: "طغیانی", email: "alirreza@gmail.com", phone: "09202072717", jobTitle: "برنامه نویس iOS و فلان", educationField: "کارشناسیی علوم کامپیوتر", biography: "،پاچ تعنص زا موهفمان یگداس دیلوت اب یگتخاس نتم موسپیا مرو همانزور هکلب نوتم و اهرگپاچ ،تسا کیفارگ ناحارط زا هدافتسا اب  .هگید نیمه مزال هک نانچنآرطس و نوتس رد هلجم و", id: "dkjdk", interests: InterestType.exampleList, pk: 0)
    }
    
    static func == (lhs: ProfileData, rhs: ProfileData) -> Bool {
        return lhs.id == lhs.id
    }
}

struct InterestType: Codable, Hashable {
    var id, name: String
    
    static func == (lhs: InterestType, rhs: InterestType) -> Bool {
        return lhs.id == lhs.id
    }
    
    static var shortExample: InterestType {
        InterestType(id: "sdjd", name: "interest")
    }
    
    static var longExample: InterestType {
        InterestType(id: "sddjksd", name: "interest interest interest")
    }
    
    static var exampleList: [InterestType] {
        [
            shortExample,
            shortExample,
            shortExample,
            longExample,
            shortExample,
            shortExample,
            shortExample,
            shortExample,
            longExample,
            longExample,
            longExample,
            shortExample
        ]
    }
}

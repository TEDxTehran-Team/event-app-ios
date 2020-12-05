//
//  DateHelper.swift
//  DealpineCustomer
//
//  Created by Tadeh Alexani on 11/23/19.
//  Copyright © 2019 Zohaw. All rights reserved.
//

import Foundation

class DateHelper {
    static func dateWith(_ date: String, showTime: Bool = false) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        let date = dateFormatter.date(from: date) ?? Date()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
        formatter.calendar = Calendar(identifier: .gregorian)
        if TimeZone.current.isMasterData {
            formatter.calendar = Calendar(identifier: .persian)
        }
        if showTime {
            formatter.dateFormat = "MM/dd  HH:mm"
        }else {
            formatter.dateFormat = "MM/dd"
        }
        
        return formatter.string(from: date)
    }
    
    static func ommitSeconds(fromTime date: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "HH:mm:ss"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let date = dateFormatterGet.date(from: date) else {return "00:00"}
        return dateFormatter.string(from: date)
    }
}


extension TimeZone {
    var token : String {
        if self.isMasterData {
            return "7b9c5f16-0882-4334-a828-e67ce8ccf201"
        }
        return "6f279260-680d-40bd-af33-da3084b43af0"
    }
    
    var isMasterData : Bool {
        return self.identifier.lowercased() == "asia/tehran"
    }
}


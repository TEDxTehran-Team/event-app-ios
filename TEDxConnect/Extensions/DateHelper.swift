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
    let formatter = ISO8601DateFormatter()
    formatter.formatOptions = [.withFullDate,
    .withTime,
    .withDashSeparatorInDate,
    .withColonSeparatorInTime]
    
    let dateFormatter = DateFormatter()
    if showTime {
      dateFormatter.dateFormat = "E, d MMM HH:mm"
    } else {
      dateFormatter.dateFormat = "E, d MMM"
    }
    
    return dateFormatter.string(from: formatter.date(from: date) ?? Date())
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

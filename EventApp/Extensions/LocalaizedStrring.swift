//
//  LocalaizedStrring.swift
//  EventApp
//
//  Created by ali on 4/25/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

extension LocalizedStringKey {
// imagine `self` is equal to LocalizedStringKey("KEY_HERE")

    var stringKey: String {
        let description = "\(self)"
// in this example description will be `LocalizedStringKey(key: "KEY_HERE", hasFormatting: false, arguments: [])`
// for more clarity, `let description = "\(self)"` will have no differences
// compared to `let description = "\(LocalizedStringKey(key: "KEY_HERE", hasFormatting: false, arguments: []))"` in this example.

        let components = description.components(separatedBy: "key: \"")
            .map { $0.components(separatedBy: "\",") }
// here we separate the string by its components.
// in `LocalizedStringKey(key: "KEY_HERE", hasFormatting: false, arguments: [])`
// our key lays between two strings which are `key: "` and `",`.
// if we manage to get what is between `key: "` and `",`, that would be our Localization Key
// which in this example is `KEY_HERE`

        return components[1][0]
// by trial, we know that `components[1][0]` will always be our localization Key
// which is `KEY_HERE` in this example.
    }
}

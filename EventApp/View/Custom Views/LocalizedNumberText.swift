//
//  CustomText.swift
//  EventApp
//
//  Created by Alireza on 8/21/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct LocalizedNumberText: View {
    let text: String

    init(_ text: String) {
        self.text = text
    }
    var body: some View {
        Text(text.localized().normalNumber)
    }
}

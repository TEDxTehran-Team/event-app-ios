//
//  CustomText.swift
//  EventApp
//
//  Created by Alireza on 8/21/21.
//  Copyright © 2021 Alexani. All rights reserved.
//

import SwiftUI

struct LocalizedText: View {
    let text: String

    var body: some View {
        Text(text.localized().normalNumber)
    }
}

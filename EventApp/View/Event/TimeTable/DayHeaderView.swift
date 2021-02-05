//
//  DayHeaderView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct DayHeaderView: View {
    
    let day: Day
    
    var body: some View {
        HStack {
            
            Text(day.title)
                .customFont(name: Fonts.shabnam, style: .body, weight: .bold)
                .padding(.horizontal, 16)
                .padding(.vertical, 5)
                .background(Colors.primaryLightGray)
                .cornerRadius(20)
            
            Spacer()
        }
        
    }
}

struct DayHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        DayHeaderView(day: Day.example)
    }
}

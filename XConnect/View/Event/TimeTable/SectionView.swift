//
//  SectionView.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/4/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SectionView: View {
    
    let section: Day.Session.Section
    
    var body: some View {
        HStack {
            
            Text(DateHelper.ommitSeconds(fromTime: section.endTime))
                .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
            
            Text(LocalizedStringKey("to"))
                .customFont(name: Fonts.shabnam, style: .footnote)
            
            Text(DateHelper.ommitSeconds(fromTime: section.startTime))
                .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
            
            Spacer()
            
            Text(section.title)
                .customFont(name: Fonts.shabnam, style: .footnote, weight: .regular)
                .multilineTextAlignment(.trailing)
            
            Circle()
                .fill(Day.Session.Section.sectionTypeColor(withType: section.type))
                .frame(width: 8, height: 8)
            
        }
        .foregroundColor(.secondary)
        .padding(.horizontal)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView(section: Day.Session.Section.example)
    }
}

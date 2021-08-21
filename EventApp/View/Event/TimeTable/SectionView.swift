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
            Circle()
                .fill(Day.Session.Section.sectionTypeColor(withType: section.type))
                .frame(width: 8, height: 8)
            
            LocalizedNumberText(section.title)
                .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
            
            Spacer()
            
            LocalizedNumberText(DateHelper.ommitSeconds(fromTime: section.startTime))
                .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
            
            Text("to".localized())
                .customFont(name: Configuration.shabnam, style: .footnote)
            
            LocalizedNumberText(DateHelper.ommitSeconds(fromTime: section.endTime))
                .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
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

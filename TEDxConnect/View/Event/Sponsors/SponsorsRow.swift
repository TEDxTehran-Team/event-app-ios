//
//  SponsorsRow.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 10/3/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct SponsorsRow: View {
    
    let sponsors: [SponsorWithType.Sponsor]
    @Environment(\.locale) var locale: Locale
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(0..<sponsors.count) { index in
                    SponsorCell(sponsor: self.sponsors[index])
                }
            }
        }
    }
}

struct SponsorsRow_Previews: PreviewProvider {
    static var previews: some View {
        SponsorsRow(sponsors: [SponsorWithType.Sponsor.example])
    }
}

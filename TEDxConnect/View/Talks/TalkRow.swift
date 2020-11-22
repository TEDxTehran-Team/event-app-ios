//
//  TalkRow.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI

struct TalksRow: View {
    
    @State var talks: [Talk]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 10) {
                ForEach(0..<talks.count) { index in
                    TalkCell(talk: self.talks[index])
                        .padding(.horizontal,5)
                }
            }
            .padding(.horizontal)
            .padding(.horizontal)
        }
    }
}

struct TalkRow_Previews: PreviewProvider {
    static var previews: some View {
        TalksRow(talks: [Talk.example])
    }
}

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
                    NavigationLink(destination: TalkDetailView(id: self.talks[index].id)) {
                    TalkCell(talk: self.talks[index])
                        .padding(.horizontal,5)
                    }
                }
            }
            .rotation3DEffect(TalksView.angleScrollView, axis: (x: CGFloat(0), y: CGFloat(10), z: CGFloat(0)))
           
            .padding(.horizontal)
        }
        .flipsForRightToLeftLayoutDirection(Constants.direction == .rightToLeft)
        .environment(\.layoutDirection, Constants.direction)
    }
}

struct TalkRow_Previews: PreviewProvider {
    static var previews: some View {
        TalksRow(talks: [Talk.example])
    }
}

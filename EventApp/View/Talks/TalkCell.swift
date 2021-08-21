//
//  TalkCell.swift
//  TEDxConnect
//
//  Created by Tadeh Alexani on 9/10/20.
//  Copyright © 2020 Alexani. All rights reserved.
//

import SwiftUI
import struct Kingfisher.KFImage

struct TalkCell: View {
    
    @State var talk: Talk
    
    var body: some View {
        
        VStack {
            
            KFImage(URL(string: Images.urlExtension + talk.section.image))
                .placeholder {
                    ImagePlaceholder()
                }
                .resizable()
                .scaledToFill()
                .frame(width: 130, height: 130)
                .cornerRadius(10)
            
            VStack(alignment: .center) {
                LocalizedNumberText(talk.title)
                    .customFont(name: Configuration.shabnam, style: .caption1, weight: .regular)
                    .lineLimit(2)
                
                LocalizedNumberText(talk.speakers.map { $0.title }.joined(separator: ", "))
                    .customFont(name: Configuration.shabnam, style: .footnote, weight: .regular)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }
        }
        .frame(width: 130, height: 200)
        
    }
}

struct TalkCell_Previews: PreviewProvider {
    static var previews: some View {
        TalkCell(talk: Talk.example)
    }
}
